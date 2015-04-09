//
//  UBUberAPI.m
//  Pods
//
//  Created by James Paolantonio on 4/12/15.
//  Copyright 2015 James Paolantonio. All rights reserved.
//

#import "UBUberAPI.h"

#import "UBProduct.h"

NSString * const kUberProductionHostname = @"https://api.uber.com/";
NSString * const kUberSandboxHostname = @"https://sandbox-api.uber.com/";

@interface UBUberAPI ()
@property (strong, nonatomic) NSOperationQueue *operationQueue;
@end

@implementation UBUberAPI

+ (instancetype)shared {
    static dispatch_once_t once;
    static UBUberAPI *sharedInstance = nil;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self == nil) {
        return self;
    }

    _hostname = kUberSandboxHostname;
    _operationQueue = [[NSOperationQueue alloc] init];

    return self;
}

- (void)getProductsFromLatitude:(float)latitude
                      longitude:(float)longitude
                       response:(UBArrayResponseBlock)responseBlock {
    NSString *path = [NSString stringWithFormat:@"%@v1/products?latitude=%f&longitude=%f",
                      self.hostname, latitude, longitude];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path]
                                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                            timeoutInterval:60.f];
    [request addValue:[NSString stringWithFormat:@"Token %@", self.serverToken] forHTTPHeaderField:@"Authorization"];

    [NSURLConnection sendAsynchronousRequest:request
                                       queue:self.operationQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (connectionError) {
                                   responseBlock(nil, connectionError);
                                   return;
                               }

                               NSError *error;
                               NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                            options:0
                                                                                              error:&error];

                               NSArray *productDicts = responseDict[@"products"];
                               NSMutableArray *products = [[NSMutableArray alloc] initWithCapacity:productDicts.count];
                               for (NSDictionary *dict in productDicts) {
                                   [products addObject:[[UBProduct alloc] initWithDictionary:dict]];
                               }

                               dispatch_async(dispatch_get_main_queue(), ^{
                                   responseBlock(products, error);
                               });
                           }];
}

- (void)getProductWithId:(NSString *)productId response:(UBProductResponseBlock)responseBlock {
    NSString *path = [NSString stringWithFormat:@"%@v1/products/%@", self.hostname, productId];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path]
                                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                            timeoutInterval:60.f];
    [request addValue:[NSString stringWithFormat:@"Token %@", self.serverToken] forHTTPHeaderField:@"Authorization"];

    [NSURLConnection sendAsynchronousRequest:request
                                       queue:self.operationQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (connectionError) {
                                   responseBlock(nil, connectionError);
                                   return;
                               }

                               NSError *error;
                               NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                            options:0
                                                                                              error:&error];
                               UBProduct *product = [[UBProduct alloc] initWithDictionary:responseDict];
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   responseBlock(product, error);
                               });
                           }];
}

@end
