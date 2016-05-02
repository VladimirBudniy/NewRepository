//
//  VBTableView.m
//  IOSProject
//
//  Created by Vladimir Budniy on 02.05.16.
//  Copyright © 2016 Vladimir Budniy. All rights reserved.
//

#import "VBTableView.h"

@interface VBTableView ()
@property (nonatomic, retain) NSMutableArray *arrayItems;

@end

@implementation VBTableView

//#pragma mark -
#pragma mark Initializations and Deallocatins

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.arrayItems = [[NSMutableArray alloc] initWithObjects:@"One", @"Two", @"Three", nil];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayItems count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifire = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifire forIndexPath:indexPath];
    
    return cell;
}

@end
