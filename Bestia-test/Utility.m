//
//  Utility.m
//  Bestia-test
//
//  Created by Serg on 09.08.16.
//  Copyright (c) 2016 Vitaliy Horodecky. All rights reserved.
//

#import "Utility.h"
#import "AppDelegate.h"
#import "Images.h"


@interface Utility ()

@property (strong, nonatomic) NSMutableArray* albumImages;
@property (strong, nonatomic) NSMutableArray* posterImages;

@end;

@implementation Utility


+ (NSManagedObjectContext*) managedObjectContext {
    
    NSManagedObjectContext* context = nil;// обявляется переменная контекст
    
    id delegate = [[UIApplication sharedApplication] delegate];//получаем объект апделегата
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {//если наш объект делегат может ответить на метод менеджобжект контекст возвращает да попадаем в середину
        context = [delegate managedObjectContext];// получаем менеджобжектконтекст с апделегата
    }
    
    return context;
}

- (void) checkTheAvailabilityOfTheCoreData {
    
    if ([self checkForImages]) {
        
        // метод вызывает малюнки из коре даты и записывает два масива poster и album
        
        [self receivingImage];
        
    } else {
        
        [self createImage];// метод записывает рисунки в коредату
        
    }
    
}

- (void) receivingImage {
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Image"];
    
    NSError* requestError = nil;
    
    NSArray* arrayImage = [[Utility managedObjectContext] executeFetchRequest:fetchRequest error:&requestError];
    
    if ([arrayImage count] > 0) {
        
        NSUInteger counter = 1;
        
        for (Images* image in arrayImage) {
            
            //NSNumber* no = @(NO);
            NSNumber* yes = [[NSNumber alloc] initWithBool:YES];
            
            
            if (image.collection == yes) {
                
                [self.albumImages addObject:image];
                
            } else {
                
                [self.posterImages addObject:image];
            }
            
            counter++;
        }
    }
    
}

- (void) createImage {
    
    NSNumber* no = @(NO);
    NSNumber* yes = [[NSNumber alloc] initWithBool:YES];
    
    [self createImageWithName:@"Tmp-album-1"
                        image:[UIImage imageNamed:@"Tmp-album-1.jpg"]
                   collection:no];
    
    [self createImageWithName:@"Tmp-album-2"
                        image:[UIImage imageNamed:@"Tmp-album-2.jpg"]
                   collection:no];
    
    [self createImageWithName:@"Tmp-poster-1"
                        image:[UIImage imageNamed:@"Tmp-poster-1.jpg"]
                   collection:yes];
    
    
    [self createImageWithName:@"Tmp-poster-2"
                        image:[UIImage imageNamed:@"Tmp-poster-2.jpg"]
                   collection:yes];
    
}

- (BOOL) createImageWithName:(NSString*) name
                       image:(UIImage*) image
                  collection:(NSNumber*) boolean {
    
    
    BOOL result = 0;
    
    NSData* dataImage = UIImageJPEGRepresentation(image, 1.0f);
    
    if ([name length] == 0)  {
        
        return NO;
    }
    
    Images* newImage = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Image"
                        inManagedObjectContext:[Utility managedObjectContext]];
    
    if (newImage == nil) {
        NSLog(@"failed create the new person");
        
        return NO;
    }
    
    if ((newImage.name.length == 0) || (newImage.data = nil) || (newImage.collection = nil)) {
        return  NO;
    }
    
    newImage.name = name;
    newImage.data = dataImage;
    newImage.collection = boolean;
    
    NSError* savingError = nil;
    
    if ([[Utility managedObjectContext] save:&savingError]) {
        return YES;
    } else {
        NSLog(@"Failed to save. Error = %@", savingError);
    }
    
    return result;
}

- (BOOL) checkForImages {
    
    BOOL imagesCheck = NO;
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Image"];
    NSError* requestError = nil;
    
    NSArray* images = [[Utility managedObjectContext] executeFetchRequest:fetchRequest error:&requestError];
    
    if ([images count] > 0) {
        
        
        NSUInteger counter = 1;
        
        for (Images*  image in  images) {
            
            NSLog(@"Image name = %@", image.name);
            
            counter++;
            
        }
        return YES;
        
    } else {
        NSLog(@"Not find image");
        // [self createImage];
        return NO;
    }
    
    return imagesCheck;
}

@end


