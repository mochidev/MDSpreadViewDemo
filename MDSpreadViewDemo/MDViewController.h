//
//  MDViewController.h
//  MDSpreadViewDemo
//
//  Created by Dimitri Bouniol on 10/15/11.
//  Copyright (c) 2011 Mochi Development Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDSpreadViewClasses.h"

@interface MDViewController : UIViewController <MDSpreadViewDataSource, MDSpreadViewDelegate> {
    MDSpreadView *spreadView;
}
@property (retain, nonatomic) IBOutlet MDSpreadView *spreadView;

@end
