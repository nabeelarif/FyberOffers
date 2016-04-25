//
//  FyberCredentialModel.m
//  FyberOffers
//
//  Created by Nabeel Arif on 4/26/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "FyberCredentialModel.h"

@implementation FyberCredentialModel
-(BOOL)isEqual:(id)object{
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[FyberCredentialModel class]]) {
        return NO;
    }
    
    return [self isEqualToCredential:(FyberCredentialModel *)object];
}
-(BOOL)isEqualToCredential:(FyberCredentialModel*)object{
    
    return [self.uid isEqualToString:object.uid] &&
    [self.apiKey isEqualToString:object.apiKey] &&
    [self.appId isEqualToString:object.appId];
}
@end
