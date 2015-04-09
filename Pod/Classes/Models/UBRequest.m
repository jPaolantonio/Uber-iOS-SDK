//
//  UBRequest.m
//  Pods
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import "UBRequest.h"

#import "UBModelParsing.h"

@interface UBRequest ()

@property (copy, nonatomic, readwrite) NSString *requestId;
@property (copy, nonatomic, readwrite) NSString *status;
@property (strong, nonatomic, readwrite) id vehicle;
@property (strong, nonatomic, readwrite) id driver;
@property (strong, nonatomic, readwrite) id location;
@property (assign, nonatomic, readwrite) NSUInteger eta;
@property (assign, nonatomic, readwrite) float surgeMultiplier;

@end

@implementation UBRequest

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self == nil) {
        return self;
    }

    self.requestId = dictionary[@"request_id"];
    self.status = dictionary[@"status"];
    self.vehicle = safeNil(dictionary[@"vehicle"]);
    self.driver = safeNil(dictionary[@"driver"]);
    self.location = safeNil(dictionary[@"location"]);
    self.eta = [dictionary[@"eta"] unsignedIntegerValue];
    self.surgeMultiplier = [safeNil(dictionary[@"surge_multiplier"]) floatValue];

    return self;
}

@end
