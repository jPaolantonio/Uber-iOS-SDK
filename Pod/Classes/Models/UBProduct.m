//
//  UBProduct.m
//  Pods
//
//  Created by James Paolantonio on 4/9/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import "UBProduct.h"

#import "UBModelParsing.h"

@interface UBPriceDetails ()

@property (assign, nonatomic, readwrite) float base;
@property (assign, nonatomic, readwrite) float minimum;
@property (assign, nonatomic, readwrite) float costPerMinute;
@property (assign, nonatomic, readwrite) float costPerDistance;
@property (copy, nonatomic, readwrite) NSString *distanceUnit;
@property (assign, nonatomic, readwrite) float cancellationFee;
@property (copy, nonatomic, readwrite) NSString *currencyCode;
@property (copy, nonatomic, readwrite) NSArray *serviceFees;

@end

@implementation UBPriceDetails

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self == nil) {
        return self;
    }

    self.base = [dictionary[@"base"] floatValue];
    self.minimum = [dictionary[@"minimum"] floatValue];
    self.costPerMinute = [dictionary[@"cost_per_minute"] floatValue];
    self.costPerDistance = [dictionary[@"cost_per_distance"] floatValue];
    self.distanceUnit = dictionary[@"distance_unit"];
    self.cancellationFee = [dictionary[@"cancellation_fee"] floatValue];
    self.currencyCode = dictionary[@"currency_code"];
    self.serviceFees = dictionary[@"service_fees"];

    return self;
}

@end

@interface UBProduct ()

@property (copy, nonatomic, readwrite) NSString *productId;
@property (copy, nonatomic, readwrite) NSString *productDescription;
@property (copy, nonatomic, readwrite) NSString *displayName;
@property (assign, nonatomic, readwrite) NSUInteger capacity;
@property (copy, nonatomic, readwrite) NSString *image;
@property (strong, nonatomic, readwrite) UBPriceDetails *priceDetails;

@end

@implementation UBProduct

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self == nil) {
        return self;
    }

    self.productId = dictionary[@"product_id"];
    self.productDescription = dictionary[@"description"];
    self.displayName = dictionary[@"display_name"];
    self.capacity = [dictionary[@"capacity"] unsignedIntegerValue];
    self.image = dictionary[@"image"];

    self.priceDetails = [[UBPriceDetails alloc] initWithDictionary:safeNil(dictionary[@"price_details"])];

    return self;
}

@end
