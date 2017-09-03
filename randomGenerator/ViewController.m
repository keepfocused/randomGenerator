//
//  ViewController.m
//  randomGenerator
//
//  Created by Admin on 28.08.17.
//  Copyright © 2017 Galiev Danil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *minTextField;
@property (weak, nonatomic) IBOutlet UITextField *maxTextField;
@property (weak, nonatomic) IBOutlet UIButton *Button;

@end

@implementation ViewController
- (IBAction)actionButton:(UIButton *)sender
{
    NSString* firstString = self.minTextField.text;
    NSString* secondString = self.maxTextField.text;

    NSInteger first = [firstString integerValue];
    NSInteger second = [secondString integerValue];

    NSInteger randomValue;



    if (first > second && first != 0) {
        randomValue = arc4random()%(first) + second;
    }
    else if (second > first && second != 0)
    {
        randomValue = arc4random()%(second) + first;
    }


    self.resultLabel.text = [NSString stringWithFormat:@"Random number = %ld", (long)randomValue ];

}

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(IBAction)backGroundTap:(id)sender {
    [self.minTextField resignFirstResponder];
    [self.maxTextField resignFirstResponder];
}




- (void)viewDidAppear:(BOOL)animated {

    self.textLabel.text = @"Введите два числа)))))";
    self.textLabel.textColor = [UIColor greenColor];

    self.minLabel.text = @"min";
    self.maxLabel.text = @"max";

    self.Button.titleLabel.text = @"Press me";

    UITapGestureRecognizer *tapBackground = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backGroundTap:)]; [self.view addGestureRecognizer:tapBackground];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
