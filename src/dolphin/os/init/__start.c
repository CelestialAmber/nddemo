#include "PowerPC_EABI_Support/MetroTRK/dolphin_trk.h"
#include "dolphin/DB.h"
#include "dolphin/OS.h"
#include <string.h>

DECL_SECTION(".init") DECL_WEAK void __start(void);
int main(int argc, char** argv);

DECL_SECTION(".init") static void __check_pad3(void) {
    if ((OS_GC_PAD_3_BTN & 0x0EEF) == 0x0EEF) {
        OSResetSystem(0, 0, 0);
    }
}

asm void __start(void) {
    nofralloc

    // Setup hardware
    bl __init_registers
    bl __init_hardware

    // Create first stack frame
    li r0, -1
    // Parameter save
    stwu r1, -8(r1)
    // LR save (-1 to signify first frame)
    stw r0, 4(r1)
    // Back chain (-1 to signify first frame)
    stw r0, 0(r1)

    // Setup ROM/BSS
    bl __init_data

    // Clear debugger exception mask
    li r0, 0
    lis r6, (OS_DEBUG_INTERFACE + OSDebugInterface.exceptionMask)@ha
    addi r6, r6, (OS_DEBUG_INTERFACE + OSDebugInterface.exceptionMask)@l
    stw r0, 0(r6)

    /**
     * Check the BI2 debug flag to determine how to call InitMetroTRK.
     *
     * This can be done by either checking the value from the DVD
     * (OSBI2.debugFlag), or by checking the global OS_BI2_DEBUG_FLAG.
     * 
     * If the DVD BI2 is available, it is prioritized over the global value.
     */
    lis r6, OS_DVD_BI2@ha
    addi r6, r6, OS_DVD_BI2@l
    lwz r6, 0(r6)
    cmplwi r6, 0
    beq _check_for_exec_args // <- NULL BI2, try the OS global

    // Use the DVD's flag
    lwz r7, OSBI2.debugFlag(r6)

    li r5, 0
    cmplwi r7, 2
    beq _call_init_metro_trk

    cmplwi r7, 3
    bne _check_for_exec_args
    li r5, 1

    /**
     * Call InitMetroTRK
     * The MetroTRK hardware ID is specified in r5
     */
_call_init_metro_trk:
    lis r6, InitMetroTRK@ha
    addi r6, r6, InitMetroTRK@l
    mtlr r6
    blrl

    /**
     * After setting up the hardware and the debugger, we next setup
     * the program arguments. This label checks whether any arguments
     * exist.
     *
     * BI2 contains an offset from itself to the argument data, which
     * is formatted as follows:
     *
     * typedef struct BI2Args {
     *     int argc;
     *     union {
     *         char* argument;
     *         u32 offset;
     *     } argv[];
     * } BI2Args;
     */
_check_for_exec_args:
    lis r6, OS_DVD_BI2@ha
    addi r6, r6, OS_DVD_BI2@l
    lwz r5, 0(r6)
    cmplwi r5, 0
    beq+ _no_args // <- No BI2 to get args from

    lwz r6, OSBI2.argumentOfs(r5)
    cmplwi r6, 0
    beq+ _no_args // <- Invalid argument offset in BI2

    // Calculate pointer to argument data
    add r6, r5, r6
    // First integer value is the argument count
    lwz r14, 0(r6)
    cmplwi r14, 0
    beq _no_args // <- Argument count is zero

    // BI2 args + 0x8, used to adjust MEM1 later
    addi r15, r6, 4
    // Move argc to the counter to prepare the loop
    mtctr r14

    /**
     * This loop unpacks the arguments by converting them from offsets
     * to pointers, in-place.
     *
     * The offsets are relative to the start of the BI2, so we just
     * add the offset to the BI2 pointer and write it back.
     */
_unpack_args_loop:
    // Skip over argc
    addi r6, r6, 4
    // Load argument offset
    lwz r7, 0(r6)
    // Convert offset to pointer
    add r7, r7, r5
    // Store pointer
    stw r7, 0(r6)
    bdnz _unpack_args_loop


    lis r5, (OS_BOOT_INFO + OSBootInfo.arenaHi)@ha
    addi r5, r5, (OS_BOOT_INFO + OSBootInfo.arenaHi)@l
    clrrwi r7, r15, 5
    stw r7, 0(r5)
    b _init_os

    /**
     * Either there was no BI2 available, or it did not contain any arguments
     */
_no_args:
    li r14, 0 // argc = 0
    li r15, 0 // argv = NULL

    /**
     * Here, the OS and its debug monitor are initialized, and
     * then we check if we should call __check_pad3.
     *
     * __check_pad3 is called before future initialization if:
     * 1. Bit 0 in the DVD device code address is NOT set ((code & 0x8000) == 0x0000)
     * 2. The DVD device code address ends in 001 ((code & 0x7FFF) == 0x0001)
     *
     * OSGetConsole type also uses the DVD device code address, but none
     * of its results seem to match anything that would meet these
     * requirements.
     *
     * The apploader reads the button state of the fourth GCN controller
     * and writes it to GC_PAD_3_BTN (zero-indexed), which is used in
     * __check_pad3. WiiBrew states that this is for GameCube NR disc
     * support, so that could explain the unusual DVD device code address.
     */
_init_os:
    // Initialize the OS and its debug monitor
    bl DBInit
    bl OSInit

    // Load DVD device code address
    lis r4, OS_DVD_DEVICE_CODE_ADDR@ha
    addi r4, r4, OS_DVD_DEVICE_CODE_ADDR@l
    lhz r3, 0(r4)
    // Checking bit 0 in the device code address
    andi. r5, r3, 0x8000
    beq _call_check_pad3 // <- Bit 0 is NOT set
    // Checking for X001 device code address
    andi. r3, r3, 0x7FFF // ~0x8000
    cmplwi r3, 1
    bne _after_init_metro_trk_bba // <- NOT X001 device code address
_call_check_pad3:
    bl __check_pad3

    /**
     * 1. Initialize C++ runtime
     * 2. Call main(argc, argv)
     * 3. Teardown C++ runtime
     */
_after_init_metro_trk_bba:
    bl __init_user
    mr r3, r14
    mr r4, r15
    bl main
    b exit // <- Will halt CPU
    }

DECL_SECTION(".init") static void __copy_rom_section(void* dst, const void* src, size_t size) {
    if (size == 0 || dst == src) {
        return;
    }

    memcpy(dst, src, size);
    __flush_cache(dst, size);
}

DECL_SECTION(".init") static void __init_bss_section(void* dst, size_t size) {
    if (size == 0) {
        return;
    }

    memset(dst, 0, size);
}

DECL_SECTION(".init") static asm void __init_registers(void) {
    nofralloc

    lis r1, _stack_addr@h
    ori r1, r1, _stack_addr@l
    lis r2, _SDA2_BASE_@h
    ori r2, r2, _SDA2_BASE_@l
    lis r13, _SDA_BASE_@h
    ori r13, r13, _SDA_BASE_@l
    blr
}

DECL_SECTION(".init") static void __init_data(void) {
    const __rom_copy_info* rs;
    const __bss_init_info* bs;

    rs = _rom_copy_info;
    while (TRUE) {
        if (rs->size == 0) {
            break;
        }

        __copy_rom_section(rs->addr, rs->rom, rs->size);
        rs++;
    }

    bs = _bss_init_info;
    while (TRUE) {
        if (bs->size == 0) {
            break;
        }

        __init_bss_section(bs->addr, bs->size);
        bs++;
    }
}
