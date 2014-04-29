//
//  MDSortableDataSource.m
//  MDSpreadViewDemo
//
//  Created by Dimitri Bouniol on 4/25/14.
//  Copyright (c) 2014 Mochi Development, Inc. All rights reserved.
//

#import "MDSortableDataSource.h"

@implementation MDSortableDataSource

- (id)init
{
    if (self = [super init]) {
        data = [[NSMutableArray alloc] init];
        
        for (int a = 0; a < 2; a++) {
            NSMutableArray *rowSections = [[NSMutableArray alloc] init];
            
            for (int b = 0; b < 2; b++) {
                NSMutableArray *columnSections = [[NSMutableArray alloc] init];
                
                for (int c = 0; c < 20; c++) {
                    NSMutableDictionary *row = [[NSMutableDictionary alloc] init];
                    
                    
                    for (int d = 0; d < 5; d++) {
                        NSMutableString *string = [[NSMutableString alloc] initWithCapacity:10];
                        
                        for (int e = 0; e < 2; e++) {
                            [string appendFormat:@"%c", arc4random_uniform(26) + 'a'];
                        }
                        
                        [row setObject:string forKey:[NSString stringWithFormat:@"column%c", d + 'a']];
                    }
                    
                    [columnSections addObject:row];
                }
                
                [rowSections addObject:columnSections];
            }
            
            [data addObject:rowSections];
        }
    }
    return self;
}

- (NSInteger)numberOfRowSectionsInSpreadView:(MDSpreadView *)aSpreadView
{
    return 2;
}

- (NSInteger)numberOfColumnSectionsInSpreadView:(MDSpreadView *)aSpreadView
{
    return 2;
}

- (NSInteger)spreadView:(MDSpreadView *)aSpreadView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (NSInteger)spreadView:(MDSpreadView *)aSpreadView numberOfColumnsInSection:(NSInteger)section
{
    return 5;
}

- (id)spreadView:(MDSpreadView *)aSpreadView objectValueForRowAtIndexPath:(MDIndexPath *)rowPath forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    return [[[[data objectAtIndex:rowPath.section] objectAtIndex:columnPath.section] objectAtIndex:rowPath.row] objectForKey:[NSString stringWithFormat:@"column%c", (unichar)columnPath.column + 'a']];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInColumnSection:(NSInteger)section forRowAtIndexPath:(MDIndexPath *)rowPath
{
    return [NSString stringWithFormat:@"Row %ld", rowPath.row+1];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInRowSection:(NSInteger)section forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    return [NSString stringWithFormat:@"Column %ld", columnPath.column+1];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInRowSection:(NSInteger)rowSection forColumnSection:(NSInteger)columnSection
{
    return @"•";
}

- (CGFloat)spreadView:(MDSpreadView *)aSpreadView heightForRowHeaderInSection:(NSInteger)rowSection
{
    return 36;
}

#pragma mark - Sorting


//- (MDSortDescriptor *)spreadView:(MDSpreadView *)aSpreadView sortDescriptorPrototypeForHeaderInRowSection:(NSInteger)rowSection forColumnSection:(NSInteger)columnSection;
- (MDSortDescriptor *)spreadView:(MDSpreadView *)aSpreadView sortDescriptorPrototypeForHeaderInRowSection:(NSInteger)section forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    return [MDSortDescriptor sortDescriptorWithKey:[NSString stringWithFormat:@"column%c", (unichar)columnPath.column + 'a'] ascending:YES selectsWholeSpreadView:NO];
}

- (MDSortDescriptor *)spreadView:(MDSpreadView *)aSpreadView sortDescriptorPrototypeForHeaderInColumnSection:(NSInteger)section forRowAtIndexPath:(MDIndexPath *)rowPath
{
    return nil;
}

//- (MDSortDescriptor *)spreadView:(MDSpreadView *)aSpreadView sortDescriptorPrototypeForHeaderInRowSection:(NSInteger)rowSection forColumnFooterSection:(NSInteger)columnSection;
//- (MDSortDescriptor *)spreadView:(MDSpreadView *)aSpreadView sortDescriptorPrototypeForHeaderInColumnSection:(NSInteger)columnSection forRowFooterSection:(NSInteger)rowSection;
//
//- (MDSortDescriptor *)spreadView:(MDSpreadView *)aSpreadView sortDescriptorPrototypeForFooterInRowSection:(NSInteger)rowSection forColumnSection:(NSInteger)columnSection;
//- (MDSortDescriptor *)spreadView:(MDSpreadView *)aSpreadView sortDescriptorPrototypeForFooterInRowSection:(NSInteger)section forColumnAtIndexPath:(MDIndexPath *)columnPath;
//- (MDSortDescriptor *)spreadView:(MDSpreadView *)aSpreadView sortDescriptorPrototypeForFooterInColumnSection:(NSInteger)section forRowAtIndexPath:(MDIndexPath *)rowPath;

- (void)spreadView:(MDSpreadView *)aSpreadView sortDescriptorsDidChange:(NSArray *)oldDescriptors
{
    MDSortDescriptor *firstDescriptor = aSpreadView.sortDescriptors.firstObject;
    [(NSMutableArray *)[[data objectAtIndex:firstDescriptor.rowSection] objectAtIndex:firstDescriptor.columnSection] sortUsingDescriptors:aSpreadView.sortDescriptors];
    [aSpreadView reloadData];
}

@end
