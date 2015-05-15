//
//  VCCreateAccount.h
//  Gengo
//
//  Created by Hariel Giacomuzzi on 5/14/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "User.h"

@interface VCCreateAccount : UIViewController{
    NSString *nome;
    NSString *password;
    NSString *email;
    NSString *gender;
    NSString *ConfirmPassword;
    
}


@end
