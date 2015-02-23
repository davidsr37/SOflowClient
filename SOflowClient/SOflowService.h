//
//  SOflowService.h
//  SOflowClient
//
//  Created by David Rogers on 2/17/15.
//  Copyright (c) 2015 David Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SOflowService : NSObject

+(id)sharedService;

-(void)fetchQuestionWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray *results, NSString *error)) completionHandler;

-(void)fetchUserImage:(NSString *)avatarURL completionHandler:(void (^) (UIImage *image))completionHandler;

-(void)fetchMyProfile:(void (^)(NSArray *results, NSString *error))completionHandler;

@end
