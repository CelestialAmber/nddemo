


.global tolower
tolower:
/* 8005FF90 0005BF10  2C 03 FF FF */	cmpwi r3, -0x1
/* 8005FF94 0005BF14  40 82 00 0C */	bne .L_8005FFA0
/* 8005FF98 0005BF18  38 60 FF FF */	li r3, -0x1
/* 8005FF9C 0005BF1C  4E 80 00 20 */	blr
.L_8005FFA0:
/* 8005FFA0 0005BF20  3C 80 80 06 */	lis r4, __lower_map@ha
/* 8005FFA4 0005BF24  54 63 06 3E */	clrlwi r3, r3, 24
/* 8005FFA8 0005BF28  38 04 49 90 */	addi r0, r4, __lower_map@l
/* 8005FFAC 0005BF2C  7C 60 1A 14 */	add r3, r0, r3
/* 8005FFB0 0005BF30  88 63 00 00 */	lbz r3, 0x0(r3)
/* 8005FFB4 0005BF34  4E 80 00 20 */	blr
