//
//  ViewControllerTutorial.m
//  Gengo
//
//  Created by Hariel Giacomuzzi on 3/26/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "ViewControllerTutorial.h"

@interface ViewControllerTutorial ()
{
    ViewTutorial1 *firstViewUIView;
    UIView *secondViewUIView;
    UIView *thirdViewUIView;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *lessonControl;
//@property (weak, nonatomic) IBOutlet UIImageView *lessonImageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation ViewControllerTutorial

- (void)viewDidLoad {
    [super viewDidLoad];

//    //adding swipe gesture to the view.
//    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PerformAction:)];
//    left.direction = UISwipeGestureRecognizerDirectionLeft ;
//    [self.view addGestureRecognizer:left];
//    
//    //adding swipe gesture to the view.
//    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PerformAction:)];
//    right.direction = UISwipeGestureRecognizerDirectionRight ;
//    [self.view addGestureRecognizer:right];
//    
//    //Setting the image touch action.
//    UITapGestureRecognizer *imageTouched = [[UITapGestureRecognizer alloc]
//                                             initWithTarget:self action:@selector(ClickEventOnImage:)];
//    [imageTouched setNumberOfTouchesRequired:1];
//    [imageTouched setDelegate:self];
//     self.lessonImageView.userInteractionEnabled = YES;
//    [self.lessonImageView addGestureRecognizer:imageTouched];
//    
//    self.lessonImageView.image = [UIImage imageNamed:@"a.png"];
    
    
    firstViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View1" owner:nil options:nil] firstObject];
    firstViewUIView.imageLetter.image = [UIImage imageNamed:@"a.png"];
    [self.scrollView addSubview:firstViewUIView];

    
    secondViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View2" owner:nil options:nil] firstObject];
    [self.scrollView addSubview:secondViewUIView];

    thirdViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View3" owner:nil options:nil] firstObject];
    [self.scrollView addSubview:secondViewUIView];
}


-(void)viewWillAppear:(BOOL)animated
{
//    UIView *firstViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View1" owner:nil options:nil] firstObject];
//    
//    firstViewUIView.frame = CGRectMake(0, 0, firstViewUIView.frame.size.width, firstViewUIView.frame.size.height);
//    
//    [self.scrollView addSubview:firstViewUIView];
//    
//    
//    UIView *secondViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View2" owner:nil options:nil] firstObject];
//    
//    secondViewUIView.frame = CGRectMake(self.scrollView.frame.size.width, 0, secondViewUIView.frame.size.width, secondViewUIView.frame.size.height);
//    
//    [self.scrollView addSubview:secondViewUIView];
    
    
}

-(void)viewDidLayoutSubviews
{
    
    firstViewUIView.frame = CGRectMake(0, 0, firstViewUIView.frame.size.width, firstViewUIView.frame.size.height);
    
    secondViewUIView.frame = CGRectMake(self.scrollView.frame.size.width, 0, secondViewUIView.frame.size.width, secondViewUIView.frame.size.height);
    
    thirdViewUIView.frame = CGRectMake(self.scrollView.frame.size.width*2, 0, thirdViewUIView.frame.size.width, thirdViewUIView.frame.size.height);
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height)];
}

-(void) ClickEventOnImage:(id) sender
{
        NSString *audioName = [[NSString alloc] init];
    
        switch (self.lessonControl.selectedSegmentIndex) {
            case 1:
                audioName = @"simple-drum-beat";
                break;
            
            case 2:
                audioName = @"simple-drum-beat";
                break;
            
            case 3:
                audioName = @"simple-drum-beat";
                break;
            
            case 4:
                audioName = @"simple-drum-beat";
                break;
            
            case 5:
                audioName = @"simple-drum-beat";
                break;
            
            default:
                break;
        }
    
    
        NSError *error;
        
        NSBundle* bundle = [NSBundle mainBundle];
        
        NSURL *url = [NSURL URLWithString:[bundle pathForResource:audioName ofType:@"wav"]];
    
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];

        self.audioPlayer.numberOfLoops = 0;
    
        if (self.audioPlayer != nil)
        {
            [self.audioPlayer play];
        }
}

- (IBAction)letterChosed:(id)sender {
//    switch (self.lessonControl.selectedSegmentIndex) {
//        case 0:
//            self.lessonImageView.image = [UIImage imageNamed:@"a.png"];
//            break;
//            
//        case 1:
//            self.lessonImageView.image = [UIImage imageNamed:@"i.png"];
//            break;
//            
//        case 2:
//            self.lessonImageView.image = [UIImage imageNamed:@"u.png"];
//            break;
//            
//        case 3:
//            self.lessonImageView.image = [UIImage imageNamed:@"e.png"];
//            break;
//            
//        case 4:
//            self.lessonImageView.image = [UIImage imageNamed:@"o.png"];
//            break;
//            
//        default:
//            break;
//    }
    
}



//-(void)PerformAction:(UISwipeGestureRecognizer *)sender {
//    if(sender.direction == UISwipeGestureRecognizerDirectionRight && self.pageControl.currentPage > 2 && self.pageControl.currentPage > 0) {
//        self.pageControl.currentPage--;
//    }
//    
//    if(sender.direction == UISwipeGestureRecognizerDirectionLeft && self.pageControl.currentPage < 2) {
//        self.pageControl.currentPage++;
//    }
//}
//- (IBAction)pageChenged:(UIPageControl *)sender {
//    NSLog(@"Page Changed");
//}

//-(void)viewWillAppear:(BOOL)animated{
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

@end
