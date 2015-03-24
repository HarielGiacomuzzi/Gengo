//
//  NSObject+User.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "User.h"

@implementation User


+(id)loadUser{
        static User *sharedUser = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedUser = [[self alloc] init];
        });
        return sharedUser;
}

@end
