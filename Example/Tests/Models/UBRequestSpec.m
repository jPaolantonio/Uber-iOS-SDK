//
//  UBRequestSpec.m
//  Uber-iOS-SDK
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright (c) 2015 James Paolantonio. All rights reserved.
//

#import "UBRequest.h"

@implementation UBRequest (Samples)

+ (NSDictionary *)sampleResponse {
    return @{
             @"request_id": @"852b8fdd-4369-4659-9628-e122662ad257",
             @"status": @"processing",
             @"vehicle": [NSNull null],
             @"driver": [NSNull null],
             @"location": [NSNull null],
             @"eta": @5,
             @"surge_multiplier": [NSNull null]
             };
}

@end

SpecBegin(UBRequest)

describe(@"parsing", ^{
    __block UBRequest *request;

    beforeEach(^{
        request = [[UBRequest alloc] initWithDictionary:[UBRequest sampleResponse]];
    });

    it(@"parses a sample dictionary", ^{
        expect(request.requestId).to.equal(@"852b8fdd-4369-4659-9628-e122662ad257");
        expect(request.status).to.equal(@"processing");
        expect(request.vehicle).to.beNil();
        expect(request.driver).to.beNil();
        expect(request.location).to.beNil();
        expect(request.eta).to.equal(5);
        expect(request.surgeMultiplier).to.equal(0);
    });
});

SpecEnd
