//
//  UBTimeEstimateSpec.m
//  Uber-iOS-SDK
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright (c) 2015 James Paolantonio. All rights reserved.
//

#import "UBTimeEstimate.h"

@implementation UBTimeEstimate (Samples)

+ (NSDictionary *)sampleResponse {
    return @{
             @"product_id": @"5f41547d-805d-4207-a297-51c571cf2a8c",
             @"display_name": @"UberBLACK",
             @"estimate": @410
             };
}

@end

SpecBegin(UBTimeEstimate)

describe(@"parsing", ^{
    __block UBTimeEstimate *timeEstimate;

    beforeEach(^{
        timeEstimate = [[UBTimeEstimate alloc] initWithDictionary:[UBTimeEstimate sampleResponse]];
    });

    it(@"parses a sample dictionary", ^{
        expect(timeEstimate.productId).to.equal(@"5f41547d-805d-4207-a297-51c571cf2a8c");
        expect(timeEstimate.displayName).to.equal(@"UberBLACK");
        expect(timeEstimate.estimate).to.equal(410);
    });
});

SpecEnd
