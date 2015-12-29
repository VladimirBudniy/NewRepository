//
//  VBFirstStruct.h
//  VBStructTask
//
//  Created by Vladimir Budniy on 28.12.15.
//  Copyright © 2015 Vladimir Budniy. All rights reserved.
//

#ifndef VBFirstStruct_h
#define VBFirstStruct_h

#endif /* VBFirstStruct_h */

#include <stdio.h>
#include <stdbool.h>
#include <stddef.h>

#define PrintNextString \
    printf("\n");

#define PrintComment \
    printf("%s", "etc...");

typedef struct {
    bool bool1; // 1
    long long ll2; // 8
    bool bool3; // 1
    bool bool4; // 1
    short short5; // 2
    bool bool6; // 1
    short short11; // 2
    float float7; // 4
    bool bool8; // 1
    int int9; // 4
    double double10; // 8
    bool bool12; // 1
    short short13; // 2
    char *string14; // 8
} RandomLocation;

typedef struct {
    long long ll2; // 8
    char *string14; // 8
    double double10; // 8
    int int9; // 4
    float float7; // 4
    short short5; // 2
    short short13; // 2
    short short11; // 2
    bool bool1; // 1
    bool bool3; // 1
    bool bool4; // 1
    bool bool6; // 1
    bool bool8; // 1
    bool bool12; // 1
} TypeLocation;

typedef struct {
    long long ll2;          // 8
    char *string14;         // 8
    double double10;        // 8
    int int9;               // 4
    float float7;           // 4
    short short5;           // 2
    short short13;          // 2
    short short11;          // 2
    
    union {                 // 1
        struct {
            bool bool1 : 1;
            bool bool3 : 1;
            bool bool4 : 1;
            bool bool6 : 1;
            bool bool8 : 1;
            bool bool12 : 1;
        };
        char BoolStruct;
    };
} LocationBool;





