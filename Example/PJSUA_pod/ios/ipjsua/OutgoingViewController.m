//
//  OutgoingViewController.m
//  ipjsua
//
//  Created by LinkedPhone on 03/04/23.
//  Copyright © 2023 Teluu. All rights reserved.
//

#import "OutgoingViewController.h"
#import "wrapper.h"
@interface OutgoingViewController ()

@end

@implementation OutgoingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   

    
    
}


- (IBAction)callEndAction:(id)sender {
    
//    CPPWrapper().hangupCall()
    
    CPPWrapper *cppwrapper = [[CPPWrapper alloc]init];
    [cppwrapper hangupCallWrapper];
    
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
