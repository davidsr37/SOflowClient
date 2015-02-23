//
//  TableViewMenu.h
//  SOflowClient
//
//  Created by David Rogers on 2/16/15.
//  Copyright (c) 2015 David Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuPressedDelegate.h"
//#import "SearchQuestionsVC.h"

enum style {
  
  cool,
  notCool,
  rad,
  wups
  
};

typedef NSString word;
typedef void (^SOCompletionHandler)(NSArray *, NSError *);

@interface TableViewMenu : UITableViewController

@property (weak, nonatomic) id<MenuPressedDelegate> delegate;

//-(void)fetchQuestionForSearchTerm:(NSString *)searchTerm withCompletionHandler:(SOCompletionHandler)completion;

@end
