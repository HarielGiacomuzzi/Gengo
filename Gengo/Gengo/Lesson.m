//
//  NSObject+Lesson.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "Lesson.h"

@implementation Lesson

- (id)init {
    self = [super init];
    if( self ){
        _dictionary = [[CharacterDictionary alloc] init];
        _grade = @0;
        _highScore = @0;
        _lessonNumber = 1;
    }
    return self;
}

- (id)initWithNumber:(NSInteger)number {
    self = [super init];
    if( self ){
        _dictionary = [[CharacterDictionary alloc] initWithLevel:number];
        _grade = @0;
        _highScore = @0;
        _lessonNumber = number;
    }
    return self;
}


@end
