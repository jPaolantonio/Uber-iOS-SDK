//
//  UBTimeEstimate.h
//  Pods
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UBTimeEstimate : NSObject

/**
 *  Unique identifier representing a specific product for a given latitude & longitude.
 *  For example, uberX in San Francisco will have a different product_id than uberX in Los Angeles.
 */
@property (copy, nonatomic, readonly) NSString *productId;

/**
 *  Display name of product.
 */
@property (copy, nonatomic, readonly) NSString *displayName;

/**
 *  ETA for the product (in seconds). Always show estimate in minutes.
 */
@property (assign, nonatomic, readonly) NSUInteger estimate;

/**
 *  Initializes an `UBTimeEstimate` object with the configuration dictionary.
 *
 *  This is the designated initializer.
 *
 *  @param dictionary The dictionary to configure with model's properties.
 *
 *  @return An initialized `UBTimeEstimate` with configured properties.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end
