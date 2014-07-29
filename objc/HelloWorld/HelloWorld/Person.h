//
//  TestClass.h
//  HelloWorld
//
//  Created by Администратор on 11/19/12.
//  Copyright (c) 2012 GreenZoneSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
- (id)initWithName:(NSString*)name;
- (id)initWithName:(NSString*)name AndAge:(const int)age;
- (id)initWithName:(NSString*)name AndAge:(const int)age AndHeight:(const int)height;
- (NSString*)getPersonality;
@end
