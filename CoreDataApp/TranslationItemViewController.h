//
//  PersonDetailViewController.h
//  CoreDataApp
//
//  Created by Adam Vongrej on 19/07/15.
//  Copyright (c) 2015 Adam Vongrej. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabelPicker.h"

@interface TranslationItemViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabelPicker *picker_lang;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollContainer;

- (IBAction)addNewTranslation:(id)sender;


@end
