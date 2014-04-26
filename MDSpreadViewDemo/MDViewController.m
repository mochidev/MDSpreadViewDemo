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
#import "MDHugeADataSource.h"
#import "MDHugeBDataSource.h"
#import "MDSortableDataSource.h"

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
//    spreadView.sectionColumnHeaderWidth = 0;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        spreadView.contentInset = UIEdgeInsetsMake(64, 20, 84, 20);
    }
    spreadView.scrollIndicatorInsets = spreadView.contentInset;
    
    spreadView.delegate = self.hugeA;
    spreadView.dataSource = self.hugeA;
    
//    spreadView.allowsRowHeaderSelection = YES;
//    spreadView.allowsColumnHeaderSelection = YES;
//    spreadView.allowsCornerHeaderSelection = YES;
    
//    spreadView.contentInset = UIEdgeInsetsMake(44*3, 300, 44*3, 300);
//    spreadView.clipsToBounds = NO;
//    spreadView.columnWidth = spreadView.rowHeight;
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

- (MDHugeADataSource *)hugeA
{
    if (!_hugeA) {
        _hugeA = [[MDHugeADataSource alloc] init];
    }
    return _hugeA;
}

- (MDHugeBDataSource *)hugeB
{
    if (!_hugeB) {
        _hugeB = [[MDHugeBDataSource alloc] init];
    }
    return _hugeB;
}

- (MDSortableDataSource *)sortable
{
    if (!_sortable) {
        _sortable = [[MDSortableDataSource alloc] init];
    }
    return _sortable;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Debug stuff
// not actually part of MDSpreadView!

- (IBAction)scrollToTop:(id)sender
{
    [spreadView scrollRectToVisible:UIEdgeInsetsInsetRect(CGRectMake(spreadView.contentOffset.x, -spreadView.contentInset.top, spreadView.bounds.size.width, spreadView.bounds.size.height), spreadView.contentInset) animated:YES];
}

- (IBAction)scrollToBottom:(id)sender
{
    [spreadView scrollRectToVisible:UIEdgeInsetsInsetRect(CGRectMake(spreadView.contentOffset.x, spreadView.contentSize.height-spreadView.bounds.size.height+spreadView.contentInset.bottom, spreadView.bounds.size.width, spreadView.bounds.size.height), spreadView.contentInset) animated:YES];
}

- (IBAction)scrollToLeft:(id)sender
{
    [spreadView scrollRectToVisible:UIEdgeInsetsInsetRect(CGRectMake(-spreadView.contentInset.left, spreadView.contentOffset.y, spreadView.bounds.size.width, spreadView.bounds.size.height), spreadView.contentInset) animated:YES];
}

- (IBAction)scrollToRight:(id)sender
{
    [spreadView scrollRectToVisible:UIEdgeInsetsInsetRect(CGRectMake(spreadView.contentSize.width-spreadView.bounds.size.width+spreadView.contentInset.right, spreadView.contentOffset.y, spreadView.bounds.size.width, spreadView.bounds.size.height), spreadView.contentInset) animated:YES];
}

- (IBAction)reload:(id)sender
{
    [spreadView reloadData];
}

- (IBAction)changeDataSource:(UISegmentedControl *)sender
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (sender.selectedSegmentIndex == 0) {
            spreadView.delegate = self.hugeA;
            spreadView.dataSource = self.hugeA;
        } else if (sender.selectedSegmentIndex == 1) {
            spreadView.delegate = self.hugeB;
            spreadView.dataSource = self.hugeB;
        } else if (sender.selectedSegmentIndex == 2) {
            spreadView.delegate = self.sortable;
            spreadView.dataSource = self.sortable;
        }
        
        [spreadView reloadData];
    } completion:NULL];
}

@end
