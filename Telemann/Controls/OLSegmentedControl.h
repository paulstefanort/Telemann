//
//  OLSegmentedControl.h
//  Telemann
//
//  Created by Paul Stefan Ort on 5/13/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OLSegmentedControlDelegate;

@interface OLSegmentedControl : UIView

- (void)setItems:(NSArray *)newItems;
@property id <OLSegmentedControlDelegate> delegate;

@end

@protocol OLSegmentedControlDelegate <NSObject>
@required
- (void)segmentedControl:(OLSegmentedControl *)segmentedControl selectedSegment:(NSNumber *)segment;
@end