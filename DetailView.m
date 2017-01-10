//
//  DetailView.m
//  UCB_POC
//
//  Created by vmoksha on 03/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import "DetailView.h"
#import "AppDelegate.h"
@implementation DetailView
{
    UIView*view;
    UIControl *alphaview;
    AppDelegate*appdelegate;
    NSMutableArray*tableData;
    NSIndexPath *selectedIndex;
}

- (IBAction)smsCloseButton:(UIButton *)sender {
    [alphaview removeFromSuperview];
}

- (IBAction)smsPreviewCloseButtonAction:(id)sender
{
    [alphaview removeFromSuperview];

    
}

-(id)initWithFrame:(CGRect)frame
{
    
    self=[super initWithFrame:frame];
    view=[[NSBundle mainBundle]loadNibNamed:@"SMSPreview" owner:self options:nil].lastObject;
    view.frame=self.bounds;
    [self addSubview:view];
     return self;
}

-(void)alphaintialiseview
{
    if (alphaview==nil)
    {
    alphaview=[[UIControl alloc]initWithFrame:[UIScreen mainScreen].bounds];
    alphaview.backgroundColor=[UIColor colorWithRed:0.152 green:0.188 blue:0.196 alpha:1.0];
    [alphaview addSubview:view];
}
    view.center=alphaview.center;
    view.layer.cornerRadius=7;
    _smsHeaderView.layer.cornerRadius=5;
    appdelegate=[UIApplication sharedApplication].delegate;
    [appdelegate.window addSubview:alphaview];
    view.backgroundColor=[UIColor colorWithRed:0.678 green:0.921 blue:0.956 alpha:1.00];
    self.smsHeaderView.backgroundColor=[UIColor colorWithRed:0.239 green:0.392 blue:0.517 alpha:1.00];
    
    _smsDescriptionLabel.text = self.smsPreviewModel.smsTemplate;
    _smsHeaderLabel.text = self.smsPreviewModel.smsContent;
    
   
}

-(void)done
{
    [alphaview removeFromSuperview];
}

@end


