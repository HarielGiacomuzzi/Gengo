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
    self.lesson = [[Lesson alloc] init];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@", self.lesson.grade);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LessonCellTableViewCell *cell = (LessonCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"lessonCell"];
    
    [cell.testButton addTarget:self action:@selector(testButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.exerciseButton addTarget:self action:@selector(exerciseButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
 
    
    return cell;
}

-(void)testButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goToTest" sender:self];
}

-(void)exerciseButtonClicked:(UIButton *)sender {
    [self performSegueWithIdentifier:@"goToGame" sender:self];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goToTest"]) {
        TestViewController *test = (TestViewController *)segue.destinationViewController;
        test.lesson = self.lesson;
        
    } else if ([segue.identifier isEqualToString:@"goToGame"]){
        GameViewController *game = (GameViewController *)segue.destinationViewController;
        game.lesson = self.lesson;
        
    }
}




@end
