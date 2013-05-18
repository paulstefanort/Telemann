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
    
    OLPageView *mainPageView;
    
    OLSegmentedControl *secondarySegmentedControl;
    NSArray *secondarySegments;
    
    OLPageView *secondaryPageView;
}

@end

@implementation MainViewController

- (id)init {
    mainSegments = @[@"News", @"Videos"];
    secondarySegments = @[@"Violin", @"Piano"];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.delegate = self;
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, -44, 320, 44)];
    [scrollView addSubview:searchBar];
    
    mainSegmentedControl = [[OLSegmentedControl alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 33)];
    [mainSegmentedControl setItems:mainSegments];
    [mainSegmentedControl setDelegate:self];
    
    [view addSubview:mainSegmentedControl];
    
    mainPageView = [[OLPageView alloc] initWithFrame:CGRectMake(0, 33, view.frame.size.width, view.frame.size.height / 2 - 66)];
    [mainPageView setBackgroundColor:[UIColor whiteColor]];
    [mainPageView setPageViewDelegate:self];
    
    OLNewsPage *newsOne = [[OLNewsPage alloc] initWithFrame:[mainPageView newPage].frame];
    newsOne.titleLabel.text = @"News One";
    newsOne.newsPageDelegate = self;
    [mainPageView addPage:newsOne];
    
    OLNewsPage *newsTwo = [[OLNewsPage alloc] initWithFrame:[mainPageView newPage].frame];
    newsTwo.titleLabel.text = @"News Two";
    newsTwo.newsPageDelegate = self;
    [mainPageView addPage:newsTwo];
    
    OLNewsPage *newsThree = [[OLNewsPage alloc] initWithFrame:[mainPageView newPage].frame];
    newsThree.titleLabel.text = @"News Three";
    newsThree.newsPageDelegate = self;
    [mainPageView addPage:newsThree];
    
    OLNewsPage *newsFour = [[OLNewsPage alloc] initWithFrame:[mainPageView newPage].frame];
    newsFour.titleLabel.text = @"News Four";
    newsFour.newsPageDelegate = self;
    [mainPageView addPage:newsFour];
    
    [view addSubview:mainPageView];
    
    secondarySegmentedControl = [[OLSegmentedControl alloc] initWithFrame:CGRectMake(0, view.frame.size.height / 2 - 33, view.frame.size.width, 33)];
    [secondarySegmentedControl setItems:secondarySegments];
    [secondarySegmentedControl setDelegate:self];
    
    [view addSubview:secondarySegmentedControl];
    
    secondaryPageView = [[OLPageView alloc] initWithFrame:CGRectMake(0, view.frame.size.height / 2, view.frame.size.width, view.frame.size.height / 2 - 66)];
    [secondaryPageView setPageViewDelegate:self];
    
    OLPage *instrumentOne = [secondaryPageView newPage];
    [instrumentOne setBackgroundColor:[UIColor yellowColor]];
    [secondaryPageView addPage:instrumentOne];
    
    OLPage *instrumentTwo = [secondaryPageView newPage];
    [instrumentTwo setBackgroundColor:[UIColor orangeColor]];
    [secondaryPageView addPage:instrumentTwo];
    
    OLPage *instrumentThree = [secondaryPageView newPage];
    [instrumentThree setBackgroundColor:[UIColor purpleColor]];
    [secondaryPageView addPage:instrumentThree];
    
    OLPage *instrumentFour = [secondaryPageView newPage];
    [instrumentFour setBackgroundColor:[UIColor grayColor]];
    [secondaryPageView addPage:instrumentFour];
    
    [view addSubview:secondaryPageView];
    
    [scrollView addSubview:view];
    [scrollView setContentSize:CGSizeMake(0, view.frame.size.height + 1)];
    
    self.view = scrollView;
    return self;
}

- (void)segmentedControl:(OLSegmentedControl *)segmentedControl selectedSegment:(NSNumber *)segment {
    if (segmentedControl == mainSegmentedControl) {
        if (segment.intValue == 1) {
            [mainPageView scrollToPage:2];
        } else if (segment.intValue == 0) {
            [mainPageView scrollToPage:0];
        }
    } else if (segmentedControl == secondarySegmentedControl) {
        if (segment.intValue == 1) {
            [secondaryPageView scrollToPage:2];
        } else if (segment.intValue == 0) {
            [secondaryPageView scrollToPage:0];
        }
    }
}

- (void)pageView:(OLPageView *)pageView scrolledToPage:(NSNumber *)page {
    if (pageView == mainPageView) {
        if ([page intValue] == 1) {
            [mainSegmentedControl setSelectedSegment:0];
        } else if ([page intValue] == 2) {
            [mainSegmentedControl setSelectedSegment:1];
        }
    } else if (pageView == secondaryPageView) {
        if ([page intValue] == 1) {
            [secondarySegmentedControl setSelectedSegment:0];
        } else if ([page intValue] == 2) {
            [secondarySegmentedControl setSelectedSegment:1];
        }
    }
}

- (void)newsPageImagePressed:(OLNewsPage *)newsPage {
    NSLog(@"newsPageImagePressed");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y < -44) {
        [scrollView setContentInset:UIEdgeInsetsMake(44, 0, 0, 0)];
    } else if (scrollView.contentOffset.y > 10) {
        [scrollView setContentInset:UIEdgeInsetsZero];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.contentOffset.y < -44) {
        [scrollView setContentInset:UIEdgeInsetsMake(44, 0, 0, 0)];
    } else {
        [scrollView setContentInset:UIEdgeInsetsZero];
    }
}

@end
