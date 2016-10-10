//
//  ViewController.h
//  Bestia-test
//
//  Created by Serg on 01.08.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *subView;

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
//@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (strong, nonatomic) IBOutlet UIImageView* cellImageView;

@end

