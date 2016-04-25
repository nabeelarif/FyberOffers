//
//  OffersTableViewController.h
//  FyberOffers
//
//  Created by Nabeel Arif on 4/26/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FyberCredentialModel.h"

@interface OffersTableViewController : UITableViewController
@property (nonatomic, strong) FyberCredentialModel *currentCredential;

@end
