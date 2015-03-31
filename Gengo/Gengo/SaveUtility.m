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
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"email" equalTo:u.email];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error && objects.count ==1) {
            PFObject *object = (PFObject *)objects[0];
            object[@"nivel"] = @(u.nivel);
            object[@"xp"] = @(u.xp);
            object[@"items"] = [SaveUtility processUserItems];
            object[@"puzzles"] = [SaveUtility processUserPuzzles];
            
            [object save];
            
        } else if (!error) {
            NSLog(@"Looks Like your user does not exists on our database :-/ ");
        }else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

+(NSMutableArray *)processUserItems{
    User *u = (User *)[User loadUser];
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (Item *object in u.items) {
        PFObject *aux = [PFObject objectWithClassName:@"Item"];
        aux[@"name"] = object.name;
        aux[@"desc"] = object.desc;
        aux[@"image"] = object.image;
        aux[@"price"] = @(object.price);
        [temp addObject:aux];
    }
    
    return temp;
}

+(NSMutableArray *)processUserPuzzles{
    User *u = (User *)[User loadUser];
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (Puzzle *object in u.puzzles) {
        PFObject *aux = [PFObject objectWithClassName:@"Puzzle"];
        aux[@"image1"] = object.image1;
        aux[@"image2"] = object.image2;
        aux[@"image3"] = object.image3;
        aux[@"image4"] = object.image4;
        aux[@"history"] = object.history;
        aux[@"soundLocation"] = object.soundLocation;
        aux[@"piecesUnlocked"] = @(object.piecesUnlocked);
        [temp addObject:aux];
    }
    
    return temp;
}

@end
