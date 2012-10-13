//
//  UIViewWithBorder.m
//  WeddingGuest
//
//  Created by David Henry on 17/07/2012.
//  Copyright (c) 2012 Lyagushka Ltd. All rights reserved.
//

#import "UIViewWithBorder.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewWithBorder
@synthesize view;
@synthesize button;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        
        self.layer.cornerRadius = 8;
        //    view.clipsToBounds = YES;
        self.layer.masksToBounds = YES;

        self.view = [self subview:frame.size];
        [super addSubview: self.view];
        self.button = [self button:frame.size];
        [super addSubview: self.button];
    }
    return self;
}
-(UIView*)subview:(CGSize)size
{
    CGRect viewRect = CGRectMake(2, 2, size.width - 4, size.height - 4);
    UIView *subView = [[UIView alloc] initWithFrame:viewRect];

    subView.backgroundColor = [UIColor whiteColor];
    
    subView.layer.cornerRadius = 6;
    //    view.clipsToBounds = YES;
    subView.layer.masksToBounds = YES;
    return subView;
}
-(UIButton*)button:(CGSize)size
{
    CGRect viewRect = CGRectMake(0, 0, size.width, size.height);
    UIButton *overlayButton = [[UIButton alloc] initWithFrame:viewRect];
    
//    overlayButton.hidden = true;
//    [overlayButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    return overlayButton;
}
-(void)addTouchUpEvent:(id)target action:(SEL)action
{
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
-(void)addSubview:(UIView*)newView
{
    [view addSubview:newView];
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
