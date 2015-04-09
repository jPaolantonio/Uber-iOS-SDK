//
//  UBUserProfile.m
//  Pods
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import "UBUserProfile.h"

@interface UBUserProfile ()

@property (copy, nonatomic, readwrite) NSString *firstName;
@property (copy, nonatomic, readwrite) NSString *lastName;
@property (copy, nonatomic, readwrite) NSString *email;
@property (copy, nonatomic, readwrite) NSString *picture;
@property (copy, nonatomic, readwrite) NSString *promoCode;
@property (copy, nonatomic, readwrite) NSString *uuid;

@end

@implementation UBUserProfile

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self == nil) {
        return self;
    }

    self.firstName = dictionary[@"first_name"];
    self.lastName = dictionary[@"last_name"];
    self.email = dictionary[@"email"];
    self.picture = dictionary[@"picture"];
    self.promoCode = dictionary[@"promo_code"];
    self.uuid = dictionary[@"uuid"];

    return self;
}

@end
