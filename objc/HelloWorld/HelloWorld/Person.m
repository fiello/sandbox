//
//  TestClass.m
//  HelloWorld
//
//  Created by Администратор on 11/19/12.
//  Copyright (c) 2012 GreenZoneSoftware. All rights reserved.
//

#import "Person.h"

@interface Person ()
@property (weak) NSString* name;
@property (weak) NSNumber* age;
@property (weak) NSNumber* height;
@end

// blocks
static const int MaxAllowedAge = 200;
static const int MaxAllowedHeight = 300;

int (^validateUserData)(int, int) = ^(int numToValidate, int maxAllowedBound)
{
    if (numToValidate >= maxAllowedBound || numToValidate < 0)
        return 0;
    
    return numToValidate;
};

// implementation
@implementation Person

- (id)initWithName:(NSString*) name
{
    return [self initWithName:name AndAge:0];
}

- (id)initWithName:(NSString*)name AndAge:(const int)age
{
    return [self initWithName:name AndAge:age AndHeight:0];
}

- (id)initWithName:(NSString*)name AndAge:(const int)age AndHeight:(const int)height
{
    if (self = [super init])
    {
        self.name = name;
        self.age = [NSNumber numberWithInt:validateUserData(age, MaxAllowedAge)];
        self.height = [NSNumber numberWithInt:validateUserData(height, MaxAllowedHeight)];
    }
    return self;
}

- (NSString*)getPersonality
{
    NSString* personality = [[NSString alloc] initWithFormat:@"name:%@ age:%@, height:%@",
                             self.name, self.age, self.height];
    return personality;
}

@end
