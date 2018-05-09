//
//  ViewController.m
//  WZUtility
//
//  Created by wz on 2018/5/7.
//  Copyright © 2018年 @. All rights reserved.
//

#import "ViewController.h"
#import "WZRefection.h"
#import "Person.h"
#import "NSObject+YYAdd.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSLog(@"%@",[WZRefection objectPropertiesWithClass:NSClassFromString(@"Parent")]);
//    NSLog(@"%@",[WZRefection objectPropertiesWithClass:NSClassFromString(@"Child")]);
//    NSLog(@"%@",[WZRefection executeClassMethod:@"Person" method:@"sleepHour:name:" parameters:@[@(19.9982),@"wang"]]);
//    [WZRefection executeClassMethod:@"Person" method:@"eat" parameters:@[]];

    //NSLog(@"%@, %@",child.name,NSStringFromCGSize(child.size));
    [self test];
    
}

- (void)test {
    Child *child = [WZRefection executeClassMethod:@"Parent" method:@"giveBirthToChild:" parameters:@[@(CGSizeMake(200, 300))]];
    NSLog(@"%@",NSStringFromCGSize(child.size));
    
    CGFloat height = [[WZRefection executeClassMethod:@"Parent" method:@"giveHeight:" parameters:@[@(1297.9331)]] floatValue];

    NSLog(@"%lf",height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
