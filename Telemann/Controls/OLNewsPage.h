//
//  OLNewsPage.h
//  Telemann
//
//  Created by Paul Stefan Ort on 5/17/13.
//  Copyright (c) 2013 Paul Stefan Ort. All rights reserved.
//

#import "OLPage.h"

@protocol OLNewsPageDelegate;

@interface OLNewsPage : OLPage
@property UILabel *titleLabel;
@property UIImageView *imageView;
@property id <OLNewsPageDelegate> newsPageDelegate;
@end

@protocol OLNewsPageDelegate <NSObject>
@required
- (void)newsPageImagePressed:(OLNewsPage *)newsPage;
@end
