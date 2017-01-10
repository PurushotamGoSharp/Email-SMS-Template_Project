//
//  SMSTemplateTable.h
//  EmailTemplate
//
//  Created by vmoksha mobility on 9/27/16.
//  Copyright © 2016 vmoksha mobility. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMSTemplateTable : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *smsTemplataLabel;
@property (weak, nonatomic) IBOutlet UIView *smsTemplateTableCellView;
@property (weak, nonatomic) IBOutlet UILabel *smsContentLabel;
 @property (strong, nonatomic) NSIndexPath *cellIndexPath;
@property (weak, nonatomic) IBOutlet UIButton *smsSentButton;
- (void)setDidTapButtonBlock:(void (^)(id sender))didTapButtonBlock;
@property (copy, nonatomic) void (^didTapButtonBlock)(id sender);
@end
