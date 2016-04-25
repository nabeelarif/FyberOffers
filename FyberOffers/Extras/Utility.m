//
//  Utility.m
//  FyberOffers
//
//  Created by Nabeel Arif on 4/18/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "Utility.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <CommonCrypto/CommonDigest.h>

@implementation Utility

+ (NSString *)getIPAddress {
    
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                }
                
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
    
}
+ (NSString *)sha1ForString:(NSString *)str {
    //    const char *cStr = [str UTF8String];
    //    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    //    CC_SHA1(cStr, (CC_LONG)strlen(cStr), result);
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    NSData *stringBytes = [str dataUsingEncoding: NSUTF8StringEncoding]; /* or some other encoding */
    if (CC_SHA1([stringBytes bytes], (CC_LONG)[stringBytes length], result)) {
        NSString *s = [NSString  stringWithFormat:
                       @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                       result[0], result[1], result[2], result[3], result[4],
                       result[5], result[6], result[7],
                       result[8], result[9], result[10], result[11], result[12],
                       result[13], result[14], result[15],
                       result[16], result[17], result[18], result[19]
                       ];
        
        return s;
    }
    return @"";
}
@end
