//
//  ViewController.m
//  Multiply
//
//  Created by Yi-Chin Sun on 1/5/15.
//  Copyright (c) 2015 Yi-Chin Sun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *numberTextField;
@property (strong, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *operatorSegmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSliderChanged:(UISlider *)slider
{
    self.multiplierLabel.text =[NSString stringWithFormat:@"%d",(int)slider.value];
}
- (IBAction)onCalculateButtonPressed:(id)sender
{
    NSInteger inputNumber = self.numberTextField.text.integerValue;
    NSInteger labelNumber = self.multiplierLabel.text.integerValue;
    NSInteger resultValue;

    if (self.operatorSegmentedControl.selectedSegmentIndex == 0)
    {
        resultValue = inputNumber * labelNumber;
    }
    else
    {
        if (labelNumber == 0)
        {
            UIAlertView *tooManyAlert =[[UIAlertView alloc] initWithTitle:@"Error" message:@"Division by 0!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [tooManyAlert show];
        }
        else
        {
            resultValue = inputNumber / labelNumber;
        }
    }

    if (resultValue >= 20)
    {
        self.view.backgroundColor = [UIColor greenColor];
    }
    else
    {
        self.view.backgroundColor = [UIColor whiteColor];
    }

    if (resultValue == 0)
    {
        self.answerLabel.text = @"0";
    }
    else if (resultValue%3 == 0 && resultValue%5 == 0)
    {
        self.answerLabel.text = @"fizzbuzz";
    }
    else if (resultValue%3 == 0)
    {
        self.answerLabel.text = @"fizz";
    }
    else if (resultValue%5 == 0 )
    {
        self.answerLabel.text = @"buzz";
    }
    else
    {
        self.answerLabel.text = [NSString stringWithFormat: @"%ld", (long)resultValue];
    }

    [self.view endEditing:YES];



}

@end
