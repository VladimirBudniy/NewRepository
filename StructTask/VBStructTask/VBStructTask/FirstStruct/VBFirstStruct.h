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

typedef struct {
    bool bool1;
    long long ll2;
    bool bool3;
    bool bool4;
    short short5;
    bool bool6;
    short short11;
    float float7;
    bool bool8;
    int int9;
    double double10;
    bool bool12;
    short short13;
    char *string14;
} RandomLocation;

typedef struct {
    long long ll2;
    char *string14;
    double double10;
    int int9;
    float float7;
    short short5;
    short short13;
    short short11;
    bool bool1;
    bool bool3;
    bool bool4;
    bool bool6;
    bool bool8;
    bool bool12;
} TypeLocation;

typedef struct {
    long long ll2;
    char *string14;
    double double10;
    int int9;
    float float7;
    short short5;
    short short13;
    short short11;
    
    union {
        struct {
            bool bool1 : 1;
            bool bool3 : 1;
            bool bool4 : 1;
            bool bool6 : 1;
            bool bool8 : 1;
            bool bool12 : 1;
        };
    };
} LocationBool;





