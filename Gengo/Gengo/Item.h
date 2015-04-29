//
//  NSObject+Item.h
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property NSString *name;
@property NSString *desc;
@property NSString *image;
@property NSNumber *price;

-(id)initWithName:(NSString *)name desc:(NSString *)desc image:(NSString *)image andPrice:(NSNumber *)price;

@end
