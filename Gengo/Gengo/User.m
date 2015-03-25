//
//  NSObject+User.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "User.h"

@implementation User

static User *sharedUser = nil;

+(id)loadUser{
        return sharedUser;
}

+(BOOL)lodUserWithEmail: (NSString*)email andUser: (id<FBGraphUser>)user{
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"email" equalTo:email];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error && objects.count >=1) {
            PFObject *object = objects[0];
            sharedUser = [[User alloc] init];
            sharedUser.nome = [object objectForKey:@"nome"];
            sharedUser.email = [object objectForKey:@"email"];
            
        } else if (!error) {
            // if the user does not exists we'll create it
            NSLog(@"Vou criar o user !!!");
            User *usuario = [[User alloc] init];
            usuario.nome = [user name];
            usuario.email = [user objectForKey:@"email"];
            usuario.nivel = 0;
            usuario.xp = 0;
            
            PFObject *newUser = [PFObject objectWithClassName:@"User"];
            newUser[@"nome"] = usuario.nome;
            newUser[@"email"] = usuario.email;
            newUser[@"nivel"] = @(usuario.nivel);
            newUser[@"xp"] = @(usuario.xp);
            newUser[@"items"] = usuario.items;
            newUser[@"licoes"] = usuario.licoes;
            newUser[@"puzzles"] = usuario.puzzles;
            newUser[@"sexo"] = @(usuario.sexo);
            
            
            if ([newUser save]){
                NSLog(@"User Saved");
            }else{
                NSLog(@"Deu Ruin");
            }
            
            //newUser[@"nivel"] = usuario.nivel;
            /*
            [newUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"User Saved");
                } else {
                    NSLog(@"Deu Ruin");
                }
            }];
             */
            
            
        }else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    if (sharedUser != nil) {
        return YES;
    }
    return NO;
}

@end
