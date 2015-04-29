//
//  NSObject+Item.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/20/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "Item.h"

@implementation Item

-(id)initWithName:(NSString *)name desc:(NSString *)desc image:(NSString *)image andPrice:(NSNumber *)price {
    self = [super init];
    if( self ){
        _name = name;
        _desc = desc;
        _image = image;
        _price = price;
    }
    return self;
}

@end
