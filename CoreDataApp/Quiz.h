//
//  Quiz.h
//  CoreDataApp
//
//  Created by Adam Vongrej on 24/07/15.
//  Copyright (c) 2015 Adam Vongrej. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Translation;

@interface Quiz : NSManagedObject

@property (nonatomic, retain) NSDate * starttime;
@property (nonatomic, retain) NSDate * endtime;
@property (nonatomic, retain) NSSet *question;
@end

@interface Quiz (CoreDataGeneratedAccessors)

- (void)addQuestionObject:(Translation *)value;
- (void)removeQuestionObject:(Translation *)value;
- (void)addQuestion:(NSSet *)values;
- (void)removeQuestion:(NSSet *)values;

@end
