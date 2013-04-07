//
//  Foo.m
//  LifetimeProblemWithBlock
//
//  Created by Maxim Dobryakov on 4/7/13.
//  Copyright (c) 2013 protonail.com. All rights reserved.
//

#import "Foo.h"
#import "AsyncClass.h"
#import "AsyncResult.h"

typedef AsyncResult * (^Block)();

@implementation Foo

- (AsyncResult *)asyncMethod {
    Block block = ^{
        AsyncClass *asyncClass = [AsyncClass new];

        return [asyncClass asyncMethod];
    };

    return block();
}

@end
