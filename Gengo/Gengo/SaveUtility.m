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
    NSArray *temp;
    User *u = (User *)[User loadUser];
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"email" equalTo:u.email];
    temp = [query findObjects];
    if (temp.count ==1) {
            PFObject *object = (PFObject *)temp[0];
            object[@"nivel"] = @(u.nivel);
            object[@"xp"] = @(u.xp);
            object[@"items"] = u.items;
            //object[@"puzzles"] = [SaveUtility processUserPuzzles];
            NSMutableArray *grades = [[NSMutableArray alloc] init];
            NSMutableArray *scores = [[NSMutableArray alloc] init];
            for (Lesson *lesson in u.lessonArray) {
                [grades addObject:lesson.grade];
                [scores addObject:lesson.highScore];
            }
            object[@"lessonGrade"] = grades;
            object[@"gameScore"] = scores;
        
            object[@"money"] = @(u.money);

            [object saveInBackground];
            
    }else{
        NSLog(@"The user Can't be found");
    }
    
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
