//
//  TutorialDrawView.h
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/27/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialDrawView : UIView{
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;
}

@property (weak, nonatomic) IBOutlet UIImageView *letter;
@property UIImage *draw;

@end
