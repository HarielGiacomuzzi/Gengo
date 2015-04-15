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
NSArray *returnedItems;

+(id)loadUser{
        return sharedUser;
}

+(BOOL)lodUserWithEmail: (NSString*)email andUser: (id<FBGraphUser>)user{
    //creates the query

    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"email" equalTo:email];
    
    //loads the results into an array
    returnedItems = [query findObjects];
    if (returnedItems.count == 1) {
        PFObject *object = returnedItems[0];
        sharedUser = [[User alloc] init];
        sharedUser.nome = [object objectForKey:@"nome"];
        sharedUser.email = [object objectForKey:@"email"];
        sharedUser.nivel = [((NSNumber *)[object objectForKey:@"nivel"]) intValue];
        sharedUser.xp = [((NSNumber *)[object objectForKey:@"xp"]) intValue];
        sharedUser.items = [object objectForKey:@"items"];
        
        NSMutableArray *grades = [object objectForKey:@"lessonGrade"];
        NSMutableArray *scores = [object objectForKey:@"gameScore"];
        sharedUser.lessonArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < grades.count; i++) {
            Lesson *lesson = [[Lesson alloc] initWithNumber:i + 1];
            lesson.grade = grades[i];
            lesson.highScore = scores[i];
            [sharedUser.lessonArray addObject:lesson];
        }
        
        sharedUser.puzzles = [object objectForKey:@"puzzles"];
        sharedUser.sexo = [((NSNumber *)[object objectForKey:@"sexo"]) intValue];
        sharedUser.money = [((NSNumber *)[object objectForKey:@"money"]) intValue];
        
    } else if (returnedItems.count == 0) {
        // if the user does not exists we'll create it
        NSLog(@"Vou criar o user !!!");
        User *usuario = [[User alloc] init];
        usuario.nome = [user name];
        usuario.email = [user objectForKey:@"email"];
        usuario.nivel = 0;
        usuario.xp = 0;
        usuario.items = [[NSMutableArray alloc] initWithObjects:@0, nil];
        usuario.puzzles = [[NSMutableArray alloc] init];
        usuario.lessonArray = [[NSMutableArray alloc] initWithObjects:[[Lesson alloc] initWithNumber:1], nil];
        usuario.money = 100;
        NSString *s = [user objectForKey:@"gender"];
        if ([s isEqualToString:@"male"]) {
            usuario.sexo = 1;
        }else{
            usuario.sexo = 0;
        }
        
        sharedUser = usuario;
        
        
        PFObject *newUser = [PFObject objectWithClassName:@"User"];
        newUser[@"nome"] = usuario.nome;
        newUser[@"email"] = usuario.email;
        newUser[@"nivel"] = @(usuario.nivel);
        newUser[@"xp"] = @(usuario.xp);
        newUser[@"items"] = usuario.items;
        newUser[@"money"] = @(usuario.money);
        newUser[@"lessonGrade"] = [[NSMutableArray alloc] initWithObjects:@0, nil];
        newUser[@"gameScore"] = [[NSMutableArray alloc] initWithObjects:@0, nil];
        newUser[@"puzzles"] = usuario.puzzles;
        newUser[@"sexo"] = @(usuario.sexo);
        
        
        if ([newUser save]){
            NSLog(@"User Saved");
        }else{
            NSLog(@"Deu Ruin");
        }
        
    }
    
    if (sharedUser != nil) {
        return YES;
    }
    return NO;
}

@end
