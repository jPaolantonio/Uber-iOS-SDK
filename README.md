# Uber-iOS-SDK

[![CI Status](http://img.shields.io/travis/jaolantonio/Uber-iOS-SDK.svg?style=flat)](https://travis-ci.org/jPaolantonio/Uber-iOS-SDK)
[![Version](https://img.shields.io/cocoapods/v/Uber-iOS-SDK.svg?style=flat)](http://cocoapods.org/pods/Uber-iOS-SDK)
[![License](https://img.shields.io/cocoapods/l/Uber-iOS-SDK.svg?style=flat)](http://cocoapods.org/pods/Uber-iOS-SDK)
[![Platform](https://img.shields.io/cocoapods/p/Uber-iOS-SDK.svg?style=flat)](http://cocoapods.org/pods/Uber-iOS-SDK)

An iOS SDK for the Uber API with a few goals.

* Well-tested
* Well-documented
* Feature complete

Based of the endpoints listed [here](https://developer.uber.com/v1/endpoints/).

## Usage

To get started started using Uber-iOS-SDK, you only need a few lines of code. Here is how you get a list of products.

```objc
[[UBUberAPI shared] setServerToken:@""]; //Set your token here.

[[UBUberAPI shared] getProductsFromLatitude:40.7127
                                  longitude:-74.0059
                                   response:^(NSArray *products, NSError *error) {

}];
```

To get details on a product

```objc
[[UBUberAPI shared] getProductWithId:productId response:^(UBProduct *product, NSError *error) {

}];
```

There is also a sample project in the `Example` director.

## Goals

This project currently includes the following.

* Full model parity with website
  * Properties
  * Parsing
  * Tests
* Sandbox and Production Testing
* API Framework
* API Endpoints
  * GET /v1/products
  * GET /v1/products/{product_id}

The following endpoints are missing

* GET /v1/estimates/price
* GET /v1/estimates/time
* GET /v1/promotions
* GET /v1.1/history
* GET /v1/me
* POST /v1/requests
* GET /v1/requests/{request_id}
* DELETE /v1/requests/{request_id}
* GET /v1/requests/{request_id}/map

We are also missing OAuth sign in.

## Installation

Uber-iOS-SDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Uber-iOS-SDK"
```

## Author

James Paolantonio, [@jPaolantonio](https://twitter.com/jpaolantonio)

Please let me know if you are using this. I would love to hear and help.

## License

Uber-iOS-SDK is available under the MIT license. See the LICENSE file for more info.
