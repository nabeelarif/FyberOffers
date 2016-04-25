//
//  OfferModel.m
//  FyberOffers
//
//  Created by Nabeel Arif on 4/26/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "OfferModel.h"

@implementation OfferModel

-(void)parseWithDictionary:(NSDictionary *)dictionary
{
    self.title = [dictionary valueForKey:@"title"];
    self.offer_id = [[dictionary valueForKey:@"offer_id"] integerValue];
    self.teaser = [dictionary valueForKey:@"teaser"];
    self.required_actions = [dictionary valueForKey:@"required_actions"];
    self.payout = [[dictionary valueForKey:@"payout"] integerValue];
    self.thumbnailHires = [dictionary valueForKey:@"thumbnail"][@"hires"];
    self.thumbnailLowres = [dictionary valueForKey:@"thumbnail"][@"lowres"];
}
@end
