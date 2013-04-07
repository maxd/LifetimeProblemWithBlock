//
//  Foo.h
//  LifetimeProblemWithBlock
//
//  Created by Maxim Dobryakov on 4/7/13.
//  Copyright (c) 2013 protonail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncResult.h"

@interface Foo : NSObject

- (AsyncResult *)asyncMethod;

@end
