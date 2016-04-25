//
//  FormsTableViewController.m
//  FyberOffers
//
//  Created by Nabeel Arif on 4/26/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "FormsTableViewController.h"
#import "Constants.h"

@interface FormsTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tfUID;
@property (weak, nonatomic) IBOutlet UITextField *tfAPIKey;
@property (weak, nonatomic) IBOutlet UITextField *tfAppId;
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
}
@end
