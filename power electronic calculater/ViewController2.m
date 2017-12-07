//
//  ViewController2.m
//  power electronic calculater
//
//  Created by 胡庆渊 on 2017/12/5.
//  Copyright © 2017年 Univercity of leeds. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UITextField *inputvoltage;
@property (weak, nonatomic) IBOutlet UITextField *activepower;
@property (weak, nonatomic) IBOutlet UITextField *powerfactor;
@property (weak, nonatomic) IBOutlet UILabel *apparentpower;
@property (weak, nonatomic) IBOutlet UILabel *current;
- (IBAction)calculate:(id)sender;


@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"AC power";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(bool)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)calculate:(id)sender {//store the calculation in the view controller
    //temporary store the input values form text field
    float value1 = [self.inputvoltage.text floatValue];
    float value2 = [self.activepower.text floatValue];
    float value3 = [self.powerfactor.text floatValue];
    
    //calculations
    float resul1 = value2 / value3;
    float resul2 = resul1 / value1;
    
    //output the results with labels
    self.apparentpower.text = [NSString stringWithFormat:@"%.2f", resul1];
    self.current.text = [NSString stringWithFormat:@"%.2f", resul2];
}

//let uesrs press the background to return the keyboard
- (IBAction)background:(id)sender {
    if([self.inputvoltage isFirstResponder]){
    [self.inputvoltage resignFirstResponder];
}
    if([self.activepower isFirstResponder]){
        [self.activepower resignFirstResponder];
    }
    if([self.powerfactor isFirstResponder]){
        [self.powerfactor resignFirstResponder];
    }
}
/*
  #pragma mark - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  }
  */
@end
