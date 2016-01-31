//
//  VBDynamicArray.c
//  C project
//
//  Created by Vladimir Budniy on 31.01.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#include "VBDynamicArray.h"

#include <stdlib.h>
#include <assert.h>

void *VBArrayCreateDynamicArray(void) {
    int *array = malloc(sizeof(int));
    assert(array);
    
    free(array);
    
    return array;
}



