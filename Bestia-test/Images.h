//
//  Images.h
//  Bestia-test
//
//  Created by Serg on 05.08.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Images : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * data;
@property (nonatomic, retain) NSNumber * collection;

@end
