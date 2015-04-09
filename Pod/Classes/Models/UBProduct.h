//
//  UBProduct.h
//  Pods
//
//  Created by James Paolantonio on 4/9/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UBPriceDetails : NSObject

/**
 *  The base price.
 */
@property (assign, nonatomic, readonly) float base;

/**
 *  The minimum price of a trip.
 */
@property (assign, nonatomic, readonly) float minimum;

/**
 *  The charge per minute (if applicable for the product type).
 */
@property (assign, nonatomic, readonly) float costPerMinute;

/**
 *  The charge per distance unit (if applicable for the product type).
 */
@property (assign, nonatomic, readonly) float costPerDistance;

/**
 *  The unit of distance used to calculate the fare (either mile or km).
 */
@property (copy, nonatomic, readonly) NSString *distanceUnit;

/**
 *  The fee if a rider cancels the trip after the grace period.
 */
@property (assign, nonatomic, readonly) float cancellationFee;

/**
 *  ISO 4217 currency code.
 */
@property (copy, nonatomic, readonly) NSString *currencyCode;

/**
 *  Array containing additional fees added to the price of a product.
 *  Additional fees include,
 *    `NSString` The name of the service fee,
 *    `float` The amount of the service fee.
 */
@property (copy, nonatomic, readonly) NSArray *serviceFees;

/**
 *  Initializes an `UBPriceDetails` object with the configuration dictionary.
 *
 *  This is the designated initializer.
 *
 *  @param dictionary The dictionary to configure with model's properties.
 *
 *  @return An initialized `UBPriceDetails` with configured properties.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end

@interface UBProduct : NSObject

/**
 *  Unique identifier representing a specific product for a given latitude & longitude.
 *  For example, uberX in San Francisco will have a different product_id than uberX in Los Angeles.
 */
@property (copy, nonatomic, readonly) NSString *productId;

/**
 *  Description of product.
 */
@property (copy, nonatomic, readonly) NSString *productDescription;

/**
 *  Display name of product.
 */
@property (copy, nonatomic, readonly) NSString *displayName;

/**
 *  Capacity of product. For example, 4 people.
 */
@property (assign, nonatomic, readonly) NSUInteger capacity;

/**
 *  Image URL representing the product.
 */
@property (copy, nonatomic, readonly) NSString *image;

/**
 *  The basic price details (not including any surge pricing adjustments).
 *  If null, the price is a metered fare such as a taxi service.
 */
@property (strong, nonatomic, readonly) UBPriceDetails *priceDetails;

/**
 *  Initializes an `UBProduct` object with the configuration dictionary.
 *
 *  This is the designated initializer.
 *
 *  @param dictionary The dictionary to configure with model's properties.
 *
 *  @return An initialized `UBProduct` with configured properties.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end
