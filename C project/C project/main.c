//
//  main.c
//  C project
//
//  Created by Vladimir Budniy on 29.12.15.
//  Copyright © 2015 Vladimir Budniy. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>
#include <stddef.h>

#include "VBMacroHeader.h"
#include "VBString.h"
#include "VBHuman.h"
#include "VBLinkedList.h"
#include "VBArray.h"

int main(int argc, const char * argv[]) {
    VBString *string = VBStringCreateWithData("Test");
    VBString *string1 = VBStringCreateWithData("SecondTest");
    VBString *string2 = VBStringCreateWithData("ThirdTest");
    VBString *string3 = VBStringCreateWithData("ThirdTest");
    VBArray *array = VBArrayCreate();


    
    VBLinkedList *list = VBLinkedlistCreate();
    VBLinkedListAddObject(list, string);
    VBLinkedListAddObject(list, string1);
    VBLinkedListAddObject(list, string2);
    VBLinkedListAddObject(list, string3);
    VBLinkedListAddObject(list, array);

//    VBLInkedListRemoveAllObjects(list);
    
    VBLinkedListRemoveObject(list, string);
    VBLinkedListRemoveObject(list, array);


    
    return 0;
}
