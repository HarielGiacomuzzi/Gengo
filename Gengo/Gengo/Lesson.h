//
//  NSObject+Lesson.h
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CharacterDictionary.h"

@interface Lesson : NSObject

@property (nonatomic) NSNumber *grade;
@property (nonatomic) NSNumber *highScore;
@property(nonatomic) NSInteger lessonNumber;
@property (nonatomic) CharacterDictionary *dictionary;

-(id)init;
- (id)initWithNumber:(NSInteger)number;


@end
