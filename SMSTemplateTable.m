//
//  SMSTemplateTable.m
//  EmailTemplate
//
//  Created by vmoksha mobility on 9/27/16.
//  Copyright © 2016 vmoksha mobility. All rights reserved.
//

#import "SMSTemplateTable.h"

@implementation SMSTemplateTable

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.smsSentButton addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)button1Pressed:(id)sender
{
    
    UITableViewCell *clickedCell = (UITableViewCell *)[[sender superview] superview];
   // NSIndexPath *clickedButtonIndexPath = [ indexPathForCell:clickedCell];
    
}
- (void)didTapButton:(id)sender
{
    if (self.didTapButtonBlock) {
        self.didTapButtonBlock(sender);
    }
}
@end
