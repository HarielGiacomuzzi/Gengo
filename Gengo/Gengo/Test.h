//
//  Test.h
//  Gengo
//
//  Created by Daniel Amarante on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject

@property (nonatomic) NSDictionary *characters;
@property (nonatomic) NSMutableArray *keys;
@property (nonatomic) NSInteger currentQuestion;
@property (nonatomic) NSInteger right;
@property (nonatomic) NSInteger wrong;

-(id)init;

-(NSString *)getQuestion;

-(NSArray *)getAnswsers;

@end
