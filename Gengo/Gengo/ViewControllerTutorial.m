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
    
    NSArray *animationA;
    NSArray *animationI;
    NSArray *animationU;
    NSArray *animationE;
    NSArray *animationO;
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
    
    animationA = @[[UIImage imageNamed:@"a.png"],[UIImage imageNamed:@"a--.png"]];
    animationI = @[[UIImage imageNamed:@"i.png"],[UIImage imageNamed:@"i--.png"]];
    animationU = @[[UIImage imageNamed:@"u.png"],[UIImage imageNamed:@"u--.png"]];
    animationE = @[[UIImage imageNamed:@"e.png"],[UIImage imageNamed:@"e--.png"]];
    animationO = @[[UIImage imageNamed:@"o.png"],[UIImage imageNamed:@"o--.png"]];
    
    
    firstViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View1" owner:nil options:nil] firstObject];
    firstViewUIView.ImageLetter.image = [UIImage imageNamed:@"a.png"];
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickEventOnImage:)];
    [firstViewUIView.ImageLetter addGestureRecognizer : touch];
    firstViewUIView.ImageInfo.text = @"a";
    [self.scrollView addSubview:firstViewUIView];
    
    secondViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View2" owner:nil options:nil] firstObject];
    secondViewUIView.mainView = self;
    [self.scrollView addSubview:secondViewUIView];

    thirdViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"View3" owner:nil options:nil] firstObject];
    thirdViewUIView.imageAnimation.animationImages = animationA;
    thirdViewUIView.imageAnimation.animationDuration = 0.6;
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
    switch (self.lessonControl.selectedSegmentIndex) {
        case 0:
            firstViewUIView.ImageLetter.image = [UIImage imageNamed:@"a.png"];
            firstViewUIView.ImageInfo.text = @"a";
            thirdViewUIView.imageAnimation.animationImages = animationA;
            thirdViewUIView.imageAnimation.animationDuration = 0.5;
            [thirdViewUIView.imageAnimation startAnimating];
            break;
        case 1:
            firstViewUIView.ImageLetter.image = [UIImage imageNamed:@"i.png"];
            firstViewUIView.ImageInfo.text = @"i";
            thirdViewUIView.imageAnimation.animationImages = animationI;
            thirdViewUIView.imageAnimation.animationDuration = 0.5;
            [thirdViewUIView.imageAnimation startAnimating];
            break;
        case 2:
            firstViewUIView.ImageLetter.image = [UIImage imageNamed:@"u.png"];
            firstViewUIView.ImageInfo.text = @"u";
            thirdViewUIView.imageAnimation.animationImages = animationU;
            thirdViewUIView.imageAnimation.animationDuration = 0.5;
            [thirdViewUIView.imageAnimation startAnimating];
            break;
        case 3:
            firstViewUIView.ImageLetter.image = [UIImage imageNamed:@"e.png"];
            firstViewUIView.ImageInfo.text = @"e";
            thirdViewUIView.imageAnimation.animationImages = animationE;
            thirdViewUIView.imageAnimation.animationDuration = 0.5;
            [thirdViewUIView.imageAnimation startAnimating];
            break;
        case 4:
            firstViewUIView.ImageLetter.image = [UIImage imageNamed:@"o.png"];
            firstViewUIView.ImageInfo.text = @"o";
            thirdViewUIView.imageAnimation.animationImages = animationO;
            thirdViewUIView.imageAnimation.animationDuration = 0.5;
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
        
            switch (self.lessonControl.selectedSegmentIndex) {
                case 0:
                    temp = @"a--.png";
                    break;
        
                case 1:
                    temp = @"i--.png";
                    break;
        
                case 2:
                    temp = @"u--.png";
                    break;
        
                case 3:
                    temp = @"e--.png";
                    break;
        
                case 4:
                    temp = @"o--.png";
                    break;
        
                default:
                    break;
            }
        
        view.imageName = temp;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

@end
