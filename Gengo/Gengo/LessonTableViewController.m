//
//  LessonTableViewController.m
//  Gengo
//
//  Created by Daniel Amarante on 3/24/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

#import "LessonTableViewController.h"


@interface LessonTableViewController ()

@end

@implementation LessonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.user = [User loadUser];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.user = [User loadUser];
//    self.user.lessonArray = [[NSMutableArray alloc] initWithObjects:[[Lesson alloc] initWithNumber:1], nil];
//    self.user.items = [[NSMutableArray alloc] initWithObjects:@1,@0, nil];
//    self.user.itemInUse = @0;
//    self.user.money = 1000;
    [self.tableView reloadData];
    [SaveUtility SyncUser];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.user.lessonArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LessonCellTableViewCell *cell = (LessonCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"lessonCell"];
    Lesson *lesson = self.user.lessonArray[indexPath.row];
    
    cell.titleLabel.text = [NSString stringWithFormat:@"Lição %ld",lesson.lessonNumber];
    [cell.testButton addTarget:self action:@selector(testButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.exerciseButton addTarget:self action:@selector(exerciseButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.lessonButton addTarget:self action:@selector(lessonButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

-(void)testButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goToTest" sender:sender];
}

-(void)exerciseButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goToGame" sender:sender];

}

-(void)lessonButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goToTutorial" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    
    UIView *superView = sender.superview;
    UIView *foundSuperView = nil;
    
    while (nil != superView && nil == foundSuperView) {
        if ([superView isKindOfClass:[UITableViewCell class]]) {
            foundSuperView = superView;
        } else {
            superView = superView.superview;
        }
    }
    
    NSIndexPath *idxPath = [self.tableView indexPathForCell:(UITableViewCell *)foundSuperView];

    
    if ([segue.identifier isEqualToString:@"goToTest"]) {
        TestViewController *test = (TestViewController *)segue.destinationViewController;
        test.lesson = self.user.lessonArray[idxPath.row];
        
    } else if ([segue.identifier isEqualToString:@"goToGame"]){
        GameViewController *game = (GameViewController *)segue.destinationViewController;
        game.lesson = self.user.lessonArray[idxPath.row];
        
    } else if ([segue.identifier isEqualToString:@"goToTutorial"]) {
        ViewControllerTutorial *tutorial = (ViewControllerTutorial *)segue.destinationViewController;
        tutorial.lesson = self.user.lessonArray[idxPath.row];
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}




@end
