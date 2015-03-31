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
    self.user = [User loadUser];
    Lesson *l = self.lessonArray[0];
    l.grade = self.user.lessonGrade[0];
    l.highScore = self.user.gameScore[0];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    Lesson *l = self.lessonArray[0];
    self.user.lessonGrade[0] = l.grade;
    self.user.gameScore[0] = l.highScore;
    [SaveUtility SyncUser];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.lessonArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LessonCellTableViewCell *cell = (LessonCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"lessonCell"];
    
    [cell.testButton addTarget:self action:@selector(testButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.exerciseButton addTarget:self action:@selector(exerciseButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.lessonButton addTarget:self action:@selector(lessonButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
 
    
    return cell;
}

-(void)testButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goToTest" sender:self];
}

-(void)exerciseButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goToGame" sender:self];

}

-(void)lessonButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goToTutorial" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    
    if ([segue.identifier isEqualToString:@"goToTest"]) {
        TestViewController *test = (TestViewController *)segue.destinationViewController;
        test.lesson = self.lessonArray[0];
        
    } else if ([segue.identifier isEqualToString:@"goToGame"]){
        GameViewController *game = (GameViewController *)segue.destinationViewController;
        game.lesson = self.lessonArray[0];
        
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}




@end
