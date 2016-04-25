//
//  FormsTableViewController.m
//  FyberOffers
//
//  Created by Nabeel Arif on 4/26/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "FormsTableViewController.h"
#import "Constants.h"
#import "FyberCredentialModel.h"
#import "OffersTableViewController.h"
#import <TWMessageBarManager/TWMessageBarManager.h>

@interface FormsTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfUID;
@property (weak, nonatomic) IBOutlet UITextField *tfAPIKey;
@property (weak, nonatomic) IBOutlet UITextField *tfAppId;
@property (nonatomic, strong) FyberCredentialModel *currentCredential;
- (IBAction)actionSearch:(id)sender;

@end

@implementation FormsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tfUID.text = kUID;
    self.tfAPIKey.text = kAPIKey;
    self.tfAppId.text = kAppId;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (IBAction)actionSearch:(id)sender {
    self.currentCredential.uid = self.tfUID.text;
    self.currentCredential.apiKey = self.tfAPIKey.text;
    self.currentCredential.appId = self.tfAppId.text;
    
    if (self.currentCredential.uid.length<=0) {
        
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:NSLocalizedString(@"Error", @"Error Title") description:NSLocalizedString(@"Please provide UID.", @"Error Description") type:TWMessageBarMessageTypeError];
    }else if(self.currentCredential.apiKey.length<=0){
        
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:NSLocalizedString(@"Error", @"Error Title") description:NSLocalizedString(@"Please provide Api Key.", @"Error Description") type:TWMessageBarMessageTypeError];
    }else if(self.currentCredential.appId.length<=0){
        
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:NSLocalizedString(@"Error", @"Error Title") description:NSLocalizedString(@"Please provide App Id.", @"Error Description") type:TWMessageBarMessageTypeError];
    }else{
        [self performSegueWithIdentifier:@"offers" sender:self];
    }
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"offers"]) {
        OffersTableViewController *offerVC = segue.destinationViewController;
        offerVC.currentCredential = self.currentCredential;
    }
}
@end
