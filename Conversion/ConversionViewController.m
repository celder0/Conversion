//
//  ConversionViewController.m
//  Conversion
//
//  Created by Chris Elder on 1/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConversionViewController.h"


@implementation ConversionViewController

@synthesize toLabel, toTextBox, fromLabel,fromTextBox, directions, conversionTypeTextBox, reverseButton, conversionPick;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    reverse = false;
    [reverseButton setTitle:@"<-----" forState:UIControlStateSelected];
    [reverseButton setTitle:@"----->" forState:UIControlStateNormal];
    arrayConversions = [[NSArray alloc] initWithObjects: @"Fahrenheit to Celsius", @"Meters to Feet", @"Kilograms to Pounds", nil];
    conversionType = 0;
    fromLabel.text = @"Fahrenheit";
    toLabel.text = @"Celsius";
    toTextBox.userInteractionEnabled = NO;
    fromTextBox.userInteractionEnabled = YES;
    conversionPick.alpha = 0;
    [conversionTypeTextBox setText:[arrayConversions objectAtIndex:[conversionPick selectedRowInComponent:0]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.toTextBox = nil;
    self.fromTextBox = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (NSInteger) numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger) pickerView: (UIPickerView *)pickerView
        numberOfRowsInComponent:(NSInteger)component
{
    return [arrayConversions count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [arrayConversions objectAtIndex:row];
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *) pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    conversionType = row;
    switch (conversionType) {
        case 0:
            fromLabel.text = @"Fahrenheit";
            toLabel.text = @"Celsius";
            fromTextBox.text = @"32";
            toTextBox.text = @"0.00";
            break;
        case 1:
            fromLabel.text = @"Meters";
            toLabel.text = @"Feet";
            fromTextBox.text = @"1";
            toTextBox.text = @"3.28";
            break;
        case 2:
            fromLabel.text = @"Kilograms";
            toLabel.text = @"Pounds";
            fromTextBox.text = @"1";
            toTextBox.text = @"2.20";
            break;
    }

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return NO;
    }
}

- (void)reverse:(id)sender
{
    if (reverse)
    {
        fromTextBox.userInteractionEnabled = YES;
        toTextBox.userInteractionEnabled = NO;
        reverse = false;
        reverseButton.selected = NO;
    }else
    {
        toTextBox.userInteractionEnabled = YES;
        fromTextBox.userInteractionEnabled = NO;
        reverse = true;
        reverseButton.selected = YES;
    }
}

-(void)sync
{
    if ([conversionPick selectedRowInComponent:0] >= 0)
    {
        [conversionTypeTextBox setText:[arrayConversions objectAtIndex:[conversionPick selectedRowInComponent:0]]];
    }
}

- (IBAction)saveConversionType:(id)sender
{
    [self sync];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 250);
    conversionPick.transform = transform;
    conversionPick.alpha = 0;
    [UIView commitAnimations];}

- (void)convert
{
    if (reverse)
    {
        if (conversionType == 0)
        {
            double celsius = [toTextBox.text doubleValue];
            double fahren = celsius * 1.8 + 32;
        
            [fromTextBox resignFirstResponder];
        
            NSString *convertResult = [[NSString alloc] initWithFormat:@"%.2f", fahren];
            fromTextBox.text = convertResult; 
        }else if (conversionType == 1)
        {
            double feet = [toTextBox. text doubleValue];
            double meters = feet * 0.3048;
            
            [fromTextBox resignFirstResponder];
            
            NSString *convertResult = [[NSString alloc] initWithFormat:@"%.2f", meters];
            fromTextBox.text = convertResult; 
        }else if (conversionType == 2)
        {
            double kilo = [toTextBox. text doubleValue];
            double lb = kilo / 2.2046;
            
            [fromTextBox resignFirstResponder];
            
            NSString *convertResult = [[NSString alloc] initWithFormat:@"%.2f", lb];
            fromTextBox.text = convertResult;         }
    }else
    {
        if (conversionType == 0)
        {
            double fahren = [fromTextBox. text doubleValue];
            double celsius = (fahren - 32)/ 1.8;
    
            [toTextBox resignFirstResponder];
    
            NSString *convertResult = [[NSString alloc] initWithFormat:@"%.2f", celsius];
            toTextBox.text = convertResult;
        }else if (conversionType == 1)
        {
            double meters = [fromTextBox. text doubleValue];
            double feet = meters/0.3048;
            
            [toTextBox resignFirstResponder];
            
            NSString *convertResult = [[NSString alloc] initWithFormat:@"%.2f", feet];
            toTextBox.text = convertResult;        
        }else if (conversionType == 2)
        {  
            double pound = [fromTextBox. text doubleValue];
            double kilo = pound * 2.2;
            
            [toTextBox resignFirstResponder];
            
            NSString *convertResult = [[NSString alloc] initWithFormat:@"%.2f", kilo];
            toTextBox.text = convertResult;     
        }
    }
}

- (IBAction)showConversionType:(id)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 0);
    conversionPick.transform = transform;
    conversionPick.alpha = 1;
    [UIView commitAnimations];
}

- (void)backgroundTouchedHideKeyboard:(id)sender
{
    [fromTextBox resignFirstResponder];
    [toTextBox resignFirstResponder];
    [self sync];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 250);
    conversionPick.transform = transform;
    conversionPick.alpha = 0;
    directions.alpha = 0;
    [UIView commitAnimations];
    [self convert];
}

@end
