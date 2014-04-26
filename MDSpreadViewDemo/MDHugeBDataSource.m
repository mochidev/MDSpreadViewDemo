//
//  MDHugeBDataSource.m
//  MDSpreadViewDemo
//
//  Created by Dimitri Bouniol on 4/25/14.
//  Copyright (c) 2014 Mochi Development, Inc. All rights reserved.
//

#import "MDHugeBDataSource.h"

@implementation MDHugeBDataSource

#pragma mark - Spread View Datasource

- (NSInteger)spreadView:(MDSpreadView *)aSpreadView numberOfColumnsInSection:(NSInteger)section
{
    return 50;
}

- (NSInteger)spreadView:(MDSpreadView *)aSpreadView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (NSInteger)numberOfColumnSectionsInSpreadView:(MDSpreadView *)aSpreadView
{
    return 100;
}

- (NSInteger)numberOfRowSectionsInSpreadView:(MDSpreadView *)aSpreadView
{
    return 100;
}

#pragma mark Heights
// Comment these out to use normal values (see MDSpreadView.h)
- (CGFloat)spreadView:(MDSpreadView *)aSpreadView heightForRowAtIndexPath:(MDIndexPath *)indexPath
{
    return 30; // 165 cells gives 60 fps. 250 cells gives 50 fps. 600 cells gives 25 fps
}

- (CGFloat)spreadView:(MDSpreadView *)aSpreadView heightForRowHeaderInSection:(NSInteger)rowSection
{
    if (rowSection == 1) return 0;
    return 22;
}

- (CGFloat)spreadView:(MDSpreadView *)aSpreadView heightForRowFooterInSection:(NSInteger)rowSection
{
    if (rowSection <= 2) return 0;
    return 22;
}

- (CGFloat)spreadView:(MDSpreadView *)aSpreadView widthForColumnAtIndexPath:(MDIndexPath *)indexPath
{
    return 140;
}

- (CGFloat)spreadView:(MDSpreadView *)aSpreadView widthForColumnHeaderInSection:(NSInteger)columnSection
{
    if (columnSection == 1) return 0;
    return 110;
}

- (CGFloat)spreadView:(MDSpreadView *)aSpreadView widthForColumnFooterInSection:(NSInteger)columnSection
{
    if (columnSection <= 2) return 0; // uncomment to hide this header!
    return 110;
}

#pragma Cells
- (MDSpreadViewCell *)spreadView:(MDSpreadView *)aSpreadView cellForRowAtIndexPath:(MDIndexPath *)rowPath forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    if (rowPath.row >= 25) return nil; // use spreadView:objectValueForRowAtIndexPath:forColumnAtIndexPath below instead
    
    static NSString *cellIdentifier = @"Cell";
    
    MDSpreadViewCell *cell = [aSpreadView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[MDSpreadViewCell alloc] initWithStyle:MDSpreadViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Test Row %ld-%ld (%ld-%ld)", (long)(rowPath.section+1), (long)(rowPath.row+1), (long)(columnPath.section+1), (long)(columnPath.row+1)];
    cell.textLabel.textColor = [UIColor colorWithRed:(arc4random()%100)/200. green:(arc4random()%100)/200. blue:(arc4random()%100)/200. alpha:1];
    
    return cell;
}
//
//- (MDSpreadViewCell *)spreadView:(MDSpreadView *)aSpreadView cellForHeaderInRowSection:(NSInteger)rowSection forColumnSection:(NSInteger)columnSection
//{
//    static NSString *cellIdentifier = @"CornerHeaderCell";
//
//    MDSpreadViewHeaderCell *cell = (MDSpreadViewHeaderCell *)[aSpreadView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil) {
//        cell = [[[MDSpreadViewHeaderCell alloc] initWithStyle:MDSpreadViewHeaderCellStyleCorner reuseIdentifier:cellIdentifier] autorelease];
//    }
//
//    cell.textLabel.text = [NSString stringWithFormat:@"Cor %d-%d", columnSection+1, rowSection+1];
//
//    return cell;
//}
//
//- (MDSpreadViewCell *)spreadView:(MDSpreadView *)aSpreadView cellForHeaderInRowSection:(NSInteger)section forColumnAtIndexPath:(MDIndexPath *)columnPath
//{
//    static NSString *cellIdentifier = @"RowHeaderCell";
//
//    MDSpreadViewHeaderCell *cell = (MDSpreadViewHeaderCell *)[aSpreadView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil) {
//        cell = [[[MDSpreadViewHeaderCell alloc] initWithStyle:MDSpreadViewHeaderCellStyleRow reuseIdentifier:cellIdentifier] autorelease];
//    }
//
//    cell.textLabel.text = [NSString stringWithFormat:@"Row Header %d (%d-%d)", section+1, columnPath.section+1, columnPath.row+1];
//
//    return cell;
//}
//
//- (MDSpreadViewCell *)spreadView:(MDSpreadView *)aSpreadView cellForHeaderInColumnSection:(NSInteger)section forRowAtIndexPath:(MDIndexPath *)rowPath
//{
//    static NSString *cellIdentifier = @"ColumnHeaderCell";
//
//    MDSpreadViewHeaderCell *cell = (MDSpreadViewHeaderCell *)[aSpreadView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil) {
//        cell = [[[MDSpreadViewHeaderCell alloc] initWithStyle:MDSpreadViewHeaderCellStyleColumn reuseIdentifier:cellIdentifier] autorelease];
//    }
//
//    cell.textLabel.text = [NSString stringWithFormat:@"%d (%d-%d)", section+1, rowPath.section+1, rowPath.row+1];
//
//    return cell;
//}

// either do that ^^ for advanced customization, or this vv and let the cell take care of all the details
// both can be combined if you wanted, by returning nil to the above methods

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInRowSection:(NSInteger)rowSection forColumnSection:(NSInteger)columnSection
{
    return [NSString stringWithFormat:@"H Cor %ld-%ld", (long)(columnSection+1), (long)(rowSection+1)];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInRowSection:(NSInteger)rowSection forColumnFooterSection:(NSInteger)columnSection
{
    return [NSString stringWithFormat:@"B Cor %ld-%ld", (long)(columnSection+1), (long)(rowSection+1)];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInColumnSection:(NSInteger)columnSection forRowFooterSection:(NSInteger)rowSection
{
    return [NSString stringWithFormat:@"A Cor %ld-%ld", (long)(columnSection+1), (long)(rowSection+1)];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForFooterInRowSection:(NSInteger)rowSection forColumnSection:(NSInteger)columnSection
{
    return [NSString stringWithFormat:@"F Cor %ld-%ld", (long)(columnSection+1), (long)(rowSection+1)];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInRowSection:(NSInteger)section forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    return [NSString stringWithFormat:@"H Row %ld (%ld-%ld)", (long)(section+1), (long)(columnPath.section+1), (long)(columnPath.row+1)];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForHeaderInColumnSection:(NSInteger)section forRowAtIndexPath:(MDIndexPath *)rowPath
{
    return [NSString stringWithFormat:@"H Col %ld (%ld-%ld)", (long)(section+1), (long)(rowPath.section+1), (long)(rowPath.row+1)];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForFooterInRowSection:(NSInteger)section forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    return [NSString stringWithFormat:@"F Row %ld (%ld-%ld)", (long)(section+1), (long)(columnPath.section+1), (long)(columnPath.row+1)];
}

- (id)spreadView:(MDSpreadView *)aSpreadView titleForFooterInColumnSection:(NSInteger)section forRowAtIndexPath:(MDIndexPath *)rowPath
{
    return [NSString stringWithFormat:@"F Col %ld (%ld-%ld)", (long)(section+1), (long)(rowPath.section+1), (long)(rowPath.row+1)];
}

- (id)spreadView:(MDSpreadView *)aSpreadView objectValueForRowAtIndexPath:(MDIndexPath *)rowPath forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    return [NSString stringWithFormat:@"Cell %ld-%ld (%ld-%ld)", (long)(rowPath.section+1), (long)(rowPath.row+1), (long)(columnPath.section+1), (long)(columnPath.row+1)];
}

- (void)spreadView:(MDSpreadView *)aSpreadView didSelectCellForRowAtIndexPath:(MDIndexPath *)rowPath forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    [aSpreadView deselectCellForRowAtIndexPath:rowPath forColumnAtIndexPath:columnPath animated:YES];
    NSLog(@"Selected %@ x %@", rowPath, columnPath);
}

- (MDSpreadViewSelection *)spreadView:(MDSpreadView *)aSpreadView willHighlightCellWithSelection:(MDSpreadViewSelection *)selection
{
    return [MDSpreadViewSelection selectionWithRow:selection.rowPath column:selection.columnPath mode:MDSpreadViewSelectionModeRowAndColumn];
}

- (MDSpreadViewSelection *)spreadView:(MDSpreadView *)aSpreadView willSelectCellWithSelection:(MDSpreadViewSelection *)selection
{
    return [MDSpreadViewSelection selectionWithRow:selection.rowPath column:selection.columnPath mode:MDSpreadViewSelectionModeRowAndColumn];
}

@end
