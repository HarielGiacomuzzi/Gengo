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
    TutorialDrawView *secondViewUIView;
    xibAnimation *thirdViewUIView;
    NSArray *lessonData;
    
    NSMutableArray *animation1;
    NSMutableArray *animation2;
    NSMutableArray *animation3;
    NSMutableArray *animation4;
    NSMutableArray *animation5;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *lessonControl;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation ViewControllerTutorial

- (IBAction)backBTN:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //creating arrays
    animation1 = [[NSMutableArray alloc] init];
    animation2 = [[NSMutableArray alloc] init];
    animation3 = [[NSMutableArray alloc] init];
    animation4 = [[NSMutableArray alloc] init];
    animation5 = [[NSMutableArray alloc] init];
    
    NSMutableString* lessonName = [NSMutableString stringWithFormat:@"Lesson%ld", (long)self.lesson.lessonNumber];
    lessonData = (NSArray *)[self.lesson.dataPlistDictionary objectForKey:lessonName];
    
    //iterates over the first column of the data array and set the values of the segmented control
    for (int i = 0; i < 5; i++) {
        [self.lessonControl setTitle:(NSString *)lessonData[0][i] forSegmentAtIndex:i];
    }
    
    
    // now found the animation images
    for(int i = 0; i < ((NSArray *)lessonData[3][0]).count ; i ++){
        [animation1 addObject:[UIImage imageNamed:[((NSMutableString *)lessonData[3][0][i]) stringByAppendingString:@".png"] ]];
    }
    
    for(int i = 0; i < ((NSArray *)lessonData[3][1]).count ; i ++){
        [animation2 addObject:[UIImage imageNamed:[((NSMutableString *)lessonData[3][1][i]) stringByAppendingString:@".png"] ]];
    }
    
    for(int i = 0; i < ((NSArray *)lessonData[3][2]).count ; i ++){
        [animation3 addObject:[UIImage imageNamed:[((NSMutableString *)lessonData[3][2][i]) stringByAppendingString:@".png"] ]];
    }
    
    for(int i = 0; i < ((NSArray *)lessonData[3][3]).count ; i ++){
        [animation4 addObject:[UIImage imageNamed:[((NSMutableString *)lessonData[3][3][i]) stringByAppendingString:@".png"] ]];
    }
    
    for(int i = 0; i < ((NSArray *)lessonData[3][4]).count ; i ++){
        [animation5 addObject:[UIImage imageNamed:[((NSMutableString *)lessonData[3][4][i]) stringByAppendingString:@".png"] ]];
    }
    
    firstViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View1" owner:nil options:nil] firstObject];
    firstViewUIView.ImageLetter.image = [UIImage imageNamed:[((NSMutableString *)lessonData[1][0]) stringByAppendingString:@".png"]];
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickEventOnImage:)];
    [firstViewUIView.ImageLetter addGestureRecognizer : touch];
    firstViewUIView.ImageInfo.text = (NSString *)lessonData[1][0];
    [self.scrollView addSubview:firstViewUIView];
    
    secondViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View2" owner:nil options:nil] firstObject];
    secondViewUIView.mainView = self;
    [self.scrollView addSubview:secondViewUIView];

    thirdViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View3" owner:nil options:nil] firstObject];
    thirdViewUIView.imageAnimation.animationImages = animation1;
    thirdViewUIView.imageAnimation.animationDuration = 1.3;
    [thirdViewUIView.imageAnimation startAnimating];
    [self.scrollView addSubview:thirdViewUIView];
}

-(void)viewDidLayoutSubviews
{
    
    firstViewUIView.frame = CGRectMake(0, 0, firstViewUIView.frame.size.width, firstViewUIView.frame.size.height);
    
    secondViewUIView.frame = CGRectMake(self.scrollView.frame.size.width*2, 0, secondViewUIView.frame.size.width, secondViewUIView.frame.size.height);
    
    thirdViewUIView.frame = CGRectMake(self.scrollView.frame.size.width, 0, thirdViewUIView.frame.size.width, thirdViewUIView.frame.size.height);
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*3, self.scrollView.frame.size.height)];
}

-(void)gotoView: (id) sender{
    [self performSegueWithIdentifier:@"gotoDrawView" sender:nil];
}

-(void) ClickEventOnImage:(id) sender
{
        NSString *audioName = [[NSString alloc] init];
    
        audioName = (NSString *)lessonData[1][self.lessonControl.selectedSegmentIndex];
    
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
    
    firstViewUIView.ImageLetter.image = [UIImage imageNamed:[((NSMutableString *)lessonData[1][self.lessonControl.selectedSegmentIndex]) stringByAppendingString:@".png"]];
    firstViewUIView.ImageInfo.text = (NSString *)lessonData[1][self.lessonControl.selectedSegmentIndex];
    
    switch (self.lessonControl.selectedSegmentIndex) {
        case 0:
            thirdViewUIView.imageAnimation.animationImages = animation1;
            thirdViewUIView.imageAnimation.animationDuration = 1.3;
            [thirdViewUIView.imageAnimation startAnimating];
            break;
        case 1:
            thirdViewUIView.imageAnimation.animationImages = animation2;
            thirdViewUIView.imageAnimation.animationDuration = 1.3;
            [thirdViewUIView.imageAnimation startAnimating];
            break;
        case 2:
            thirdViewUIView.imageAnimation.animationImages = animation3;
            thirdViewUIView.imageAnimation.animationDuration = 1.3;
            [thirdViewUIView.imageAnimation startAnimating];
            break;
        case 3:
            thirdViewUIView.imageAnimation.animationImages = animation4;
            thirdViewUIView.imageAnimation.animationDuration = 1.3;
            [thirdViewUIView.imageAnimation startAnimating];
            break;
        case 4:
            thirdViewUIView.imageAnimation.animationImages = animation5;
            thirdViewUIView.imageAnimation.animationDuration = 1.3;
            [thirdViewUIView.imageAnimation startAnimating];
            break;
            
        default:
            break;
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"gotoDrawView"]) {
        ViewControllerDesenhaLetra *view = (ViewControllerDesenhaLetra *)((UINavigationController*)segue.destinationViewController).topViewController;
        
        NSString *temp = [[NSString alloc] init];
        temp = [((NSMutableString *)lessonData[1][self.lessonControl.selectedSegmentIndex]) stringByAppendingString:@"1.png"];
        
        view.imageName = temp;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
