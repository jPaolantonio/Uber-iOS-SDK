//
//  UBUserProfile.h
//  Pods
//
//  Created by James Paolantonio on 4/11/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UBUserProfile : NSObject

/**
 *  First name of the Uber user.
 */
@property (copy, nonatomic, readonly) NSString *firstName;

/**
 *  Last name of the Uber user.
 */
@property (copy, nonatomic, readonly) NSString *lastName;

/**
 *  Email address of the Uber user.
 */
@property (copy, nonatomic, readonly) NSString *email;

/**
 *  Image URL of the Uber user.
 */
@property (copy, nonatomic, readonly) NSString *picture;

/**
 *  Promo code of the Uber user.
 */
@property (copy, nonatomic, readonly) NSString *promoCode;

/**
 *  Unique identifier of the Uber user.
 */
@property (copy, nonatomic, readonly) NSString *uuid;

/**
 *  Initializes an `UBUserProfile` object with the configuration dictionary.
 *
 *  This is the designated initializer.
 *
 *  @param dictionary The dictionary to configure with model's properties.
 *
 *  @return An initialized `UBUserProfile` with configured properties.
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary NS_DESIGNATED_INITIALIZER;

@end
