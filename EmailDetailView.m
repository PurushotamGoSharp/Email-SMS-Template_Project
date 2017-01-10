//
//  EmailDetailView.m
//  EmailTemplate
//
//  Created by vmoksha mobility on 10/7/16.
//  Copyright © 2016 vmoksha mobility. All rights reserved.
//

#import "EmailDetailView.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@implementation EmailDetailView
{
UIView *view;
UIControl *alphaview;
AppDelegate *appdelegate;
NSMutableArray *tableData;
NSIndexPath *selectedIndex;
}

- (IBAction)emailCloseButton:(id)sender
{
    [alphaview removeFromSuperview];

}
- (IBAction)emailCloseBuActionEvent:(id)sender
{
    [alphaview removeFromSuperview];

}

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    view=[[NSBundle mainBundle]loadNibNamed:@"EmailPreviewXib" owner:self options:nil] .lastObject;
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
   _emailHeaderView.layer.cornerRadius=5;
    appdelegate=[UIApplication sharedApplication].delegate;
    [appdelegate.window addSubview:alphaview];
    view.backgroundColor=[UIColor colorWithRed:0.678 green:0.921 blue:0.956 alpha:1.00];
    self.emailHeaderView.backgroundColor=[UIColor colorWithRed:0.239 green:0.392 blue:0.517 alpha:1.00];

    _emailDescriptionLabel.text = self.emailPreviewModel.emailTemplate;
    _emailHeaderLabel.text = self.emailPreviewModel.emailContent;

}

-(void)done
{
    [alphaview removeFromSuperview];
}





@end
