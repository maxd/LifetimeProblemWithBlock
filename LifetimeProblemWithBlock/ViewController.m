//
//  ViewController.m
//  LifetimeProblemWithBlock
//
//  Created by Maxim Dobryakov on 4/7/13.
//  Copyright (c) 2013 protonail.com. All rights reserved.
//

#import "ViewController.h"
#import "Foo.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    Foo *foo = [Foo new];
    [foo asyncMethod];
    
    NSLog(@"Async method called");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
