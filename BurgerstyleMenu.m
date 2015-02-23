//
//  BurgerstyleMenu.m
//  SOflowClient
//
//  Created by David Rogers on 2/16/15.
//  Copyright (c) 2015 David Rogers. All rights reserved.
//

#import "BurgerstyleMenu.h"
#import "TableViewMenu.h"
//#import "MenuPressedDelegate.h"
#import "ProfileVC.h"
#import "SearchQuestionsVC.h"

@interface BurgerstyleMenu () <MenuPressedDelegate>

@property (strong, nonatomic) UIViewController *topVC;
//@property (strong, nonatomic) UIButton *burgerStyleButton;
@property (strong, nonatomic) IBOutlet UIButton *burgerStyleButton;
@property (strong, nonatomic) UITapGestureRecognizer *tapToClose;
@property (strong, nonatomic) UIPanGestureRecognizer *slideGestureRecognizer;

@property (strong, nonatomic) UINavigationController *tableViewMenu;

//@property (strong, nonatomic) UINavigationController *

@property (nonatomic) NSInteger selectedRow; //keep * as pointer off this one
@property (strong, nonatomic) UINavigationController *profileVC;
@property (strong, nonatomic) UINavigationController *searchVC;
@property (strong, nonatomic) TableViewMenu *menuVC;

@end

@implementation BurgerstyleMenu

NSInteger const kSlideRightBuffer = 300;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//  
//  [self addChildViewController:self.tableViewMenu];
//  
//  self.tableViewMenu.view.frame = self.view.frame;
//  [self.view addSubview:self.tableViewMenu.view];
//  
//  [self.tableViewMenu didMoveToParentViewController:self];
//  self.topVC = self.tableViewMenu;
//  
//  self.selectedRow = 0;
//  
//  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
//  [button setBackgroundImage:[UIImage imageNamed:@"burger"] forState:UIControlStateNormal];
//  [button addTarget:self action:@selector(burgerButtonPressed) forControlEvents:UIControlEventTouchUpInside];
//  
//  [self.tableViewMenu.view addSubview:button];
//  
//  self.burgerStyleButton = button;
  
  
  
  self.tapToClose = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closePanel)];
  
  self.slideGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(slidePanel:)];
  [self.topVC.view addGestureRecognizer:self.slideGestureRecognizer];
  
}


-(void)burgerButtonPressed {
  NSLog(@"burger pressed");
  
  self.burgerStyleButton.userInteractionEnabled = false;
  
  __weak BurgerstyleMenu *weakSelf = self;
  
  [UIView animateWithDuration: 2.8 animations:^{
    weakSelf.topVC.view.center = CGPointMake(weakSelf.topVC.view.center.x + kSlideRightBuffer, weakSelf.topVC.view.center.y);
  } completion:^(BOOL finished) {
    [weakSelf.topVC.view addGestureRecognizer:weakSelf.tapToClose];
  }];
}


-(void)closePanel {
  NSLog(@"closing panel...");
  [self.topVC.view removeGestureRecognizer:self.tapToClose];
  
  __weak BurgerstyleMenu *weakSelf = self;
  
  [UIView animateWithDuration:0.3 animations:^{
    weakSelf.topVC.view.center = weakSelf.view.center;
  } completion:^(BOOL finished) {
    weakSelf.burgerStyleButton.userInteractionEnabled = true;
  }];
}
        
-(void)slidePanel:(id)sender {
  UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)sender;
  
  CGPoint translatedPoint = [pan translationInView:self.view];
  CGPoint velocity = [pan velocityInView:self.view];
  
  if ([pan state] == UIGestureRecognizerStateChanged) {
    
    if (velocity.x > 0 || self.topVC.view.frame.origin.x > 0) {
      self.topVC.view.center = CGPointMake(self.topVC.view.center.x + translatedPoint.x, self.topVC.view.center.y);
      [pan setTranslation:CGPointZero inView:self.view];
    }
  }
  
  if ([pan state] == UIGestureRecognizerStateEnded) {
    
    __weak BurgerstyleMenu *weakSelf = self;
    if (self.topVC.view.frame.origin.x > self.view.frame.size.width / 3) {
      NSLog(@"open attempt made");
      self.burgerStyleButton.userInteractionEnabled = false;
      [UIView animateWithDuration:0.3 animations:^{
        self.topVC.view.center = CGPointMake(weakSelf.view.frame.size.width * 1.25, weakSelf.topVC.view.center.y);
      } completion:^(BOOL finished) {
        [weakSelf.topVC.view addGestureRecognizer:weakSelf.tapToClose];
      }];
    } else {
      [UIView animateWithDuration:0.2 animations:^{
        weakSelf.topVC.view.center = weakSelf.view.center;
      }];
      [self.topVC.view removeGestureRecognizer:self.tapToClose];
    }
  }
}
        
-(UINavigationController *)searchVC {
  if (!_searchVC) {
    _searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SEARCH_VC"];
  }
  return _searchVC;
}

-(UINavigationController *)profileVC {
  if (!_profileVC) {
    _searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PROFILE_VC"];
  }
  return _profileVC;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if ([segue.identifier isEqualToString:@"EMBED_MENU"]) {
    TableViewMenu *destinationVC = segue.destinationViewController;
    destinationVC.delegate = self;
    self.menuVC = destinationVC;
    }
  }

-(void)switchToVC:(UIViewController *)destinationVC {
  
  __weak BurgerstyleMenu *weakSelf = self;
  
  [UIView animateWithDuration:0.29 animations:^{
    
    weakSelf.topVC.view.frame = CGRectMake(weakSelf.view.frame.size.width, weakSelf.topVC.view.frame.size.height, weakSelf.view.frame.size.width, weakSelf.view.frame.size.height);
    
  } completion:^(BOOL finished) {
    
    destinationVC.view.frame = self.topVC.view.frame;
    
    [self.topVC.view removeGestureRecognizer:self.slideGestureRecognizer];
    [self.burgerStyleButton removeFromSuperview];
    [self.topVC willMoveToParentViewController:nil];
    [self.topVC.view removeFromSuperview];
    [self.topVC removeFromParentViewController];
    
    self.topVC = destinationVC;
    
    [self addChildViewController:self.topVC];
    [self.view addSubview:self.topVC.view];
    [self.topVC didMoveToParentViewController:self];
    [self.topVC.view addSubview:self.burgerStyleButton];
    [self.topVC.view addGestureRecognizer:self.slideGestureRecognizer];
    
    [self closePanel];
    
  }];
  
}

 -(void)menuOptionSelected:(NSInteger)selectedRow {
   NSLog(@"%ld", (long)selectedRow);
   
   if (self.selectedRow == selectedRow) {
     [self closePanel];
     
   } else {
     
     self.selectedRow = selectedRow;
     
     UIViewController *destinationVC;
     
     switch (selectedRow) {
       case 0:
         destinationVC = self.searchVC;
         
         break;
       case 1:
         destinationVC = self.profileVC;
         
         break;
       case 2:
         
         
         break;
         
       default:
         break;
     }
     [self switchToVC:destinationVC];
   }
}

@end
