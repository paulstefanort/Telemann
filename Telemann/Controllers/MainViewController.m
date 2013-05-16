//
//  MainViewController.m
//  Telemann
//
//  Created by Paul Stefan Ort on 5/10/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () {
    OLSegmentedControl *mainSegmentedControl;
    NSArray *mainSegments;
    
    OLSegmentedControl *secondarySegmentedControl;
    NSArray *secondarySegments;
}

@end

@implementation MainViewController

- (id)init {
    mainSegments = @[@"News", @"Videos"];
    secondarySegments = @[@"Violin", @"Piano"];
    
    UIScrollView *scrollView = [UIScrollView new];
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    mainSegmentedControl = [[OLSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 33)];
    [mainSegmentedControl setItems:mainSegments];
    [mainSegmentedControl setDelegate:self];
    
    [view addSubview:mainSegmentedControl];
    
    OLPageView *mainPageView = [[OLPageView alloc] initWithFrame:CGRectMake(0, 33, view.frame.size.width, view.frame.size.height / 2 - 66)];
    
    UIView *newsOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height / 2 - 66)];
    [newsOne setBackgroundColor:[UIColor redColor]];
    [mainPageView addPage:newsOne];
    
    UIView *newsTwo = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width, 0, view.frame.size.width, view.frame.size.height / 2 - 66)];
    [newsTwo setBackgroundColor:[UIColor greenColor]];
    [mainPageView addPage:newsTwo];
    
    UIView *newsThree = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width * 2, 0, view.frame.size.width, view.frame.size.height / 2 - 66)];
    [newsThree setBackgroundColor:[UIColor blueColor]];
    [mainPageView addPage:newsThree];
    
    [view addSubview:mainPageView];
    
    secondarySegmentedControl = [[OLSegmentedControl alloc] initWithFrame:CGRectMake(0, view.frame.size.height / 2 - 33, view.frame.size.width, 33)];
    [secondarySegmentedControl setItems:secondarySegments];
    [secondarySegmentedControl setDelegate:self];
    
    [view addSubview:secondarySegmentedControl];
    
    OLPageView *secondaryPageView = [[OLPageView alloc] initWithFrame:CGRectMake(0, view.frame.size.height / 2, view.frame.size.width, view.frame.size.height / 2 - 66)];
    
    UIView *instrumentOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height / 2 - 66)];
    [instrumentOne setBackgroundColor:[UIColor yellowColor]];
    [secondaryPageView addPage:instrumentOne];
    
    UIView *instrumentTwo = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width, 0, view.frame.size.width, view.frame.size.height / 2 - 66)];
    [instrumentTwo setBackgroundColor:[UIColor orangeColor]];
    [secondaryPageView addPage:instrumentTwo];
    
    UIView *instrumentThree = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width * 2, 0, view.frame.size.width, view.frame.size.height / 2 - 66)];
    [instrumentThree setBackgroundColor:[UIColor purpleColor]];
    [secondaryPageView addPage:instrumentThree];
    
    [view addSubview:secondaryPageView];
    
    [scrollView addSubview:view];
    [scrollView setContentSize:CGSizeMake(0, view.frame.size.height + 1)];
    
    self.view = scrollView;
    return self;
}

- (void)segmentedControl:(OLSegmentedControl *)segmentedControl selectedSegment:(NSNumber *)segment {
    if (segmentedControl == mainSegmentedControl) {
        NSLog(@"mainSegment: %@", [mainSegments objectAtIndex:[segment intValue]]);
    } else if (segmentedControl == secondarySegmentedControl) {
        NSLog(@"secondarySegment: %@", [secondarySegments objectAtIndex:[segment intValue]]);
    }
}

@end
