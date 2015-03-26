//
//  ViewControllerTutorial.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/26/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "ViewControllerTutorial.h"

@interface ViewControllerTutorial ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *lessonControl;
@property (weak, nonatomic) IBOutlet UIImageView *lessonImageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewControllerTutorial

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PerformActionLeft:)];
    left.direction = UISwipeGestureRecognizerDirectionLeft ;
    [self.scrollView addGestureRecognizer:left];
    
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PerformActionRight:)];
    right.direction = UISwipeGestureRecognizerDirectionRight ;
    [self.scrollView addGestureRecognizer:right];
    
    self.lessonImageView.image = [UIImage imageNamed:@"a.png"];
}

-(void)PerformActionLeft:(UISwipeGestureRecognizer *)sender {
    if (self.pageControl.currentPage > 2 && self.pageControl.currentPage > 0){
        self.pageControl.currentPage--;
    }
}

-(void)PerformActionRight:(UISwipeGestureRecognizer *)sender {
    if (self.pageControl.currentPage < 2){
     self.pageControl.currentPage++;
    }
}

-(void)viewWillAppear:(BOOL)animated{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage++;
}

@end
