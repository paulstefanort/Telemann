//
//  MainViewController.h
//  Telemann
//
//  Created by Paul Stefan Ort on 5/10/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OLSegmentedControl.h"
#import "OLPageView.h"
#import "OLPage.h"
#import "OLNewsPage.h"

@interface MainViewController : UIViewController <UIScrollViewDelegate, OLSegmentedControlDelegate, OLPageViewDelegate, OLNewsPageDelegate>

@end
