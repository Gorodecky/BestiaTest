//
//  ViewController.m
//  Bestia-test
//
//  Created by Serg on 01.08.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Main.jpg
    CALayer* mainLayer = [CALayer layer];
    mainLayer.frame = CGRectMake(0, 0, 375, 3670);
    [self.mainView.layer addSublayer:mainLayer];
    mainLayer.contents = (id)[UIImage imageNamed:@"Main.jpg"].CGImage;
    
    //News-wood.png
    CALayer* collectionViewLayer = [CALayer layer];
    collectionViewLayer.frame = CGRectMake(0, 370, 375, 328);
    [mainLayer addSublayer:collectionViewLayer];
    collectionViewLayer.contents = (id)[UIImage imageNamed:@"News-wood.png"].CGImage;
    
    //Tmp-album-1.jpg
    CALayer* tmpAlbum1 = [CALayer layer];
    tmpAlbum1.frame = CGRectMake(36, 3255, 106, 150);
    float angleTmpAlbum1 = M_PI_4/30;
    tmpAlbum1.transform = CATransform3DMakeRotation(angleTmpAlbum1, 0, 0.0, 1.0);
    [mainLayer addSublayer:tmpAlbum1];
    tmpAlbum1.contents = (__bridge id)[UIImage imageNamed:@"Tmp-album-1.jpg"].CGImage;
    
    //Tmp-album-2.jpg
    CALayer* tmpAlbum2 = [CALayer layer];
    tmpAlbum2.frame = CGRectMake(195, 3255, 106, 150);
    float angleTmpAlbum2 = M_PI_4/20;
    tmpAlbum2.transform = CATransform3DMakeRotation(angleTmpAlbum2, 0, 0.0, 1.0);
    [mainLayer addSublayer:tmpAlbum2];
    tmpAlbum2.contents = (__bridge id)[UIImage imageNamed:@"Tmp-album-2.jpg"].CGImage;
    
    //Light
    CALayer* light = [CALayer layer];
    light.frame = CGRectMake(173, 2953, 100, 100);
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    animation.duration = 0.5;
    animation.repeatDuration = HUGE_VALF;
    animation.autoreverses = YES;
    [light addAnimation:animation forKey:@"opacity"];
    [mainLayer addSublayer:light];
    light.contents = (__bridge id)[UIImage imageNamed:@"Light.png"].CGImage;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
