//
//  ATDAppDelegate.m
//  ATDiploma
//
//  Created by Andrii Titov on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ATDAppDelegate.h"
#import "ATDPTrie.h"
#import "ATDFileReader.h"
#import "ATDIndexer.h"

@implementation ATDAppDelegate
@synthesize label, textField, valueField,resultsField,statisticsField;

@synthesize window = _window;

- (void)dealloc
{
    [index release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    //indeces = [[ATDIndexer alloc] initWithName:<#(NSString *)#>];
}

-(IBAction)addNode:(id)sender{
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.canChooseDirectories = NO;
    openPanel.canChooseFiles = YES;
    if ([openPanel runModal] == NSOKButton) {
        if (index) {
            [index release];
            index = nil;
        }
        index = [[ATDIndexer alloc] initWithName:self.textField.stringValue];
        NSDate *tmp = [[NSDate alloc] init];
        [ATDFileReader crawlXMLAtPath:[[openPanel URL] path] forIndexer:index];
        NSTimeInterval time = -1*[tmp timeIntervalSinceNow];
        NSUInteger size = [index.structure getTreeSize];
        NSString *resString = [NSString stringWithFormat:@"CrawlTime: %f\nIndexSize: %d",time,size];
        self.statisticsField.stringValue = resString;
    }
}

-(IBAction)removeNode:(id)sender{
    NSUInteger size = [index.structure getTreeSize];
    NSString *resString = [NSString stringWithFormat:@"IndexSize: %d",size];
    self.statisticsField.stringValue = resString;
}

-(IBAction)checkWord:(id)sender {
    
}

-(IBAction)saveTrie:(id)sender {
    NSSavePanel *saveDlg =[NSSavePanel savePanel];
    saveDlg.canCreateDirectories = YES;
    if ([saveDlg runModal] == NSOKButton) {
        [index.structure saveTrieToFile:[[saveDlg URL] path]];
    }
}

-(IBAction)loadTrie:(id)sender {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.canChooseDirectories = NO;
    openPanel.canChooseFiles = YES;
    if ([openPanel runModal] == NSOKButton) {
        if (index) {
            [index release];
            index = nil;
        }
        index = [[ATDIndexer alloc] initWithName:self.textField.stringValue];
        [index.structure loadFromFile:[[openPanel URL] path]];
    }
}

@end
