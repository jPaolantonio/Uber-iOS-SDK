//
//  UBUberAPI.h
//  Pods
//
//  Created by James Paolantonio on 4/12/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UBProduct;

extern NSString * const kUberProductionHostname;
extern NSString * const kUberSandboxHostname;

typedef void(^UBArrayResponseBlock)(NSArray *, NSError *);
typedef void(^UBProductResponseBlock)(UBProduct *, NSError *);

@interface UBUberAPI : NSObject

/**
 *  @return Singleton `UBUberAPI`
 */
+ (instancetype)shared;

/**
 *  The hostname for Uber's API.
 *  Default value is `kUberProductionHostname`. Can be set to `kUberSandboxHostname`.
 */
@property (copy, nonatomic) NSString *hostname;

/**
 *  Set this to authenticate with the Uber API
 */
@property (copy, nonatomic) NSString *serverToken;

/**
 *  Gets a list of Uber products.
 *
 *  @param latitude      Latitude component of location.
 *  @param longitude     Longitude component of location.
 *  @param responseBlock A block with two arguements, an array of parsed `UBProduct` and an `NSError`.
 */
- (void)getProductsFromLatitude:(float)latitude
                      longitude:(float)longitude
                       response:(UBArrayResponseBlock)responseBlock;

/**
 *  Gets details on an Uber product.
 *
 *  @param productId     Id of requested project
 *  @param responseBlock A block with two arguements, an `UBProduct` and an `NSError`.
 */
- (void)getProductWithId:(NSString *)productId response:(UBProductResponseBlock)responseBlock;

@end
