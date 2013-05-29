//
//  OLNewsPage.m
//  Telemann
//
//  Created by Paul Stefan Ort on 5/17/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import "OLNewsPage.h"

@implementation OLNewsPage

#define TITLE_LABEL_OFFSET 10
#define TITLE_LABEL_HEIGHT 21
#define TITLE_LABEL_FONT_SIZE 18

@synthesize titleLabel, imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(TITLE_LABEL_OFFSET, TITLE_LABEL_OFFSET, self.frame.size.width - (2 * TITLE_LABEL_OFFSET), TITLE_LABEL_HEIGHT)];
        titleLabel.font = [UIFont systemFontOfSize:TITLE_LABEL_FONT_SIZE];
        titleLabel.shadowColor = [UIColor grayColor];
        titleLabel.shadowOffset = CGSizeMake(0, 1);
        [self addSubview:titleLabel];
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(TITLE_LABEL_OFFSET, TITLE_LABEL_OFFSET + TITLE_LABEL_HEIGHT, self.frame.size.width - (2 * TITLE_LABEL_OFFSET), self.frame.size.height - TITLE_LABEL_OFFSET - TITLE_LABEL_HEIGHT - TITLE_LABEL_OFFSET)];
        [imageView setBackgroundColor:[UIColor redColor]];
        [self addSubview:imageView];
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(imageView.frame, touchPoint)) {
        [self.newsPageDelegate performSelector:@selector(newsPageImagePressed:) withObject:self];
    }
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
