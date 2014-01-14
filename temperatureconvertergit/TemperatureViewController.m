//
//  TemperatureViewController.m
//  temperatureconvertergit
//
//  Created by Gaurav Makhija on 1/13/14.
//  Copyright (c) 2014 Maps. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *celcius;
@property (weak, nonatomic) IBOutlet UITextField *fahrenheit;
- (IBAction)onTap:(id)sender;
- (IBAction)onConversion:(UIButton *)sender;
- (void) convertToF;
- (void) convertToC;
- (void) paintBackground;

@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    if(self.fahrenheit.isEditing){
        [self.fahrenheit setHighlighted:YES];
        [self.celcius setHighlighted:NO];
    }else if(self.celcius.isEditing){
        [self.celcius setHighlighted:YES];
        [self.fahrenheit setHighlighted:NO];
    }
    [self.view endEditing:YES];
}

- (IBAction)onConversion:(UIButton *)sender {
    
    if (self.celcius.isEditing){
        [self convertToF];
    }else if (self.fahrenheit.isEditing){
        [self convertToC];
    }else if (self.fahrenheit.isHighlighted){
        [self convertToC];
    }else if (self.celcius.isHighlighted){
        [self convertToF];
    }
    [self paintBackground];
    return;
}

- (void) convertToC{
    self.celcius.text = [NSString stringWithFormat:@"%0.2f",(5*[self.fahrenheit.text floatValue]-160)/9];
    return;
}

- (void) convertToF{
    self.fahrenheit.text = [NSString stringWithFormat:@"%0.2f",1.8*[self.celcius.text floatValue] + 32];
    return;
}

- (void) paintBackground{
    float c = [self.celcius.text floatValue];
    if(c>40){
        self.view.backgroundColor = [UIColor redColor];
    }else if (c<=40 && c>25){
        self.view.backgroundColor = [UIColor orangeColor];
    }else if (c<=25 && c>15){
        self.view.backgroundColor = [UIColor greenColor];
    }else if (c<=15 && c>0){
        self.view.backgroundColor = [UIColor blueColor];
    }else if (c<=0){
        self.view.backgroundColor = [UIColor grayColor];
    }
    
}

@end
