//
//  OffersTableViewController.m
//  FyberOffers
//
//  Created by Nabeel Arif on 4/26/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "OffersTableViewController.h"
#import <CCBottomRefreshControl/UIScrollView+BottomRefreshControl.h>
#import "OfferModel.h"
#import "APIClient.h"

@interface OfferCell : UITableViewCell

@end
@implementation OfferCell

@end

@interface OffersTableViewController ()
@property (nonatomic, strong) NSMutableArray<OfferModel*> *arrayOffers;
@end

@implementation OffersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOffers = [NSMutableArray<OfferModel*> new];
    [self loadMoreData];
    [self addBottomRefreshControl:YES];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)addBottomRefreshControl:(BOOL)add{
    if(add && self.tableView.bottomRefreshControl == nil){
        
        UIRefreshControl *refreshControl = [UIRefreshControl new];
        refreshControl.triggerVerticalOffset = 100.;
        [refreshControl addTarget:self action:@selector(loadMoreData) forControlEvents:UIControlEventValueChanged];
        self.tableView.bottomRefreshControl = refreshControl;
    }else if(!add && self.tableView.bottomRefreshControl){
        self.tableView.bottomRefreshControl = nil;
    }
}
-(void)loadMoreData{
    [APIClientKit loadNextPageOffersForCredentials:self.currentCredential apiBlock:^(BOOL success, NSArray *data) {
        
        if (success && data && [data isKindOfClass:[NSArray class]]) {
            [self.arrayOffers addObjectsFromArray:(NSArray<OfferModel*> *)data];
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOffers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OfferCell *cell = (OfferCell*)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
