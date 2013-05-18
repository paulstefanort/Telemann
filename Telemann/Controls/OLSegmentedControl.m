//
//  OLSegmentedControl.m
//  Telemann
//
//  Created by Paul Stefan Ort on 5/13/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import "OLSegmentedControl.h"

#define LINE_VIEW_HEIGHT 1

@interface OLSegmentedControl() {
    NSArray *items;
    int segmentCount;
    int segmentWidth;
    int currentSegmentIndex;
}
@end

@implementation OLSegmentedControl

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setItems:(NSArray *)newItems {
    items = newItems;
    [self layoutSubviews];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    for (int i = 0; i < items.count; i++) {
        CGRect segmentFrame = CGRectMake(i * segmentWidth, 0, segmentWidth, self.frame.size.height);
        
        if (CGRectContainsPoint(segmentFrame, touchPoint)) {
            if (currentSegmentIndex != i) {
                currentSegmentIndex = i;
                [self setNeedsLayout];
                [delegate performSelector:@selector(segmentedControl:selectedSegment:) withObject:self withObject:[NSNumber numberWithInt:i]];
            }
            break;
        }
    }
}

- (BOOL)setSelectedSegment:(int)segment {
    if (segment < items.count) {
        currentSegmentIndex = segment;
        [self layoutSubviews];
        return true;
    }
    return false;
}

- (void)layoutSubviews {
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    segmentCount = items.count;
    segmentWidth = self.frame.size.width / segmentCount;
    
    for (int i = 0; i < segmentCount; i++) {
        CGRect segmentFrame = CGRectMake(i * segmentWidth, 0, segmentWidth, self.frame.size.height);
        
        UIView *segment = [[UIView alloc] initWithFrame:segmentFrame];
        
        UILabel *segmentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, segmentFrame.size.width - 10, segmentFrame.size.height)];
        [segmentLabel setFont:[UIFont boldSystemFontOfSize:segmentFrame.size.height / 2]];
        [segmentLabel setShadowColor:[UIColor lightGrayColor]];
        [segmentLabel setShadowOffset:CGSizeMake(0, -1)];
        [segmentLabel setBackgroundColor:[UIColor clearColor]];
        
        if (currentSegmentIndex == i) {
            [segment setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1]];
        } else {
            [segment setBackgroundColor:[UIColor clearColor]];
        }
        [segmentLabel setText:[items objectAtIndex:i]];
        
        [segment addSubview:segmentLabel];
        
        [self addSubview:segment];
    }
    
    UIView *headerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, LINE_VIEW_HEIGHT)];
    [headerLineView setBackgroundColor:[UIColor blackColor]];
    [self addSubview:headerLineView];
    
    UIView *footerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - LINE_VIEW_HEIGHT, self.frame.size.width, LINE_VIEW_HEIGHT)];
    [footerLineView setBackgroundColor:[UIColor blackColor]];
    [self addSubview:footerLineView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
