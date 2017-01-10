//
//  EmailTemplateTable.h
//  EmailTemplate
//
//  Created by vmoksha mobility on 9/27/16.
//  Copyright © 2016 vmoksha mobility. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailTemplateTable : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *emailTemplateLabel;
@property (weak, nonatomic) IBOutlet UIView *emailTemplateCellView;
@property (weak, nonatomic) IBOutlet UILabel *emailContentLabel;



@end
