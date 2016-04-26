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
#import <SDWebImage/UIImageView+WebCache.h>
#import <TWMessageBarManager/TWMessageBarManager.h>
#import "UIColor+Theme.h"


@interface OfferCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblTeaser;
@property (weak, nonatomic) IBOutlet UILabel *lblPayout;
@property (weak, nonatomic) IBOutlet UIImageView *ivThumbnail;

@end
@implementation OfferCell

@end

@interface OffersTableViewController ()
@property (nonatomic, strong) NSMutableArray<OfferModel*> *arrayOffers;
@property (nonatomic, strong) NSMutableSet<NSNumber*> *setDuplicateTracker;
@end

@implementation OffersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOffers = [NSMutableArray<OfferModel*> new];
    self.setDuplicateTracker = [NSMutableSet<NSNumber*> new];
    [self loadMoreData];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self addBottomRefreshControl:YES];
}
-(void)addBottomRefreshControl:(BOOL)add{
    if(add && self.tableView.bottomRefreshControl == nil){
        
        UIRefreshControl *refreshControl = [UIRefreshControl new];
        refreshControl.triggerVerticalOffset = 100.;
        [refreshControl addTarget:self action:@selector(loadMoreData) forControlEvents:UIControlEventValueChanged];
        [refreshControl setTintColor:[UIColor appColorWithLightness:0.3]];
        self.tableView.bottomRefreshControl = refreshControl;
    }else if(!add && self.tableView.bottomRefreshControl){
        self.tableView.bottomRefreshControl = nil;
    }
}
-(void)loadMoreData{
    [APIClientKit loadNextPageOffersForCredentials:self.currentCredential apiBlock:^(BOOL success, NSArray *data) {
        
        if (success && data && [data isKindOfClass:[NSArray class]]) {
            NSMutableArray<OfferModel*> * models = [NSMutableArray<OfferModel*> new];
            for (OfferModel *model in data) {
                if ([self.setDuplicateTracker containsObject:[NSNumber numberWithInteger:model.offer_id]]==NO) {
                    [self.setDuplicateTracker addObject:[NSNumber numberWithInteger:model.offer_id]];
                    [models addObject:model];
                }else{
                    NSLog(@"Already Exists");
                }
            }
            [self.arrayOffers addObjectsFromArray:models];
            [self.tableView reloadData];
        }else if(success && data.count==0){
            
            [[TWMessageBarManager sharedInstance] showMessageWithTitle:NSLocalizedString(@"No More Offers", @"Warning Title") description:NSLocalizedString(@"There is no more offers available at the moment.", @"Warning description") type:TWMessageBarMessageTypeInfo];
        }
        [self.tableView.bottomRefreshControl endRefreshing];
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
    OfferModel *model = [self.arrayOffers objectAtIndex:indexPath.row];
    cell.lblTitle.text = model.title;
    cell.lblTeaser.text = model.teaser;
    cell.lblPayout.text = [NSString stringWithFormat:@"Payout: %ld",model.payout];
    [cell.ivThumbnail sd_setImageWithURL:[NSURL URLWithString:model.thumbnailHires] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!image) {
            NSLog(@"Failed to find image: %@",imageURL);
        }
    }];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
@end
