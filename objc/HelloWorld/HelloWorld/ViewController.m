//
//  ViewController.m
//  HelloWorld
//
//  Created by Администратор on 9/19/12.
//  Copyright (c) 2012 GreenZoneSoftware. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "StringConverter.h"

@interface ViewController ()

- (IBAction)changeGreeting:(id)sender;
- (BOOL)textFieldShouldReturn:(UITextField*) textField;

- (Person*)getPerson;
- (void)saveUserData;
- (BOOL)isUserInputField:(UITextField*)textField;

@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;
// username
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (copy, nonatomic) NSString* userName;
// age
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (copy, nonatomic) NSNumber* age;
// height
@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (copy, nonatomic) NSNumber* height;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setGreetingLabel:nil];
    [self setUserNameField:nil];
    [self setAgeField:nil];
    [self setHeightField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)changeGreeting:(id)sender
{
    [self saveUserData];
    Person* person = [self getPerson];
    NSString* greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", person.getPersonality];
    self.greetingLabel.text = greeting;
}

- (BOOL)textFieldShouldReturn:(UITextField*) textField
{
    if ([self isUserInputField:textField])
    {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (BOOL)isUserInputField:(UITextField*)textField
{
    if (textField == self.userNameField ||
        textField == self.ageField ||	
        textField == self.heightField)
    {
        return YES;
    }
    return NO;
}

- (Person*)getPerson
{
    Person* obj = [[Person alloc] initWithName:self.userName
                                    AndAge:[self.age unsignedIntValue]
                                    AndHeight:[self.height unsignedIntValue]];
    return obj;
}   

- (void)saveUserData
{
    self.userName = self.userNameField.text;
    self.age = [StringConverter ConvertStringToNumber:self.ageField.text];
    self.height = [StringConverter ConvertStringToNumber:self.heightField.text];
}

@end
