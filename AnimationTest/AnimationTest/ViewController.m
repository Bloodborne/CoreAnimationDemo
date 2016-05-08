//
//  ViewController.m
//  AnimationTest
//
//  Created by Nadesico on 16/3/10.
//  Copyright © 2016年 edu.scau. All rights reserved.
//

#import "ViewController.h"
#import "vc2.h"
#import "UIImage+RoundedCorner.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testView.layer.cornerRadius = 50;
    self.testView.layer.masksToBounds = YES;
    
    self.imageView.image = [self.imageView.image yal_imageWithRoundedCornersAndSize:self.imageView.bounds.size andCornerRadius:20];
}
- (IBAction)tap:(id)sender
{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.5;
    animation.fromValue = @(0.1);
    animation.toValue = @(1.);
    
    [self.testView.layer addAnimation:animation forKey:@"group"];
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseInOut
                     animations:^{
                         [_button.imageView.layer setValue:@1.7 forKeyPath:@"transform.scale"];
                     }
                     completion:^(BOOL finished) {
                         [_button setImage:[UIImage imageNamed:@"timeline_icon_like"] forState:UIControlStateNormal];
                         
                         [UIView animateWithDuration:0.5
                                               delay:0
                                             options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseInOut
                                          animations:^{
                                              [_button.imageView.layer setValue:@1 forKeyPath:@"transform.scale"];
                                          } completion:nil];
                     }];
    
//    vc2 *vc = [[vc2 alloc] init];
//    vc.modalPresentationStyle = UIModalPresentationCustom;
//    vc.transitioningDelegate = self;
//    vc.view.backgroundColor = [UIColor redColor];
//    vc.dismissBlock = ^(){self.view.alpha = 1;};
//    
//    self.view.alpha = 0.4;
    
    //[self presentViewController:vc animated:YES completion:nil];
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    
    return [[CustomSizePresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end

@implementation CustomSizePresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
    
    return CGRectMake(100, 100, 200, 200);
}

@end