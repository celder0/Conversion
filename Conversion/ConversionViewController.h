//
//  ConversionViewController.h
//  Conversion
//
//  Created by Chris Elder on 1/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConversionViewController : UIViewController{
    UITextField *fromTextBox;
    UITextField *toTextBox;
    UILabel *fromLabel;
    UILabel *toLabel;
    UILabel *directions;
    UITextField *conversionTypeTextBox;
    UIButton *reverseButton;
    UIPickerView *conversionPick;
    bool reverse;
    int conversionType;
    NSArray *arrayConversions;
    
}

@property (nonatomic, retain) IBOutlet UILabel *fromLabel;
@property (nonatomic, retain) IBOutlet UILabel *toLabel;
@property (nonatomic, retain) IBOutlet UILabel *directions;
@property (nonatomic, retain) IBOutlet UITextField *fromTextBox;
@property (nonatomic, retain) IBOutlet UITextField *toTextBox;
@property (nonatomic, retain) IBOutlet UITextField *conversionTypeTextBox;
@property (nonatomic, retain) IBOutlet UIButton *reverseButton;
@property (nonatomic, retain) IBOutlet UIPickerView *conversionPick;
- (IBAction)showConversionType:(id)sender;
- (IBAction)saveConversionType:(id)sender;
- (IBAction)convert:(id)sender;
- (IBAction)reverse:(id)sender;
- (IBAction)backgroundTouchedHideKeyboard:(id)sender;

@end
