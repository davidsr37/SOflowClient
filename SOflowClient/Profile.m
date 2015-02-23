//
//  Profile.m
//  SOflowClient
//
//  Created by David Rogers on 2/19/15.
//  Copyright (c) 2015 David Rogers. All rights reserved.
//

#import "Profile.h"

@implementation Profile

+(NSArray *)profileFromJSON:(NSData *)jsonData {
  
  NSError *error;
  NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
  if (error) {
    NSLog(@"%@", error.localizedDescription);
    return nil;
  }
  
  NSArray *items = [jsonDictionary objectForKey:@"items"];
  
  NSMutableArray *temp = [[NSMutableArray alloc] init];
  
  for (NSDictionary *item in items) {
    Profile *profile = [[Profile alloc] init];
    profile.userID = item[@"userID"];
    profile.userName = item[@"userName"];
    profile.imageURL = item[@"imageURL"];
    profile.profileImage = item[@"profileImage"];
    
    [temp addObject:profile];
    
  }
  
  NSArray *final = [[NSArray alloc] initWithArray:temp];
  return final;
  
  
}

@end
