#include "NDDEMO/dt/DTPlayer.h"
#include <cmath>

void DTPlayer::normalize(Vec* src, Vec* dst) {
    float a = 1.0f / sqrtf(src->magnitude());
    dst->x = src->x * a;
    dst->y = src->y * a;
    dst->z = src->z * a;
}