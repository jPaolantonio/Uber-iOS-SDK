//
//  UBProductSpec.m
//  Uber-iOS-SDK
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright (c) 2015 James Paolantonio. All rights reserved.
//

#import "UBProduct.h"

@implementation UBProduct (Samples)

+ (NSDictionary *)sampleResponse {
    return @{
             @"capacity": @4,
             @"description": @"The low-cost Uber",
             @"price_details": @{
                     @"distance_unit": @"mile",
                     @"cost_per_minute": @0.26,
                     @"service_fees": @[
                             @{
                                 @"fee": @1.0,
                                 @"name": @"Safe Rides Fee"
                                 }
                             ],
                     @"minimum": @5.0,
                     @"cost_per_distance": @1.3,
                     @"base": @2.2,
                     @"cancellation_fee": @5.0,
                     @"currency_code": @"USD"
                     },
             @"image": @"http://d1a3f4spazzrp4.cloudfront.net/car.jpg",
             @"display_name": @"uberX",
             @"product_id": @"a1111c8c-c720-46c3-8534-2fcdd730040d"
             };
}

@end

SpecBegin(UBProduct)

describe(@"parsing", ^{
    __block UBProduct *product;

    beforeEach(^{
        product = [[UBProduct alloc] initWithDictionary:[UBProduct sampleResponse]];
    });

    it(@"parses a sample dictionary", ^{
        expect(product.capacity).to.equal(@4);
        expect(product.productDescription).to.equal(@"The low-cost Uber");
        expect(product.image).to.equal(@"http://d1a3f4spazzrp4.cloudfront.net/car.jpg");
        expect(product.displayName).to.equal(@"uberX");
        expect(product.productId).to.equal(@"a1111c8c-c720-46c3-8534-2fcdd730040d");
    });

    it(@"parse price details", ^{
        UBPriceDetails *details = product.priceDetails;

        expect(details).to.beKindOf([UBPriceDetails class]);
        expect(details.distanceUnit).to.equal(@"mile");
        expect(details.costPerMinute).to.equal(0.26);
        expect(details.minimum).to.equal(5);
        expect(details.costPerDistance).to.equal(1.3);
        expect(details.base).to.equal(2.2);
        expect(details.cancellationFee).to.equal(5);
        expect(details.currencyCode).to.equal(@"USD");

        NSDictionary *serviceFee = details.serviceFees[0];
        expect(serviceFee).to.beKindOf([NSDictionary class]);
        expect(serviceFee[@"fee"]).to.equal(@1.0);
        expect(serviceFee[@"name"]).to.equal(@"Safe Rides Fee");
    });
});

SpecEnd
