//
//  Profile.h
//  SOflowClient
//
//  Created by David Rogers on 2/19/15.
//  Copyright (c) 2015 David Rogers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Profile : NSObject

+(NSArray *)profileFromJSON:(NSData *)jsonData;

@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) UIImage *profileImage;

@end
