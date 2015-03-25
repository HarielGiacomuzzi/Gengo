//
//  NSObject+SaveUtility.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "SaveUtility.h"

@implementation SaveUtility

+(void)SyncUser{
    User *u = (User *)[User loadUser];
    //__block BOOL saved = NO;
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"email" equalTo:u.email];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error && objects.count ==1) {
            PFObject *object = (PFObject *)objects[0];
            object[@"nivel"] = @(u.nivel);
            object[@"xp"] = @(u.xp);
            object[@"items"] = u.items;
            object[@"licoes"] = u.licoes;
            object[@"puzzles"] = u.puzzles;
            
            [object saveInBackground];
      //      saved = [object save];
            
        } else if (!error) {
            NSLog(@"Looks Like your user does not exists on our database :-/ ");
        }else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    //return saved;
}


@end
