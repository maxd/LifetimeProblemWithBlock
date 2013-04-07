//
//  AsyncClass.m
//  LifetimeProblemWithBlock
//
//  Created by Maxim Dobryakov on 4/7/13.
//  Copyright (c) 2013 protonail.com. All rights reserved.
//

#import "AsyncClass.h"
#import <StoreKit/StoreKit.h>

#define AntiARCRetain(...) void *retainedThing = (__bridge_retained void *)__VA_ARGS__; retainedThing = retainedThing
#define AntiARCRelease(...) void *retainedThing = (__bridge void *) __VA_ARGS__; id unretainedThing = (__bridge_transfer id)retainedThing; unretainedThing = nil

@interface AsyncClass () <SKProductsRequestDelegate>

@end

@implementation AsyncClass {
    AsyncResult *_asyncResult;

    SKProductsRequest *_productsRequest;
}

- (AsyncResult *)asyncMethod {
    AntiARCRetain(self);

    _asyncResult = [AsyncResult new];
    
    NSMutableSet *productIdentifiers = [NSMutableSet new];
    [productIdentifiers addObject:@"com.example.product"];
    
    _productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    _productsRequest.delegate = self;
    [_productsRequest start];
    
    
    return _asyncResult;
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    [_asyncResult result];
    
    AntiARCRelease(self);
}

@end
