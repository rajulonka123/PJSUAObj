//
//  ipjsuaViewController.m
//  ipjsua
/*
 * Copyright (C) 2013-2014 Teluu Inc. (http://www.teluu.com)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
#import "ipjsuaViewController.h"
#import "wrapper.h"
#import "OutgoingViewController.h"
#import "IncomingViewController.h"

@interface ipjsuaViewController ()
{
    CPPWrapper *cppwrapper;
}

@end

@implementation ipjsuaViewController

@synthesize textLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    //Create Lib
    cppwrapper = [[CPPWrapper alloc] init];
//    [cppwrapper createLibWrapper];
//    [cppwrapper incoming_call_wrapper:NULL];

    //Listen incoming call via function pointer
//    cppwrapper.incomingCallInfoWrapper(incoming_call_swift);
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(outboundCall:)
                                                     name:@"outboundCalling" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(inboundCall:)
                                                     name:@"inboundCalling" object:nil];
    
}

- (void)outboundCall:(NSNotification *)note {
    NSLog(@"outboundCall Notification ");
    OutgoingViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier: @"outgoingCallVC"];
    UINavigationController *navBar = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:navBar animated:YES completion:nil];
}

- (void)inboundCall:(NSNotification *)note {
    NSLog(@"inboundCall Notification ");
    IncomingViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier: @"incomingCallVC"];
    UINavigationController *navBar = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:navBar animated:YES completion:nil];
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

      [self.view endEditing:YES];

}

- (IBAction)logoutAction:(id)sender {
    
}

- (IBAction)loginAction:(id)sender {
//    CPPWrapper *cppwrapper = [[CPPWrapper alloc] init];
    [cppwrapper createAccountWrapper:_sipUsernameTField.text :_sipPasswordTField.text :_sipIpTField.text :_sipPortTField.text];
    
    //Wait until register/unregister
    sleep(2);
    if ([cppwrapper registerStateInfoWrapper]){
        _statusLabel.text = @"Sip Status: REGISTERED";
    } else {
       _statusLabel.text = @"Sip Status: NOT REGISTERED";
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)callAction:(id)sender {
    
//    CPPWrapper *cppwrapper = [[CPPWrapper alloc] init];

    [cppwrapper outgoingCallWrapper:_sipDestinationUriTField.text];
    [cppwrapper call_listener_wrapper:nil];
    
}
- (IBAction)callEndAction:(id)sender {
    [cppwrapper hangupCallWrapper];
}

- (IBAction)callAnswerAction:(id)sender {
    [cppwrapper answerCallWrapper];
}

@end
