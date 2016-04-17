//
//  VBMacroHeaderObjC.h
//  C project
//
//  Created by Vladimir Budniy on 17.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBMacroHeaderObjC_h
#define VBMacroHeaderObjC_h

#define VBWeakSelfLinkMacro(Class, object) \
            __weak Class *weakSelf = object \


#define VBStrongSelfLinkMacro(Class) \
            __strong Class *strongSelf = weakSelf; \
                    if (!strongSelf) { \
                            return; \
                        }

#endif /* VBMacroHeaderObjC_h */
