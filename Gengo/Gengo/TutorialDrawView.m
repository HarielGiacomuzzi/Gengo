//
//  TutorialDrawView.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/27/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "TutorialDrawView.h"

@implementation TutorialDrawView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.viewForBaselineLayout];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.viewForBaselineLayout];
    
    UIGraphicsBeginImageContext(self.viewForBaselineLayout.frame.size);
    [self.letter.image drawInRect:CGRectMake(0, 0, self.viewForBaselineLayout.frame.size.width, self.viewForBaselineLayout.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.letter.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.letter setAlpha:opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.viewForBaselineLayout.frame.size);
        [self.letter.image drawInRect:CGRectMake(0, 0, self.viewForBaselineLayout.frame.size.width, self.viewForBaselineLayout.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.letter.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self.letter.frame.size);
    [self.letter.image drawInRect:CGRectMake(0, 0, self.viewForBaselineLayout.frame.size.width, self.viewForBaselineLayout.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.letter.image drawInRect:CGRectMake(0, 0, self.viewForBaselineLayout.frame.size.width, self.viewForBaselineLayout.frame.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
    
    [self.draw drawInRect:CGRectMake(0, 0, self.viewForBaselineLayout.frame.size.width, self.viewForBaselineLayout.frame.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
    //self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
    //self.mainImage.image = nil;
    UIGraphicsEndImageContext();
}



@end
