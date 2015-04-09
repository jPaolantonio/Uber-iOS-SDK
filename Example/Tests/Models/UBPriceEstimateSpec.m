//
//  UBPriceEstimateSpec.m
//  Uber-iOS-SDK
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import "UBPriceEstimate.h"

@implementation UBPriceEstimate (Samples)

+ (NSDictionary *)sampleResponse {
    return @{
             @"product_id": @"08f17084-23fd-4103-aa3e-9b660223934b",
             @"currency_code": @"USD",
             @"display_name": @"UberBLACK",
             @"estimate": @"$23-29",
             @"low_estimate": @23,
             @"high_estimate": @29,
             @"surge_multiplier": @1,
             @"duration": @640,
             @"distance": @5.34
    };
}

@end

SpecBegin(UBPriceEstimate)

describe(@"parsing", ^{
    __block UBPriceEstimate *priceEstimate;

    beforeEach(^{
        priceEstimate = [[UBPriceEstimate alloc] initWithDictionary:[UBPriceEstimate sampleResponse]];
    });

    it(@"parses a sample dictionary", ^{
        expect(priceEstimate.productId).to.equal(@"08f17084-23fd-4103-aa3e-9b660223934b");
        expect(priceEstimate.currencyCode).to.equal(@"USD");
        expect(priceEstimate.displayName).to.equal(@"UberBLACK");
        expect(priceEstimate.estimate).to.equal(@"$23-29");
        expect(priceEstimate.lowEstimate).to.equal(@23);
        expect(priceEstimate.highEstimate).to.equal(@29);
        expect(priceEstimate.surgeMultiplier).to.equal(@1);
        expect(priceEstimate.duration).to.equal(@640);
        expect(priceEstimate.distance).to.equal( @5.34);
    });
});

SpecEnd
