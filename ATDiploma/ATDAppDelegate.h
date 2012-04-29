//
//  ATDAppDelegate.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ATDIndexer;

@interface ATDAppDelegate : NSObject <NSApplicationDelegate> {
    
    ATDIndexer *index;
    
}

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTextField *label;

@property (assign) IBOutlet NSTextField *textField;

@property (assign) IBOutlet NSTextField *valueField;

@property (assign) IBOutlet NSTextField *resultsField;

@property (assign) IBOutlet NSTextField *statisticsField;

-(IBAction)addNode:(id)sender;

-(IBAction)removeNode:(id)sender;

-(IBAction)checkWord:(id)sender;

-(IBAction)saveTrie:(id)sender;

-(IBAction)loadTrie:(id)sender;

@end
