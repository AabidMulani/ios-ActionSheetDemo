//
//  ViewController.m
//  ActionSheetDemo
//
//  Created by Magneto on 2/13/14.
//  Copyright (c) 2014 Magneto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIDatePicker *selectDate;

@end

@implementation ViewController
@synthesize selectDate;
- (void)viewDidLoad
{
    [super viewDidLoad];
	NSLog(@"Date Val:%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"date"]);
}
- (IBAction)clickMe:(id)sender {
    
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"hh:mm a"];
    
    NSString *str=[format stringFromDate:selectDate.date];
    NSLog(@"Selected Date:%@",str);
    

    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"date"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:@"Sharing" delegate:self cancelButtonTitle:@"Close" destructiveButtonTitle:nil otherButtonTitles:@"Facebook",@"Twitter",@"Mail", nil];
    [action showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        NSLog(@"Facebook");
    }
    else if (buttonIndex==1){
        NSLog(@"Twitter");
    }
    else if (buttonIndex==2){
        NSLog(@"MAIL");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
