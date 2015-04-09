//
//  UBPromotion.h
//  Pods
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UBPromotion : NSObject

/**
 *  A localized string we recommend to use when offering the promotion to users.
 */
@property (copy, nonatomic, readonly) NSString *displayText;

/**
 *  The value of the promotion that is available to a user in this location in the local currency.
 */
@property (copy, nonatomic, readonly) NSString *localizedValue;

/**
 *  The type of the promo which is either "trip_credit" or "account_credit".
 */
@property (copy, nonatomic, readonly) NSString *type;


/**
 *  Initializes an `UBPromotion` object with the configuration dictionary.
 *
 *  This is the designated initializer.
 *
 *  @param dictionary The dictionary to configure with model's properties.
 *
 *  @return An initialized `UBPromotion` with configured properties.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end
