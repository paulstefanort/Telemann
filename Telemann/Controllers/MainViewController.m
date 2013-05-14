//
//  MainViewController.m
//  Telemann
//
//  Created by Paul Stefan Ort on 5/10/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () {
    OLSegmentedControl *segmentedControl;
    NSArray *mainSegments;
}

@end

@implementation MainViewController

- (id)init {
    mainSegments = @[@"News", @"Videos"];
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    segmentedControl = [[OLSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 33)];
    [segmentedControl setItems:mainSegments];
    [segmentedControl setDelegate:self];
    
    [view addSubview:segmentedControl];
    
    self.view = view;
    return self;
}

- (void)segmentedControl:(OLSegmentedControl *)segmentedControl selectedSegment:(NSNumber *)segment {
    NSLog(@"selectedSegment: %@", [mainSegments objectAtIndex:[segment intValue]]);
}

@end
