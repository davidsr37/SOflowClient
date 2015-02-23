//
//  Question.h
//  SOflowClient
//
//  Created by David Rogers on 2/17/15.
//  Copyright (c) 2015 David Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Question : NSObject

+(NSArray *)questionsFromJSON:(NSData *)jsonData;

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *avatarURL;
@property (strong, nonatomic) UIImage *image;

@end
