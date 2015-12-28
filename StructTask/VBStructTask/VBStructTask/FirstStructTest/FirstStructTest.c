//
//  FirstStructTest.c
//  VBStructTask
//
//  Created by Vladimir Budniy on 28.12.15.
//  Copyright © 2015 Vladimir Budniy. All rights reserved.
//

#include "FirstStructTest.h"
#include "VBFirstStruct.h"

// Test 1.
void VBPrintSequenceNumber() {
    printf("%s\n\n", "      Test offsetof");
    printf("Point  1   %lu\t %lu\n", offsetof(RandomLocation, bool1), offsetof(TypeLocation, bool1));
    printf("Point  2   %lu\t %lu\n", offsetof(RandomLocation, ll2), offsetof(TypeLocation, ll2));
    printf("Point  3  %lu\t %lu\n", offsetof(RandomLocation, bool3), offsetof(TypeLocation, bool3));
    printf("Point  4  %lu\t %lu\n", offsetof(RandomLocation, bool4), offsetof(TypeLocation, bool4));
    printf("Point  5  %lu\t %lu\n", offsetof(RandomLocation, short5), offsetof(TypeLocation, short5));
    printf("Point  6  %lu\t %lu\n", offsetof(RandomLocation, bool6), offsetof(TypeLocation, bool6));
    printf("Point  7  %lu\t %lu\n", offsetof(RandomLocation, float7), offsetof(TypeLocation, float7));
    printf("Point  8  %lu\t %lu\n", offsetof(RandomLocation, bool8), offsetof(TypeLocation, bool8));
    printf("Point  9  %lu\t %lu\n", offsetof(RandomLocation, int9), offsetof(TypeLocation, int9));
    printf("Point 10  %lu\t %lu\n", offsetof(RandomLocation, double10), offsetof(TypeLocation, double10));
    printf("Point 11  %lu\t %lu\n", offsetof(RandomLocation, short11), offsetof(TypeLocation, short11));
    printf("Point 12  %lu\t %lu\n", offsetof(RandomLocation, bool12), offsetof(TypeLocation, bool12));
    printf("Point 13  %lu\t %lu\n", offsetof(RandomLocation, short13), offsetof(TypeLocation, short13));
    printf("Point 14  %lu\t %lu\n", offsetof(RandomLocation, string14), offsetof(TypeLocation, string14));
    printf("\n");
}

// Test 2. Print size the whole struct
void VBPrintSizeStruct() {
    printf("Size the whole struct's -  %lu %lu %lu\n",
           sizeof(RandomLocation), sizeof(TypeLocation),
           sizeof(LocationBool));
}


// Test
void VBPrintSizeType() {
    printf("\n");
    printf("%lu\n", sizeof(bool));
    printf("%lu\n", sizeof(short));
    printf("%lu\n", sizeof(float));
    printf("%lu\n", sizeof(int));
    printf("%lu\n", sizeof(double));
    printf("%lu\n", sizeof(char *));
    printf("%lu\n", sizeof(long long));
}



