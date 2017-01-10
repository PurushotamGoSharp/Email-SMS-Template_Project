//
//  DetailView.h
//  UCB_POC
//
//  Created by vmoksha on 03/08/16.
//  Copyright © 2016 Amit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMSTemplateModel.h"
#import "SMSTemplate.h"
@protocol alphaViewDelegate <NSObject>
@end

@interface DetailView : UIView<UITableViewDataSource,UITableViewDelegate>
-(void)alphaintialiseview;
@property (strong, nonatomic) IBOutlet UITableView *detailTableview;
@property(nonatomic,strong)NSArray *contactArr;
@property(nonatomic)id<alphaViewDelegate>delegate;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)doneButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *smsPreviewContent;
@property (weak, nonatomic) IBOutlet UILabel *smsPreviewDisplayLabel;
@property (weak, nonatomic) IBOutlet UIView *SMSPreviewContentView;
@property(strong,nonatomic)SMSTemplateModel *smsPreviewModel;

@property (weak, nonatomic) IBOutlet UILabel *smsDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *smsHeaderLabel;
@property (weak, nonatomic) IBOutlet UIView *smsHeaderView;


@end
