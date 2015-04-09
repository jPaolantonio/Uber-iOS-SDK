//
//  UBPromotionSpec.m
//  Uber-iOS-SDK
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright (c) 2015 James Paolantonio. All rights reserved.
//

#import "UBPromotion.h"

@implementation UBPromotion (Samples)

+ (NSDictionary *)sampleResponse {
    return @{
             @"display_text": @"Free ride up to $30",
             @"localized_value": @"$30",
             @"type": @"trip_credit"
             };
}

@end

SpecBegin(UBPromotion)

describe(@"parsing", ^{
    __block UBPromotion *promotion;

    beforeEach(^{
        promotion = [[UBPromotion alloc] initWithDictionary:[UBPromotion sampleResponse]];
    });

    it(@"parses a sample dictionary", ^{
        expect(promotion.displayText).to.equal(@"Free ride up to $30");
        expect(promotion.localizedValue).to.equal(@"$30");
        expect(promotion.type).to.equal(@"trip_credit");
    });
});

SpecEnd
