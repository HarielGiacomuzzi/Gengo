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
        sharedUser.lessonGrade = [object objectForKey:@"lessonGrade"];
        sharedUser.gameScore = [object objectForKey:@"gameScore"];
        sharedUser.puzzles = [object objectForKey:@"puzzles"];
        sharedUser.sexo = 'M';
        sharedUser.money = [((NSNumber *)[object objectForKey:@"money"]) intValue];
        
    } else if (returnedItems.count == 0) {
        // if the user does not exists we'll create it
        NSLog(@"Vou criar o user !!!");
        User *usuario = [[User alloc] init];
        usuario.nome = [user name];
        usuario.email = [user objectForKey:@"email"];
        usuario.nivel = 0;
        usuario.xp = 0;
        usuario.items = [[NSMutableArray alloc] init];
        usuario.puzzles = [[NSMutableArray alloc] init];
        usuario.lessonGrade = [[NSMutableArray alloc] init];
        usuario.gameScore = [[NSMutableArray alloc] init];
        usuario.money = 100;
        NSString *s = [user objectForKey:@"gender"];
        const char *c = [s UTF8String];
        usuario.sexo = c[0];
        
        
        PFObject *newUser = [PFObject objectWithClassName:@"User"];
        newUser[@"nome"] = usuario.nome;
        newUser[@"email"] = usuario.email;
        newUser[@"nivel"] = @(usuario.nivel);
        newUser[@"xp"] = @(usuario.xp);
        newUser[@"items"] = usuario.items;
        newUser[@"money"] = @(usuario.money);
        newUser[@"lessonGrade"] = usuario.lessonGrade;
        newUser[@"gameScore"] = usuario.gameScore;
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

+(NSMutableArray *)processUserLessons:(NSMutableArray *) array{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    for (PFObject *obj in array) {
        NSLog(@"ObjectId : %@",[obj objectForKey:@"objectId"]);
        NSLog(@"Grade : %@",[obj objectForKey:@"grade"]);
        NSLog(@"HighScore : %@",[obj objectForKey:@"highScore"]);
        
        Lesson *aux = [[Lesson alloc] init];
        aux.grade = [obj objectForKey:@"grade"];
        aux.highScore = [((NSNumber *)[obj objectForKey:@"highScore"]) integerValue];
        
       
        
        [temp addObject:aux];
    }
    
    return temp;
}

@end
