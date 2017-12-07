//
//  TableViewController1.m
//  power electronic calculater
//
//  Created by 胡庆渊 on 2017/12/5.
//  Copyright © 2017年 Univercity of leeds. All rights reserved.
//

#import "TableViewController1.h"
#import "ViewController1.h"
#import "ViewController1_1.h"
//The 13th line was referenced from http://www.jianshu.com/p/4486810b43c1 and https://developer.apple.com/documentation/uikit/uistoryboard/1616216-storyboardwithname. This line will allow users use the name of View Controller to connect with table view controller.
#define viewOnSb(identifer)  [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:identifer]

@interface TableViewController1 ()

@end

@implementation TableViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"DC-DC Converter"; //the title of the table view controller
    
    //The 27th line was referenced from https://developer.apple.com/documentation/uikit/uitableview/1614888-registerclass.This is a process to register the table view.The reuse identifier for the cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TableViewController1"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1; //only 1 section in the table view
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2; //2 situations of DC-DC converter and set 2 lines.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewController1" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Step - down "; //the name of the first line
        
    }else{
        cell.textLabel.text = @"Step - up"; //the name of the second line
        
    }
    //The 67th line was referenced from https://developer.apple.com/search/?q=cell:accessorytype.
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator; //type of each line in the table view
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        ViewController1 * vc1 = viewOnSb(@"ViewController1");//use the define to name the viewcontroller
        
        //The 79th and 82th line was referenced from https://developer.apple.com/documentation/uikit/uinavigationcontroller/1621887-pushviewcontroller
        
        [self.navigationController pushViewController:vc1 animated:YES];// link the firt line to the view controller1
    }else{
        ViewController1_1 * vc1_1 = viewOnSb(@"ViewController1_1");
        [self.navigationController pushViewController:vc1_1 animated:YES];// link the second line to the view controller1
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;// set the high of each line
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
