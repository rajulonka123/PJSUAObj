//
//  OutgoingViewController.h
//  ipjsua
//
//  Created by LinkedPhone on 03/04/23.
//  Copyright © 2023 Teluu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OutgoingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *outgoingcalltitle;
@property (strong, nonatomic) NSString *callerID;

@end

NS_ASSUME_NONNULL_END
