//
//  ViewController3_3.m
//  power electronic calculater
//
//  Created by 胡庆渊 on 2017/12/5.
//  Copyright © 2017年 Univercity of leeds. All rights reserved.
//

#import "ViewController3_3.h"

@interface ViewController3_3 ()
@property (weak, nonatomic) IBOutlet UITextField *angle;
@property (weak, nonatomic) IBOutlet UITextField *supplyvoltage;
@property (weak, nonatomic) IBOutlet UITextField *resistance;
@property (weak, nonatomic) IBOutlet UILabel *outputcurrent;
@property (weak, nonatomic) IBOutlet UILabel *outputvoltage;
- (IBAction)calculate:(id)sender;

@end

@implementation ViewController3_3

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

//let uesrs press the background to return the keyboard
- (IBAction)background:(id)sender {
    if([self.angle isFirstResponder]){
        [self.angle resignFirstResponder];
    }
    if([self.supplyvoltage isFirstResponder]){
        [self.supplyvoltage resignFirstResponder];
    }
    if([self.resistance isFirstResponder]){
        [self.resistance resignFirstResponder];
    }
}
- (IBAction)calculate:(id)sender {//store the calculation in the view controller
    //temporary store the input values form text field
    float value1 = [self.angle.text floatValue];
    float value2 = [self.supplyvoltage.text floatValue];
    float value3 = [self.resistance.text floatValue];
    
    //calculations
    float resul3 = (value1/180);
    float resul2 = value2 * 0.45 * (1+cos(resul3*3.14));
    float resul1 = resul2/value3;
    
    //output the results with labels
    self.outputcurrent.text = [NSString stringWithFormat:@"%.2f", resul1];
    self.outputvoltage.text = [NSString stringWithFormat:@"%.2f", resul2];
}
@end
