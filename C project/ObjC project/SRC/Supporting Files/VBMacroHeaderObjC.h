//
//  VBMacroHeaderObjC.h
//  C project
//
//  Created by Vladimir Budniy on 17.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBMacroHeaderObjC_h
#define VBMacroHeaderObjC_h

#define VBWeakSelfMacro \
            __weak id weakSelf = self \


#define VBStrongSelfAndReturnNilMacro \
            __strong id strongSelf = weakSelf; \
                    if (!strongSelf) { \
                            return; \
                        }

#endif /* VBMacroHeaderObjC_h */
