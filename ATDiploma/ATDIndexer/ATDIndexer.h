//
//  ATDIndexer.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/29/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATDXMLParserDelegate.h"
#import "ATDPTrie.h"

@interface ATDIndexer : NSObject<ATDXMLParserDelegate> {
    
    NSString *_elementName;
    
    ATDPTrie *_structure;
    
    NSMutableString *tmpString;
    
    NSString *_currFileName;
    
    NSUInteger _currOffset;
    
}

-(id)initWithName:(NSString *)elementName;

@property (nonatomic, retain) NSString *elementName;

@property (nonatomic, readonly) ATDPTrie *structure;

@property (nonatomic, retain) NSString *currFileName;

@property (assign) NSUInteger currOffset;

@end
