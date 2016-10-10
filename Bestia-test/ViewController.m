//
//  ViewController.m
//  Bestia-test
//
//  Created by Serg on 01.08.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import "ViewController.h"
#import "Utility.h"
#import "Images.h"

@interface ViewController () <UICollectionViewDataSource,
                                UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray* albumImages;
@property (strong, nonatomic) NSMutableArray* posterImages;

@property (strong, nonatomic) Images* imageLayer;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.hidden = NO;
    
    [self createLayers];
    
    
    Utility* createArraysImages = [[Utility alloc] init];
    [createArraysImages receivingImage];
    
    self.albumImages = createArraysImages.albumImages;
    self.posterImages = createArraysImages.posterImages;
    
    [self.collectionView reloadData];
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    return self.posterImages.count;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* identifier = @"collectionViewCell";
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    /*
    if (!cell) {
        UICollectionViewCell* cell = [[UICollectionViewCell alloc] init];
    }*/
    
    
    
    self.imageLayer = [self.albumImages objectAtIndex:indexPath.row];
    
    UIImage *image = [UIImage imageWithData:self.imageLayer.data];
    
    self.cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    self.cellImageView.hidden = NO;
    
    //set image. delete this line if there's no before picking image in uipickercontroller
    [self.cellImageView setImage:image];
    
    [cell addSubview:self.cellImageView];
    
    /*
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setImage:image];
    
    cell.layer.frame = CGRectMake(0, 10, 242, 287);
    
    cell.layer.contents = (__bridge id) [UIImage imageWithData:self.imageLayer.data].CGImage;
    
    */
    
    
    

    
    return cell;
}

#pragma mark - Create Layers
- (void) createLayers {
    /*
    CALayer* navLayer = [CALayer layer];
    navLayer.frame = self.navigationBar.frame;
    [self.navigationBar.layer addSublayer:navLayer];
    navLayer.contents = (__bridge id)[UIImage imageNamed:@"Top.png"].CGImage;
    */
    //Main.jpg
    CALayer* mainLayer = [CALayer layer];
    mainLayer.frame = CGRectMake(0, 0, 375, 3670);
    [self.mainView.layer addSublayer:mainLayer];
    
    
    mainLayer.contents = (id)[UIImage imageNamed:@"Main.jpg"].CGImage;
    /*
    //News-wood.png
    CALayer* collectionViewLayer = [CALayer layer];
    collectionViewLayer.frame = CGRectMake(0,0,370,328);///(0, 370, 375, 328);
    [self.collectionView.layer addSublayer:collectionViewLayer];
    collectionViewLayer.contents = (id)[UIImage imageNamed:@"News-wood.png"].CGImage;
    */
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
    light.frame = CGRectMake(194, 2978, 50, 50);
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    animation.duration = 0.5;
    animation.repeatDuration = HUGE_VALF;
    animation.autoreverses = YES;
    
    [light addAnimation:animation forKey:@"opacity"];
    [mainLayer addSublayer:light];
    light.contents = (__bridge id)[UIImage imageNamed:@"Light.png"].CGImage;
    
    //Stick
    CALayer* stick = [CALayer layer];
    stick.frame = CGRectMake(0, 70, 100, 100);
    CALayer* stick2 = [CALayer layer];
    stick2.frame = CGRectMake(100, 2750, 100, 200);
    [stick2 addSublayer:stick];
    CABasicAnimation* animationStick = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animationStick.toValue = [NSNumber numberWithFloat:M_PI/10];
    animationStick.fromValue = [NSNumber numberWithFloat:-M_PI/10];
    animationStick.duration = 1;
    
    animationStick.repeatDuration = HUGE_VALF;
    animationStick.autoreverses = YES;
    
    [stick2 addAnimation:animationStick forKey:@"rotationAnimation"];
    
    [mainLayer addSublayer:stick2];
    stick.contents = (__bridge id)[UIImage imageNamed:@"Stick.png"].CGImage;

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
