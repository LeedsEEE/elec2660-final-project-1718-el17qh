//
//  ViewController1.m
//  power electronic calculater
//
//  Created by 胡庆渊 on 2017/12/5.
//  Copyright © 2017年 Univercity of leeds. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputvoltage;
@property (weak, nonatomic) IBOutlet UITextField *outputvoltage;
@property (weak, nonatomic) IBOutlet UITextField *resistance;

@property (weak, nonatomic) IBOutlet UILabel *outputcurrent;
@property (weak, nonatomic) IBOutlet UILabel *dutyratio;
@property (weak, nonatomic) IBOutlet UILabel *inputcurrent;

- (IBAction)calculate:(id)sender;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)calculate:(id)sender{ //store the calculation in the view controller
    //temporary store the input values form text field
    float value1 = [self.inputvoltage.text floatValue];
    float value2 = [self.outputvoltage.text floatValue];
    float value3 = [self.resistance.text floatValue];
    
    //From 54th line to 68th line was referenced from https://developer.apple.com/search/?q=UIalert.
    if (value1<value2) {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"ERROR!"
                                              message: @"The outputvoltage must less than inputvoltage"
                                              preferredStyle:UIAlertControllerStyleAlert]; //set alert information
        
        UIAlertAction *okayAction = [UIAlertAction
                                     actionWithTitle:@"confirm"
                                     style:UIAlertActionStyleDefault
                                     handler:^(UIAlertAction *action) {
                                         NSLog(@"confirm");
                                     }]; //set alert action
        [alertController addAction:okayAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    //calculations
    float resul1 = value2 / value3;
    float resul2 = value2 / value1;
    float resul3 = resul1 * resul2;
    
    //output the results with labels
    self.outputcurrent.text = [NSString stringWithFormat:@"%.2f", resul1];
    self.dutyratio.text = [NSString stringWithFormat:@"%.2f", resul2];
    self.inputcurrent.text = [NSString stringWithFormat:@"%.2f", resul3];
    
}


//let uesrs press the background to return the keyboard
- (IBAction)background:(id)sender {
    
    if([self.inputvoltage isFirstResponder]){
        [self.inputvoltage resignFirstResponder];
    }
    if([self.outputvoltage isFirstResponder]){
        [self.outputvoltage resignFirstResponder];
    }
    if([self.resistance isFirstResponder]){
        [self.resistance resignFirstResponder];
    }
}
@end
