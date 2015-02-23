//
//  ProfileVC.m
//  SOflowClient
//
//  Created by David Rogers on 2/18/15.
//  Copyright (c) 2015 David Rogers. All rights reserved.
//
// PLAYING WITH TURNING ARC OFF

#import "ProfileVC.h"
#import "Profile.h"

@interface ProfileVC () <UIScrollViewDelegate>

@property (retain, nonatomic) UITextField *textField;

@property (retain, nonatomic) UIScrollView *scrollView;

@end



@implementation ProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
  self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000);
  
  self.scrollView.delegate = self;
  [self.scrollView addSubview:self.scrollView];
  
  UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, 400)];
//  UITextField *textField = [[UITextField alloc] initWithFrame: CGRectMake(100, 100, 100, 100)];
  textField.backgroundColor = [UIColor blueColor];
  [self.scrollView addSubview:textField];
  
  
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
  
  NSLog(@"x:%f y:%f", scrollView.contentOffset.x, scrollView.contentOffset.y);
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}
-(void)dealloc {
  
  [self.scrollView release];
  [self.textField release];
  
  [super dealloc];
  
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
