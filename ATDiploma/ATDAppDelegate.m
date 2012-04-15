//
//  ATDAppDelegate.m
//  ATDiploma
//
//  Created by Andrii Titov on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ATDAppDelegate.h"
#import "ATDPTrie.h"

@implementation ATDAppDelegate
@synthesize label, textField;

@synthesize window = _window;

- (void)dealloc
{
    [indexTrie release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    indexTrie = [[ATDPTrie alloc] init];
}

-(IBAction)addNode:(id)sender{
    [indexTrie insertWord:self.textField.stringValue];
}

-(IBAction)removeNode:(id)sender{
    [indexTrie deleteWord:self.textField.stringValue];
}

-(IBAction)checkWord:(id)sender {
    if ([indexTrie lookupWord:self.textField.stringValue]) {
        self.label.stringValue = @"YES";
    } 
    else {
        self.label.stringValue = @"NO";
    }
}



@end
