//
//  MenuPressedDelegate.h
//  SOflowClient
//
//  Created by David Rogers on 2/18/15.
//  Copyright (c) 2015 David Rogers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuPressedDelegate <NSObject>

-(void)menuOptionSelected:(NSInteger)selectedRow;

@end
