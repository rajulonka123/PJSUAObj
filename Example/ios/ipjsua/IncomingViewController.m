//
//  IncomingViewController.m
//  ipjsua
//
//  Created by LinkedPhone on 03/04/23.
//  Copyright © 2023 Teluu. All rights reserved.
//

#import "IncomingViewController.h"
#import "wrapper.h"
@interface IncomingViewController ()
{
    CPPWrapper *cppwrapper;
}
@end

@implementation IncomingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    cppwrapper = [[CPPWrapper alloc]init];
}

- (IBAction)answerAction:(id)sender {
    [cppwrapper answerCallWrapper];
    
}
- (IBAction)ansAction:(id)sender {
    NSLog(@"ansAction clicked");
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
