//
//  VBHumanObject.c
//  C project
//
//  Created by Vladimir Budniy on 08.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include <stdbool.h>
#include <string.h>

#include "VBHumanObject.h"

struct VBHumanDataObject {
    VBHumanObject *parents;
    VBHumanObject *partner;
    VBHumanObject *children[20];
    int8_t *_name;
    int8_t _age;
    int8_t _children;
    bool _sex;
    bool _married;
};



#pragma mark-
#pragma mark Initialization & Deallocation




#pragma mark-
#pragma mark Accessors