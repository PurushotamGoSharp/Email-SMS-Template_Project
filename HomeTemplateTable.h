//
//  HomeTemplateTable.h
//  EmailTemplate
//
//  Created by vmoksha mobility on 9/27/16.
//  Copyright © 2016 vmoksha mobility. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTemplateTable : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *homeTemplateImage;
@property (weak, nonatomic) IBOutlet UILabel *homeTemplateName;
@property (weak, nonatomic) IBOutlet UIImageView *smsTemplateImage;
@property (weak, nonatomic) IBOutlet UIImageView *emailTemplateImage;

@property (weak, nonatomic) IBOutlet UIView *emailTemplateView;
@property (weak, nonatomic) IBOutlet UIView *smsTemplateView;
 
@end
