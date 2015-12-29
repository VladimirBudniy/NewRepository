//
//  VBMacroHeader.h
//  VBMacroTask
//
//  Created by Vladimir Budniy on 28.12.15.
//  Copyright © 2015 Vladimir Budniy. All rights reserved.
//

#ifndef VBMacroHeader_h
#define VBMacroHeader_h


#endif /* VBMacroHeader_h */

// Task 1.1
#define TypeLength(type) \
    printf("%lu\n", sizeof(type)); \

#define VBFirstMacro(valueFirst, valueSecond) \
    if ((valueFirst) > (valueSecond)) { \
        printf("%s", "Error"); \
    } else { \
        printf("%d,\n", ((valueFirst) + (valueSecond))); \
    }

#define EnterLine printf("\n")

// Task 1.2
#define VBPrintValue(qualifier, value) \
                printf(qualifier, value)

//Task 1.3
#define VBPrintTypeValue(type, qualifier) \
        void VBOutput_##type(type value) { \
            VBPrintValue(qualifier, value); \
        }

#define VBPrintValueType(type, value) \
                VBOutput_##type(value)




