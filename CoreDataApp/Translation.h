//
//  Translation.h
//  CoreDataApp
//
//  Created by Adam Vongrej on 24/07/15.
//  Copyright (c) 2015 Adam Vongrej. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Quiz;

@interface Translation : NSManagedObject

@property (nonatomic, retain) NSDate * timecreated;
@property (nonatomic, retain) NSDate * timeupdated;
@property (nonatomic, retain) NSSet *quiz;
@end

@interface Translation (CoreDataGeneratedAccessors)

- (void)addQuizObject:(Quiz *)value;
- (void)removeQuizObject:(Quiz *)value;
- (void)addQuiz:(NSSet *)values;
- (void)removeQuiz:(NSSet *)values;

@end
