//
//  vc2.m
//  AnimationTest
//
//  Created by Nadesico on 16/3/14.
//  Copyright © 2016年 edu.scau. All rights reserved.
//

#import "vc2.h"

@implementation vc2

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    if ([touch.view isEqual:self.view]) {
        NSLog(@"can dismiss self ???");
        [self dismissViewControllerAnimated:self completion:nil];
    }
    
}

@end
