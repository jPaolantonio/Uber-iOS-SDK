//
//  UBPriceEstimate.h
//  Pods
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UBPriceEstimate : NSObject

/**
 *  Unique identifier representing a specific product for a given latitude & longitude.
 *  For example, uberX in San Francisco will have a different product_id than uberX in Los Angeles.
 */
@property (copy, nonatomic, readonly) NSString *productId;

/**
 *  ISO 4217 currency code.
 */
@property (copy, nonatomic, readonly) NSString *currencyCode;

/**
 *  Display name of product.
 */
@property (copy, nonatomic, readonly) NSString *displayName;

/**
 *  Formatted string of estimate in local currency of the start location.
 *  Estimate could be a range, a single number (flat rate) or "Metered" for TAXI.
 */
@property (copy, nonatomic, readonly) NSString *estimate;

/**
 *  Lower bound of the estimated price.
 */
@property (assign, nonatomic, readonly) NSUInteger lowEstimate;

/**
 *  Upper bound of the estimated price.
 */
@property (assign, nonatomic, readonly) NSUInteger highEstimate;

/**
 *  Expected surge multiplier. Surge is active if surge_multiplier is greater than 1.
 *  Price estimate already factors in the surge multiplier.
 */
@property (assign, nonatomic, readonly) float surgeMultiplier;

/**
 *  Expected activity duration (in seconds). Always show duration in minutes.
 */
@property (assign, nonatomic, readonly) NSUInteger duration;

/**
 *  Expected activity distance (in miles).
 */
@property (assign, nonatomic, readonly) float distance;

/**
 *  Initializes an `UBPriceEstimate` object with the configuration dictionary.
 *
 *  This is the designated initializer.
 *
 *  @param dictionary The dictionary to configure with model's properties.
 *
 *  @return An initialized `UBPriceEstimate` with configured properties.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end
