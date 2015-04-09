//
//  UBPriceEstimate.m
//  Pods
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import "UBPriceEstimate.h"

@interface UBPriceEstimate ()

@property (copy, nonatomic, readwrite) NSString *productId;
@property (copy, nonatomic, readwrite) NSString *currencyCode;
@property (copy, nonatomic, readwrite) NSString *displayName;
@property (copy, nonatomic, readwrite) NSString *estimate;
@property (assign, nonatomic, readwrite) NSUInteger lowEstimate;
@property (assign, nonatomic, readwrite) NSUInteger highEstimate;
@property (assign, nonatomic, readwrite) float surgeMultiplier;
@property (assign, nonatomic, readwrite) NSUInteger duration;
@property (assign, nonatomic, readwrite) float distance;

@end

@implementation UBPriceEstimate

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self == nil) {
        return self;
    }

    self.productId = dictionary[@"product_id"];
    self.currencyCode = dictionary[@"currency_code"];
    self.displayName = dictionary[@"display_name"];
    self.estimate = dictionary[@"estimate"];
    self.lowEstimate = [dictionary[@"low_estimate"] unsignedIntegerValue];
    self.highEstimate = [dictionary[@"high_estimate"] unsignedIntegerValue];
    self.surgeMultiplier = [dictionary[@"surge_multiplier"] floatValue];
    self.duration = [dictionary[@"duration"] unsignedIntegerValue];
    self.distance = [dictionary[@"distance"] floatValue];

    return self;
}

@end
