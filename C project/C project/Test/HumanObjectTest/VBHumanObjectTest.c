//
//  VBHumanObjectTest.c
//  C project
//
//  Created by Vladimir Budniy on 08.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBHumanObjectTest.h"
#include "VBHumanObject.h"

#include <stdbool.h>



void VBPrintHumanTests(void){
    VBHumanObject *human = _VBHumanObjectCreate();
    
    VBHumanObjectSetName(human, "Bob");
    VBHumanObjectSetSex(human, "Male");
    VBHumanObjectSetAge(human, 23);
    VBHumanObjectSetChild(human, 3);
    
    
    printf("The name is %s\n", VBHumanObjectGetName(human));
    printf("Th sex is %s\n", VBHumanObjectGetSex(human));
    printf("The age is %d years\n", VBHumanObjectGetAge(human));
    printf("There are %d children\n", VBHumanObjectGetChild(human));

}