//
//  VBModel.m
//  IOSProject
//
//  Created by Vladimir Budniy on 23.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBModel.h"

@interface VBModel ()

- (void)prepareToLoad;
- (void)changeState;
- (void)save;


@end

@implementation VBModel

#pragma mark -
#pragma mark Initializations and Deallocatins

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(save)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(save)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)prepareToLoad {
    
}

- (void)changeState {
    self.state = kVBModelLoadedState;
}

- (void)save {
    
}

#pragma mark - 
#pragma mark Public

- (void)load {
    if (self.state == kVBModelLoadingState) {
        return;
    } else {
        self.state = kVBModelLoadingState;
    }
    
    VBWeakSelfMacro;
    VBDispatchAsyncInBackground(^{
        sleep(3);
        VBStrongSelfAndReturnNilMacroWithClass(VBModel)
        [strongSelf prepareToLoad];
        VBDispatchAsyncOnMainThread(^{
            [strongSelf changeState];
        });
    });
}

@end
