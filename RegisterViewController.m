//
//  RegisterViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/7/2.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "RegisterViewController.h"
#import "MyControl.h"
@interface RegisterViewController ()
- (IBAction)qqRegister:(id)sender;
- (IBAction)sinaRegister:(id)sender;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.navigationItem.title=@"注册";
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }


-(void)backClick:(UIButton*)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)qqRegister:(id)sender {
}

- (IBAction)sinaRegister:(id)sender {
}
@end
