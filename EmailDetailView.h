//
//  EmailDetailView.h
//  EmailTemplate
//
//  Created by vmoksha mobility on 10/7/16.
//  Copyright © 2016 vmoksha mobility. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "EmailTemplateModel.h"
@protocol alphaViewDelegate <NSObject>
@end
@interface EmailDetailView : UIView
@property(nonatomic,strong)NSArray *contactArr;
-(void)alphaintialiseview;
@property(nonatomic)id<alphaViewDelegate>delegate;
- (IBAction)emailPrevieCloseButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *emailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailHeaderLabel;
@property(nonatomic,strong)NSArray *emailDescriptionArray;
@property(strong,nonatomic)EmailTemplateModel *emailPreviewModel;
@property (weak, nonatomic) IBOutlet UIView *emailHeaderView;


@end
