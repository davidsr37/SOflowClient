//
//  QuestionCell.h
//  SOflowClient
//
//  Created by David Rogers on 2/18/15.
//  Copyright (c) 2015 David Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;

@end
