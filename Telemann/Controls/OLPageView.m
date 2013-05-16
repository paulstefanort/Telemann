//
//  OLPageView.m
//  Telemann
//
//  Created by Paul Stefan Ort on 5/15/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import "OLPageView.h"

@implementation OLPageView {
    NSMutableArray *pages;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setPagingEnabled:true];
        pages = [NSMutableArray new];
    }
    return self;
}

- (void)addPage:(UIView *)page {
    [pages addObject:page];
    [self addSubview:page];
    [self setContentSize:CGSizeMake(self.frame.size.width * pages.count, 0)];
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
