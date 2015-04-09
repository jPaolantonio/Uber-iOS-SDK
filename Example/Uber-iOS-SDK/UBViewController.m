//
//  UBViewController.m
//  Uber-iOS-SDK
//
//  Created by James Paolantonio on 04/09/2015.
//  Copyright (c) 2014 James Paolantonio. All rights reserved.
//

#import "UBViewController.h"

#import <UberSDK/UberSDK.h>

@interface UBViewController ()

@end

@implementation UBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[UBUberAPI shared] setServerToken:@""]; //Set your token here.

    typeof(self) __weak reference = self;
    [[UBUberAPI shared] getProductsFromLatitude:40.7127
                                      longitude:-74.0059
                                       response:^(NSArray *products, NSError *error) {
                                           UBProduct *product = [products firstObject];
                                           [reference getProduct:product.productId];
    }];
}

- (void)getProduct:(NSString *)productId {
    [[UBUberAPI shared] getProductWithId:productId response:^(UBProduct *product, NSError *error) {

    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
