//
//  UILabelPicker.h
//  CoreDataApp
//
//  Created by Adam Vongrej on 25/07/15.
//  Copyright (c) 2015 Adam Vongrej. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabelPicker : UIPickerView
{
    NSMutableDictionary *labels;
}

/** Adds the label for the given component. */
-(void)addLabel:(NSString *)labeltext forComponent:(NSUInteger)component forLongestString:(NSString *)longestString;
@end
