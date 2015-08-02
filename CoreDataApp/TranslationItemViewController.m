//
//  PersonDetailViewController.m
//  CoreDataApp
//
//  Created by Adam Vongrej on 19/07/15.
//  Copyright (c) 2015 Adam Vongrej. All rights reserved.
//

#import "TranslationItemViewController.h"

@interface TranslationItemViewController ()
@property NSMutableArray *availableLang;
@end

@implementation TranslationItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *langCodes = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    self.availableLang = [[NSMutableArray alloc] init];
    
    for (NSString *langCode in langCodes) {
        [self.availableLang addObject:[[NSLocale currentLocale] displayNameForKey:NSLocaleIdentifier value:langCode]];
    }
    
    [self.picker_lang addLabel:@"Language:" forComponent:0 forLongestString:@"Language"];
    self.picker_lang.dataSource = self;
    self.picker_lang.delegate = self;
    
    [self updateContentSizeForScrollView:self.scrollContainer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateContentSizeForScrollView:(UIScrollView *)scrollView{
    UIView *lastItem = [[scrollView subviews] lastObject];
    NSInteger contentSize = lastItem.frame.origin.y + lastItem.frame.size.height;
    scrollView.contentSize = CGSizeMake(self.scrollContainer.frame.size.width, contentSize);
}

- (void)renderText:(NSString *)text forViewPicker:(UIPickerView *)picker{
    //UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(135, 93, 80, 30)]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.availableLang count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *label = (UILabel*)view;
    
    if(view == nil){
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        label.backgroundColor = [UIColor clearColor];
        label.text = [self.availableLang objectAtIndex:row];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blueColor];
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
    }
    return label;
}
 

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.availableLang objectAtIndex:row];
}

- (IBAction)addNewTranslation:(id)sender {
    
    UIView *lastView = [[self.scrollContainer subviews] lastObject];
    
    NSLog(@"LastView origin y: %f, LastView height: %f", lastView.frame.origin.y, lastView.frame.size.height);
    
    UIView *translationWrapper = [[UIView alloc]initWithFrame:CGRectMake(0, lastView.frame.origin.y + lastView.frame.size.height, self.scrollContainer.frame.size.width, 200)];
    
    translationWrapper.backgroundColor = [UIColor orangeColor];
    
    /*
    [translationWrapper addConstraint:[NSLayoutConstraint constraintWithItem:translationWrapper attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.scrollContainer attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
    [translationWrapper addConstraint:[NSLayoutConstraint constraintWithItem:translationWrapper attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollContainer attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
     */
    
    [translationWrapper setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.scrollContainer addSubview:translationWrapper];
    [self.scrollContainer addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollContainer attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:translationWrapper attribute:NSLayoutAttributeTop multiplier:1 constant:16]];
    [self.scrollContainer updateConstraints];
    [self updateContentSizeForScrollView:self.scrollContainer];
    /*
    UILabelPicker *pickerLang = [[UILabelPicker alloc] initWithFrame:CGRectMake(0, 0, self.scrollContainer.frame.size.width, 162)];
    UILabel *labelHelp = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.scrollContainer.frame.size.width, 20)];
    UITextField *fieldWord = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.scrollContainer.frame.size.width, 30)];
     */
    
}
@end
