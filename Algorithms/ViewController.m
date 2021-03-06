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

    // uncoment to run a method
    // [self sumZero];
    // [self reverseString];
    // [self findElementsFromThreeArrays];
    // [self generateFibonnaciSeries];
    // [self oddNumbers];
    // [self evenNumbers];
    // [self removeSpaceFromString:@"Gohst Busters"];
    [self polydisibility:@"12320"];
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

// Reverse NSString text
- (void)reverseString {
    NSString *myString = @"Plot Twist";
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger stringLength = [myString length];

    while (stringLength > 0) {
        stringLength --;
        NSRange subStrRange = NSMakeRange(stringLength, 1);
        [reversedString appendString:[myString substringWithRange:subStrRange]];
    }

    NSLog(@"%@",reversedString);

}

// Given 3 arrays: NSArray *a = [1,3,4,5]; NSArray *b = [-1,3,0,9]; NSArray *c = [0,31,32,22,6];
// Find the elements from the arrays existing at least in 2 arrays.
// Eg: [3, 0] Because 3 is presented in arrays a & b, and 0 in arrays b, c respectively.
- (void)findElementsFromThreeArrays{
    NSArray *aArray = [[NSArray alloc] initWithObjects: @1,@3,@4,@5,nil];
    NSArray *bArray = [[NSArray alloc] initWithObjects: @-1,@3,@0,@9, nil];
    NSArray *cArray = [[NSArray alloc] initWithObjects: @0,@31,@32,@22,@6, nil];

    NSMutableArray *abcArray = [[NSMutableArray alloc] init];
    [abcArray addObjectsFromArray:aArray];
    [abcArray addObjectsFromArray:bArray];
    [abcArray addObjectsFromArray:cArray];


    NSCountedSet *abcCountSet = [[NSCountedSet alloc] initWithArray:abcArray];

    NSMutableArray *resultArray = [[NSMutableArray alloc] init];


    for (NSNumber *num in abcCountSet) {
        if([abcCountSet countForObject:num]>1){
            if (![resultArray containsObject:num]) {
                [resultArray addObject:num];
                NSLog(@"%@",num);
            }
        }
    }
}

// Generate the first 20 numbers in Fibonacci Series
-(void)generateFibonnaciSeries{

    NSMutableArray *mArray = [[NSMutableArray alloc] initWithObjects:@0,@1, nil];

    for (int i=2; i<20; i++)
    {
        [mArray addObject:[NSNumber numberWithDouble:[[mArray objectAtIndex:i-1] intValue] +[[mArray objectAtIndex:i-2] intValue]]];
    }
    NSLog(@"mArray %@",mArray);
}

// Generate odd numbers 1 - 100
-(void)oddNumbers{
    for (int i=1; i<=100; i++) {
        if ((i % 2) != 0) {
            NSLog(@"%d",i);
        }
    }
}

// Generate even numbers 1 - 100
-(void)evenNumbers{
    for (int i=1; i<=100; i++) {
        if ((i % 2) == 0) {
            NSLog(@"%d",i);
        }
    }
}

// Easy: Ghostbusters : write a function that removes all whitespace from a sting.
// If the string has no whitespace, return a witty comment.
-(void)removeSpaceFromString:(NSString *)str{

    BOOL result = false;
    NSInteger stringLength = [str length];
    NSString *singleChar;
    NSString *newString = @"";

    for (NSInteger i=0; i<stringLength; i++) {

        singleChar = [str substringWithRange:NSMakeRange(i, 1)];

        if ([singleChar isEqualToString:@" "]){
            result = true;
        } else {
            newString = [newString stringByAppendingString:singleChar];
        }
    }

    if (result) {
        NSLog(@"%@",newString);
    } else {
        NSLog(@"Call Ghost Killers!");
    }
}

// polydivisibility: from left to right each digit is divisible by 1, then 2, then 3 etc w/out reminder
// 12320
// 1/1 = 1 true
// 12/2 = 6 true
// 123/3 = 41 true
// 1232/4 = 308 true
// 12320/5 = 2464 true

-(BOOL)polydisibility:(NSString *)str{
    BOOL result = false;
    NSInteger stringLegth = [str length];
    NSString *stringLeftToRight;
    for (NSInteger i=1; i<=stringLegth; i++){
        stringLeftToRight = [str substringWithRange:NSMakeRange(0, i)];
        NSInteger numberToCheck = [stringLeftToRight integerValue];

        if ((numberToCheck % i)==0) {
            result = true;
        } else {
            result = false;
            break;
        }
    }
     NSLog(@"%@", result ? @"true": @"false");

    return result;
}

@end
