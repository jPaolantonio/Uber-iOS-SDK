//
//  UBRequest.h
//  Pods
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UBRequest : NSObject

/**
 *  The unique ID of the Request.
 */
@property (copy, nonatomic, readonly) NSString *requestId;

/**
 *  The status of the Request indicating state.
 */
@property (copy, nonatomic, readonly) NSString *status;

/**
 *  The object that contains vehicle details.
 */
@property (strong, nonatomic, readonly) id vehicle;

/**
 *  The object that contains driver details.
 */
@property (strong, nonatomic, readonly) id driver;

/**
 *  The object that contains the location information of the vehicle and driver.
 */
@property (strong, nonatomic, readonly) id location;

/**
 *  The estimated time of vehicle arrival in minutes.
 */
@property (assign, nonatomic, readonly) NSUInteger eta;

/**
 *  The surge pricing multiplier used to calculate the increased price of a Request.
 *  A multiplier of 1.0 means surge pricing is not in effect.
 */
@property (assign, nonatomic, readonly) float surgeMultiplier;

/**
 *  Initializes an `UBRequest` object with the configuration dictionary.
 *
 *  This is the designated initializer.
 *
 *  @param dictionary The dictionary to configure with model's properties.
 *
 *  @return An initialized `UBRequest` with configured properties.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end
