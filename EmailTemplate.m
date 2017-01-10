//
//  EmailTemplate.m
//  EmailTemplate
//
//  Created by vmoksha mobility on 9/27/16.
//  Copyright © 2016 vmoksha mobility. All rights reserved.
//

#import "EmailTemplate.h"
#import "EmailViewController.h"
#import "EmailTemplateDesignView.h"
#import "EmailTemplateTable.h"
#import "EmailDetailView.h"
#import <MessageUI/MessageUI.h>
@interface EmailTemplate ()<UITableViewDelegate,UITableViewDataSource,alphaViewDelegate,MFMailComposeViewControllerDelegate>
{
    NSMutableArray *emailTemplateTableArray;
    EmailTemplateModel *eModel;
    UIImage *myImage;
    EmailDetailView *detail;
    MFMailComposeViewController *mailComposer;
}
@property (weak, nonatomic) IBOutlet UITableView *myEmailTemplateTable;

-(IBAction)EmailViewBtn:(id)sender;
- (IBAction)sentEmailButtonAction:(id)sender;
- (IBAction)viewEamilButtonAction:(id)sender;

@end

@implementation EmailTemplate

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    emailTemplateTableArray=[[NSMutableArray alloc]init];
    myImage = [UIImage imageNamed:@"Icon-Arrow"];
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [myButton setImage:myImage forState:UIControlStateNormal];
    
    
    myButton.frame = CGRectMake(10.0, 0.0,24, 24);
    [myButton addTarget:self action:@selector(tappedBackButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:myButton];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self emailLocalData];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.myEmailTemplateTable.separatorColor=[UIColor colorWithRed:0.65 green:0.11 blue:0.71 alpha:1.00];

    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title=@"Email Templates";
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.239 green:0.392 blue:0.517 alpha:1.00];
     self.view.backgroundColor=[UIColor colorWithRed:0.678 green:0.921 blue:0.956 alpha:1.00];
    self.navigationItem.hidesBackButton=YES;
    self.myEmailTemplateTable.separatorColor=[UIColor clearColor];
    // detail.emailPreviewDisplayLabel = eModel.emailTemplate;
   
}

-(void)tappedBackButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [emailTemplateTableArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EmailTemplateTable *cell=[tableView dequeueReusableCellWithIdentifier:@"emailTemplate" forIndexPath:indexPath];
    eModel=emailTemplateTableArray[indexPath.row];
    cell.emailTemplateLabel.text=eModel.emailTemplate;
    cell.emailContentLabel.text=eModel.emailContent;
     cell.emailContentLabel.textColor=[UIColor colorWithRed:0.239 green:0.392 blue:0.517 alpha:1.00];
    cell.emailTemplateLabel.textColor=[UIColor colorWithRed:0.160 green:0.164 blue:0.164 alpha:1.00];
    cell.emailContentLabel.font=[UIFont boldSystemFontOfSize:17];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.myEmailTemplateTable.separatorColor=[UIColor clearColor];
    cell.emailTemplateCellView.backgroundColor=[UIColor colorWithRed:0.792 green:0.945 blue:0.972 alpha:1.00];

    return cell;
}

-(void)emailLocalData
{
    eModel=[[EmailTemplateModel alloc]init];
    eModel.emailContent=@"Happy Birthday";
    eModel.emailTemplate=@"Have a wonderful birthday. I wish your every day to be filled with lots of love, laughter, happiness and the warmth of sunshine.";
    [emailTemplateTableArray addObject:eModel];
    
    eModel=[[EmailTemplateModel alloc]init];
    eModel.emailContent=@"Congratulations";
    eModel.emailTemplate=@"The destiny of hard work is always success. You have done hard work and got succeed. Congratulations on you huge and marvelous success.";
    [emailTemplateTableArray addObject:eModel];
    
    eModel=[[EmailTemplateModel alloc]init];
    eModel.emailContent=@"Motivational";
    eModel.emailTemplate=@"Believe in yourself! Have faith in your abilities! Without a humble but reasonable confidence in your own powers you cannot be successful.";
    [emailTemplateTableArray addObject:eModel];
    
    eModel=[[EmailTemplateModel alloc]init];
    eModel.emailContent=@"Anniversary";
    eModel.emailTemplate=@"Real relationships are when you don’t have to pretend to be someone else, just to be liked for being someone you’re not. Happy anniversary.";
    [emailTemplateTableArray addObject:eModel];
    
   }

- (IBAction)sentEmailButtonAction:(id)sender
{
    
    CGPoint senderPosition = [sender convertPoint:CGPointZero toView:self.myEmailTemplateTable];
    NSIndexPath *indexPath = [self.myEmailTemplateTable indexPathForRowAtPoint:senderPosition];
    
    EmailTemplateModel *eModel = emailTemplateTableArray[indexPath.row];
    
    [self showEmail:eModel];
    
    mailComposer = [[MFMailComposeViewController alloc]init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setSubject:@"Test mail"];
    [self.navigationController presentViewController:mailComposer animated:YES completion:nil];
    
        
}

- (IBAction)viewEamilButtonAction:(id)sender
{
    if (detail==nil)
    {
        detail=[[EmailDetailView alloc]initWithFrame:CGRectMake(10, 10, 300, 200)];
        detail.delegate = self;
        
    }
    detail.emailDescriptionArray=eModel.emailTemplate;
    CGPoint senderPosition = [sender convertPoint:CGPointZero toView:self.myEmailTemplateTable];
    NSIndexPath *indexPath = [self.myEmailTemplateTable indexPathForRowAtPoint:senderPosition];
    EmailTemplateModel *eModel = emailTemplateTableArray[indexPath.row];
    detail.emailPreviewModel = eModel;
    [detail alphaintialiseview];
}

- (void)showEmail:(EmailTemplateModel *)eModel
{
    NSString *emailTitle = eModel.emailContent;
    NSArray *toRecipents = [NSArray arrayWithObject:@"purushottamk@vmokshagroup.com"];
    NSString *selectedEmail =eModel.emailTemplate;
    NSString *emailText=@"";
    NSString *completeEmail=[selectedEmail stringByAppendingString:emailText];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:completeEmail isHTML:NO];
    
    [self presentViewController:mc animated:YES completion:NULL];
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
}


@end
