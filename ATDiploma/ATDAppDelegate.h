//
//  ATDAppDelegate.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ATDPTrie;

@interface ATDAppDelegate : NSObject <NSApplicationDelegate> {
    
    ATDPTrie *indexTrie;
    
}

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTextField *label;

@property (assign) IBOutlet NSTextField *textField;

-(IBAction)addNode:(id)sender;

-(IBAction)removeNode:(id)sender;

-(IBAction)checkWord:(id)sender;

@end
