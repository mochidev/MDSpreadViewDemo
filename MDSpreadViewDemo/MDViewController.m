//
//  MDViewController.m
//  MDSpreadViewDemo
//
//  Created by Dimitri Bouniol on 10/15/11.
//  Copyright (c) 2012 Mochi Development, Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software, associated artwork, and documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  1. The above copyright notice and this permission notice shall be included in
//     all copies or substantial portions of the Software.
//  2. Neither the name of Mochi Development, Inc. nor the names of its
//     contributors or products may be used to endorse or promote products
//     derived from this software without specific prior written permission.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  
//  Mochi Dev, and the Mochi Development logo are copyright Mochi Development, Inc.
//  
//  Also, it'd be super awesome if you credited this page in your about screen :)
//  

#import "MDViewController.h"

@implementation MDViewController
@synthesize spreadView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    NSLog(@"Too little memory!");
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [spreadView reloadData];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setSpreadView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)dealloc {
    [spreadView release];
    [super dealloc];
}

#pragma mark - Spread View Datasource

- (NSInteger)spreadView:(MDSpreadView *)aSpreadView numberOfColumnsInSection:(NSInteger)section
{
    return 50;
}

- (NSInteger)spreadView:(MDSpreadView *)aSpreadView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (NSInteger)numberOfColumnSectionsInSpreadView:(MDSpreadView *)aSpreadView
{
    return 1000;
}

- (NSInteger)numberOfRowSectionsInSpreadView:(MDSpreadView *)aSpreadView
{
    return 1000;
}

#pragma mark Heights
// Comment these out to use normal values (see MDSpreadView.h)
- (CGFloat)spreadView:(MDSpreadView *)aSpreadView heightForRowAtIndexPath:(MDIndexPath *)indexPath
{
    return 25+indexPath.row;
}

- (CGFloat)spreadView:(MDSpreadView *)aSpreadView heightForRowHeaderInSection:(NSInteger)rowSection
{
//    if (rowSection == 2) return 0; // uncomment to hide this header!
    return 22+rowSection;
}

- (CGFloat)spreadView:(MDSpreadView *)aSpreadView widthForColumnAtIndexPath:(MDIndexPath *)indexPath
{
    return 220+indexPath.column*5;
}

- (CGFloat)spreadView:(MDSpreadView *)aSpreadView widthForColumnHeaderInSection:(NSInteger)columnSection
{
//    if (columnSection == 2) return 0; // uncomment to hide this header!
    return 110+columnSection*5;
}

#pragma Cells
- (MDSpreadViewCell *)spreadView:(MDSpreadView *)aSpreadView cellForRowAtIndexPath:(MDIndexPath *)rowPath forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    static NSString *cellIdentifier = @"Cell";

    MDSpreadViewCell *cell = [aSpreadView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[MDSpreadViewCell alloc] initWithStyle:MDSpreadViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Test Row %d-%d (%d-%d)", rowPath.section+1, rowPath.row+1, columnPath.section+1, columnPath.row+1];

    return cell;
}

- (MDSpreadViewCell *)spreadView:(MDSpreadView *)aSpreadView cellForHeaderInRowSection:(NSInteger)rowSection forColumnSection:(NSInteger)columnSection
{
    static NSString *cellIdentifier = @"CornerHeaderCell";
    
    MDSpreadViewHeaderCell *cell = (MDSpreadViewHeaderCell *)[aSpreadView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[MDSpreadViewHeaderCell alloc] initWithStyle:MDSpreadViewHeaderCellStyleCorner reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cor %d-%d", columnSection+1, rowSection+1];
    
    return cell;
}

- (MDSpreadViewCell *)spreadView:(MDSpreadView *)aSpreadView cellForHeaderInRowSection:(NSInteger)section forColumnAtIndexPath:(MDIndexPath *)columnPath
{
    static NSString *cellIdentifier = @"RowHeaderCell";
    
    MDSpreadViewHeaderCell *cell = (MDSpreadViewHeaderCell *)[aSpreadView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[MDSpreadViewHeaderCell alloc] initWithStyle:MDSpreadViewHeaderCellStyleRow reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row Header %d (%d-%d)", section+1, columnPath.section+1, columnPath.row+1];
    
    return cell;
}

- (MDSpreadViewCell *)spreadView:(MDSpreadView *)aSpreadView cellForHeaderInColumnSection:(NSInteger)section forRowAtIndexPath:(MDIndexPath *)rowPath
{
    static NSString *cellIdentifier = @"ColumnHeaderCell";
    
    MDSpreadViewHeaderCell *cell = (MDSpreadViewHeaderCell *)[aSpreadView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[MDSpreadViewHeaderCell alloc] initWithStyle:MDSpreadViewHeaderCellStyleColumn reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d (%d-%d)", section+1, rowPath.section+1, rowPath.row+1];
    
    return cell;
}

- (IBAction)scrollToTop:(id)sender
{
    [spreadView scrollRectToVisible:CGRectMake(spreadView.contentOffset.x, 0, spreadView.bounds.size.width, spreadView.bounds.size.height) animated:YES];
}

- (IBAction)scrollToBottom:(id)sender
{
    [spreadView scrollRectToVisible:CGRectMake(spreadView.contentOffset.x, spreadView.contentSize.height-spreadView.bounds.size.height, spreadView.bounds.size.width, spreadView.bounds.size.height) animated:YES];
}

- (IBAction)scrollToLeft:(id)sender
{
    [spreadView scrollRectToVisible:CGRectMake(0, spreadView.contentOffset.y, spreadView.bounds.size.width, spreadView.bounds.size.height) animated:YES];
}

- (IBAction)scrollToRight:(id)sender
{
    [spreadView scrollRectToVisible:CGRectMake(spreadView.contentSize.width-spreadView.bounds.size.width, spreadView.contentOffset.y, spreadView.bounds.size.width, spreadView.bounds.size.height) animated:YES];
}

@end
