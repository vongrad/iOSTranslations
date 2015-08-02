//
//  TranslationItem.h
//  CoreDataApp
//
//  Created by Adam Vongrej on 24/07/15.
//  Copyright (c) 2015 Adam Vongrej. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Translation;

@interface TranslationItem : NSManagedObject

@property (nonatomic, retain) NSString * lang;
@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) Translation *translation;

@end
