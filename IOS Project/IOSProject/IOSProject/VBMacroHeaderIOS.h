//
//  VBMacroHeaderIOS.h
//  IOSProject
//
//  Created by Vladimir Budniy on 22.04.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#ifndef VBMacroHeaderIOS_h
#define VBMacroHeaderIOS_h

#define VBGetRootViewAndReturnNilMacro \
        if ([self isViewLoaded] && [self.view isKindOfClass:[VBLabelView class]]) { \
                return (VBLabelView *)self.view; \
                    } \
                        \
                return nil;


#endif /* VBMacroHeaderIOS_h */
