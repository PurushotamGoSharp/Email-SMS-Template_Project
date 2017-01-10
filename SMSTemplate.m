//
//  SMSTemplate.m
//  EmailTemplate
//
//  Created by vmoksha mobility on 9/27/16.
//  Copyright © 2016 vmoksha mobility. All rights reserved.
//

#import "SMSTemplate.h"
#import "SMSTemplateTable.h"
#import "SMSTemplateModel.h"
#import "SMSNewViewController.h"
#import <MessageUI/MessageUI.h>
#import "SMSPreview.h"
#import "DetailView.h"

@interface SMSTemplate ()<UITableViewDataSource,UITableViewDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,alphaViewDelegate>
{
    NSMutableArray *smsTemplateTableArray;
    UIImage *myImage;
    DetailView *detail;
    NSIndexPath *selectedIndex;
    NSString *selectedFile;
}
@property (weak, nonatomic) IBOutlet UITableView *mySmsTemplateTable;
- (IBAction)viewSentSmsButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sentSMSButton;

@end

@implementation SMSTemplate

- (id)initWithStyle:(UITableViewStyle)style
{
   // self = [super initWithStyle:style];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myImage = [UIImage imageNamed:@"Icon-Arrow"];
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [myButton setImage:myImage forState:UIControlStateNormal];
    
    
    myButton.frame = CGRectMake(10.0, 0.0,24, 24);
    [myButton addTarget:self action:@selector(tappedBackButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:myButton];
    self.navigationItem.leftBarButtonItem = leftButton;

    smsTemplateTableArray=[[NSMutableArray alloc]init];
   
    [self smsLocalData];
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.mySmsTemplateTable.separatorColor=[UIColor colorWithRed:0.65 green:0.11 blue:0.71 alpha:1.00];

    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title=@"SMS Templates";
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.239 green:0.392 blue:0.517 alpha:1.00];
    self.view.backgroundColor=[UIColor colorWithRed:0.678 green:0.921 blue:0.956 alpha:1.00];
    self.navigationItem.hidesBackButton=YES;
    self.mySmsTemplateTable.separatorColor=[UIColor clearColor];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [smsTemplateTableArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SMSTemplateTable *cell=[tableView dequeueReusableCellWithIdentifier:@"smsTemplate" forIndexPath:indexPath];
    SMSTemplateModel *sModel = smsTemplateTableArray[indexPath.row];
    cell.smsContentLabel.textColor=[UIColor colorWithRed:0.239 green:0.392 blue:0.517 alpha:1.00];
    cell.smsContentLabel.font=[UIFont boldSystemFontOfSize:17];
    cell.smsTemplataLabel.textColor=[UIColor colorWithRed:0.160 green:0.164 blue:0.164 alpha:1.00];
    cell.smsTemplataLabel.text=sModel.smsTemplate;
    cell.smsContentLabel.text=sModel.smsContent;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.mySmsTemplateTable.separatorColor=[UIColor clearColor];
    cell.smsTemplateTableCellView.backgroundColor=[UIColor colorWithRed:0.792 green:0.945 blue:0.972 alpha:1.00];
    self.navigationItem.hidesBackButton=YES;
    [cell setCellIndexPath:indexPath];
    return cell;
}

-(void)smslocalData:(NSIndexPath *)indexPath
{
    selectedFile=smsTemplateTableArray[indexPath.row];
}
-(void)smsLocalData
{
    
    SMSTemplateModel *sModel = [[SMSTemplateModel alloc]init];
    sModel.smsContent=@"Happy Birthday";
    sModel.smsTemplate=@"Have a wonderful birthday. I wish your every day to be filled with lots of love, laughter, happiness and the warmth of sunshine.";
    [smsTemplateTableArray addObject:sModel];
    
     sModel=[[SMSTemplateModel alloc]init];
    sModel.smsContent=@"Congratulations";
    sModel.smsTemplate=@"The destiny of hard work is always success. You have done hard work and got succeed. Congratulations on you huge and marvelous success.";
    [smsTemplateTableArray addObject:sModel];
    
    sModel=[[SMSTemplateModel alloc]init];
    sModel.smsContent=@"Motivational";
    sModel.smsTemplate=@"Believe in yourself! Have faith in your abilities! Without a humble but reasonable confidence in your own powers you cannot be successful.";
   [smsTemplateTableArray addObject:sModel];
    
    sModel=[[SMSTemplateModel alloc]init];
    sModel.smsContent=@"Anniversary";
    sModel.smsTemplate=@"Real relationships are when you don’t have to pretend to be someone else, just to be liked for being someone you’re not. Happy anniversary.";
    [smsTemplateTableArray addObject:sModel];

}

-(void)tappedBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)sentSMSButton:(UIButton *)sender
{
    CGPoint senderPosition = [sender convertPoint:CGPointZero toView:self.mySmsTemplateTable];
    NSIndexPath *indexPath = [self.mySmsTemplateTable indexPathForRowAtPoint:senderPosition];
   
    SMSTemplateModel *sModel = smsTemplateTableArray[indexPath.row];
    [self showSMS:sModel];
}
- (IBAction)viewSentSmsButtonAction:(id)sender
{
   
    if (detail==nil)
    {
        detail=[[DetailView alloc]initWithFrame:CGRectMake(10, 10, 300, 200)];
        detail.delegate = self;
                 
    }
    CGPoint senderPosition = [sender convertPoint:CGPointZero toView:self.mySmsTemplateTable];
    NSIndexPath *indexPath = [self.mySmsTemplateTable indexPathForRowAtPoint:senderPosition];
    SMSTemplateModel *sModel = smsTemplateTableArray[indexPath.row];
    detail.smsPreviewModel = sModel;
   
    [detail alphaintialiseview];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result)
    {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"Error !"
                                                  message:@"Failed to send SMS!"
                                                  preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction
                                           actionWithTitle:NSLocalizedString(@"NO", @"No action")
                                           style:UIAlertActionStyleCancel
                                           handler:^(UIAlertAction *action)
                                           {
                                               NSLog(@"Cancel action");
                                           }];
            
            UIAlertAction *okAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Yes", @"OK action")
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction *action)
                                       {
                                           NSLog(@"OK action");
                                       }];
            
            [alertController addAction:okAction];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
            break;
            
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showSMS:(SMSTemplateModel*)sModel
{
    if(![MFMessageComposeViewController canSendText])
    {
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Error !"
                                              message:@"Your device doesn't support SMS!"
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           NSLog(@"Cancel action");
                                       }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
   
    NSString *messageString=sModel.smsTemplate;
    NSString *msgTypeString=messageString;
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setBody:msgTypeString];
    [self presentViewController:messageController animated:YES completion:nil];
}


@end
