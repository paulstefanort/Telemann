//
//  OLPageView.h
//  Telemann
//
//  Created by Paul Stefan Ort on 5/15/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OLPageViewDelegate;

@interface OLPageView : UIScrollView <UIScrollViewDelegate>

- (UIView *)newPage;
- (void)addPage:(UIView *)page;
- (BOOL)scrollToPage:(int)page;
@property id <OLPageViewDelegate> pageViewDelegate;

@end

@protocol OLPageViewDelegate <NSObject>
@required
- (void)pageView:(OLPageView *)pageView scrolledToPage:(NSNumber *)page;
@end