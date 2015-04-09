//
//  UBUserProfileSpec.m
//  Uber-iOS-SDK
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright (c) 2015 James Paolantonio. All rights reserved.
//

#import "UBUserProfile.h"

@implementation UBUserProfile (Samples)

+ (NSDictionary *)sampleResponse {
    return @{
             @"first_name": @"Uber",
             @"last_name": @"Developer",
             @"email": @"developer@uber.com",
             @"picture": @"https://...",
             @"promo_code": @"teypo",
             @"uuid": @"91d81273-45c2-4b57-8124-d0165f8240c0"
             };
}

@end

SpecBegin(UBUserProfile)

describe(@"parsing", ^{
    __block UBUserProfile *userProfile;

    beforeEach(^{
        userProfile = [[UBUserProfile alloc] initWithDictionary:[UBUserProfile sampleResponse]];
    });

    it(@"parses a sample dictionary", ^{
        expect(userProfile.firstName).to.equal(@"Uber");
        expect(userProfile.lastName).to.equal(@"Developer");
        expect(userProfile.email).to.equal(@"developer@uber.com");
        expect(userProfile.picture).to.equal(@"https://...");
        expect(userProfile.promoCode).to.equal(@"teypo");
        expect(userProfile.uuid).to.equal(@"91d81273-45c2-4b57-8124-d0165f8240c0");
    });
});

SpecEnd
