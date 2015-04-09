//
//  UBTimeEstimate.m
//  Pods
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import "UBTimeEstimate.h"

@interface UBTimeEstimate ()

@property (copy, nonatomic, readwrite) NSString *productId;
@property (copy, nonatomic, readwrite) NSString *displayName;
@property (assign, nonatomic, readwrite) NSUInteger estimate;

@end

@implementation UBTimeEstimate

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self == nil) {
        return self;
    }

    self.productId = dictionary[@"product_id"];
    self.displayName = dictionary[@"display_name"];
    self.estimate = [dictionary[@"estimate"] unsignedIntegerValue];

    return self;
}

@end
