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
        self.delegate = self;
    }
    return self;
}

- (OLPage *)newPage {
    OLPage *page = [[OLPage alloc] initWithFrame:CGRectMake(pages.count * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    return page;
}

- (void)addPage:(OLPage *)page {
    [pages addObject:page];
    [self addSubview:page];
    [self setContentSize:CGSizeMake(self.frame.size.width * pages.count, 0)];
}

- (BOOL)scrollToPage:(int)page {
    if (page < pages.count) {
        [self setContentOffset:CGPointMake(self.frame.size.width * page, 0) animated:true];
        return true;
    }
    return false;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    int pageNumber = self.contentOffset.x / self.frame.size.width;
    [self.pageViewDelegate performSelector:@selector(pageView:scrolledToPage:) withObject:self withObject:[NSNumber numberWithInt:pageNumber]];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int pageNumber = self.contentOffset.x / self.frame.size.width;
    [self.pageViewDelegate performSelector:@selector(pageView:scrolledToPage:) withObject:self withObject:[NSNumber numberWithInt:pageNumber]];
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
