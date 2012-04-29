//
//  ATDIndexer.m
//  ATDiploma
//
//  Created by Andrii Titov on 4/29/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import "ATDIndexer.h"

@implementation ATDIndexer
@synthesize elementName = _elementName, structure = _structure, currFileName = _currFileName, currOffset = _currOffset;

-(id)initWithName:(NSString *)elementName {
    self = [super init];
    if (self) {
        self.elementName = elementName;
        _structure = [[ATDPTrie alloc] init];
    }
    return self;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
    if(nil != qName) {
        elementName = qName; // swap for the qName if we have a name space
    }
    NSString *str;
    if ([elementName isEqualToString:self.elementName]) {
        tmpString = [[NSMutableString alloc] init];
    }
    else if (( str = [attributeDict valueForKey:self.elementName]) ) {
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:_currOffset],@"offset",_currFileName,@"filename", nil];
        [_structure addValue:dictionary forKey:str];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (tmpString) {
        [tmpString appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if (qName) {
        elementName = qName; // switch for the qName
    }
    if (tmpString) {
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:_currOffset],@"offset",_currFileName,@"filename", nil];
        [_structure addValue:dictionary forKey:tmpString];
        [tmpString release];
        tmpString = nil;
    }
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"parser error %@, userInfo %@", parseError, [parseError userInfo]);
}

-(void) dealloc {
    [_currFileName release];
    [_elementName release];
    [_structure release];
    [tmpString release];
    [super dealloc];
}

@end
