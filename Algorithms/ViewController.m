//
//  ViewController.m
//  Algorithms
//
//  Created by Rumiya Murtazina on 12/3/15.
//  Copyright © 2015 abearablecode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) NSArray *arrayNum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self sumZero];
}

// Given an array of integers [-1,1,2,4,3] return true if there are 2 elements that sums 0
- (void)sumZero {
    self.arrayNum = [[NSArray alloc] initWithObjects: @-1,@1,@2,@4,@3,nil];

    for (int i=0; i<self.arrayNum.count; i++)
    {
        for (int j=i+1; j<self.arrayNum.count; j++)
        {
            NSInteger iValue = [[self.arrayNum objectAtIndex:i] integerValue];
            NSInteger jValue = [[self.arrayNum objectAtIndex:j] integerValue];
            NSInteger k = iValue+ jValue;
            if (k==0) {
                NSLog(@"%ld + %ld = %ld Zero!",(long)iValue,(long)jValue,(long)k);
            } else {
                NSLog(@"%ld + %ld = %ld",(long)iValue,(long)jValue,(long)k);
            }
        }

    }

}


@end
