//
//  Utility.h
//  Bestia-test
//
//  Created by Serg on 09.08.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Utility : NSObject

+ (NSManagedObjectContext*) managedObjectContext;

- (void) checkTheAvailabilityOfTheCoreData;
- (void) receivingImage;
@end
