//
//  VBMacroHeader.h
//  VBMacroTask
//
//  Created by Vladimir Budniy on 28.12.15.
//  Copyright © 2015 Vladimir Budniy. All rights reserved.
//

#ifndef VBMacroHeader_h
#define VBMacroHeader_h

// Task 1.1
#define VBTypeLength(type) \
    printf("%lu\n", sizeof(type));

#define VBFirstMacro(valueFirst, valueSecond) \
    if ((valueFirst) > (valueSecond)) { \
        printf("%s", "Error"); \
    } else { \
        printf("%d,\n", ((valueFirst) + (valueSecond))); \
    }

#define VBPrintNextString \
    printf("\n");

// Task 1.2
#define VBPrintValue(qualifier, value) \
                printf(#qualifier, value)

//Task 1.3
#define VBPrintTypeValue(type, qualifier) \
        void VBOutput_##type(type value) { \
            VBPrintValue(qualifier, value); \
        }

#define VBPrintValueType(type, value) \
                VBOutput_##type(value)


#define VBReturnMacro(value) \
            if (NULL == value) { \
            return; \
        }

#define VBReturnValueMacro(value, returnValue) \
            if (NULL == value) { \
                return returnValue; \
            }


//#define VBReturnValueMacro(value) \
//                if (NULL == value) { \
//                    return 0; \
//                }

//#define VBReturnNullMacro(value) \
//            if (NULL == value) { \
//                    return NULL; \
//            }

#define VBAssignMacro(oldValue, newValue) \
                oldValue = newValue \

#define VBRetainMacro(oldValue, newValue) \
        if (oldValue != newValue) { \
            VBObjectRetain(newValue); \
            VBObjectRelease(oldValue); \
            oldValue = newValue; \
        }

#endif /* VBMacroHeader_h */
