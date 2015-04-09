//
//  UBPromotion.m
//  Pods
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import "UBPromotion.h"

@interface UBPromotion ()

@property (copy, nonatomic, readwrite) NSString *displayText;
@property (copy, nonatomic, readwrite) NSString *localizedValue;
@property (copy, nonatomic, readwrite) NSString *type;

@end

@implementation UBPromotion

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self == nil) {
        return self;
    }

    self.displayText = dictionary[@"display_text"];
    self.localizedValue = dictionary[@"localized_value"];
    self.type = dictionary[@"type"];

    return self;
}

@end
