//
//  SearchQuestionsVC.m
//  SOflowClient
//
//  Created by David Rogers on 2/17/15.
//  Copyright (c) 2015 David Rogers. All rights reserved.
//

#import "SearchQuestionsVC.h"
#import "SOflowService.h"
#import "Question.h"
#import "QuestionCell.h"

@interface SearchQuestionsVC () <UISearchBarDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *questions;

@end

//set outlets from storyboard for table and searchbar

@implementation SearchQuestionsVC

- (void)viewDidLoad {
    [super viewDidLoad];
  self.searchBar.delegate = self;
  self.tableView.dataSource = self;
  self.tableView.rowHeight = UITableViewAutomaticDimension;
  //set searchbar delegate
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  
  [[SOflowService sharedService] fetchQuestionWithSearchTerm:searchBar.text completionHandler:^(NSArray *results, NSString *error) {
    self.questions = results;
    if (error) {
      //display alert
    }
    [self.tableView reloadData];
  }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.questions.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QUESTION_CELL" forIndexPath:indexPath];

  cell.avatarImageView.image = nil;
  Question *question = self.questions[indexPath.row];
  cell.titleTextView.text = question.title;
  if (!question.image) {
    [[SOflowService sharedService] fetchUserImage:question.avatarURL completionHandler:^(UIImage *image) {
      question.image = image;
      cell.avatarImageView.image = question.image;
    }];
  } else {
    cell.avatarImageView.image = question.image;
    
  }
  return cell;
}

@end
