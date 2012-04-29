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

- (void)elementFound:(const xmlChar *)localname prefix:(const xmlChar *)prefix 
                 uri:(const xmlChar *)URI namespaceCount:(int)namespaceCount
          namespaces:(const xmlChar **)namespaces attributeCount:(int)attributeCount 
defaultAttributeCount:(int)defaultAttributeCount attributes:(xmlSAX2Attributes *)attributes {
    NSString *elementName = [NSString stringWithCString:(const char *)localname encoding:NSUTF8StringEncoding];
    if ([elementName isEqualToString:self.elementName]) {
        tmpString = [[NSMutableString alloc] init];
        return;
    }
    for(int j = 0; j < attributeCount; j++) {
        if(0 == strncmp((const char*)attributes[j].localname, [self.elementName cStringUsingEncoding:NSUTF8StringEncoding],
                        [_elementName length])) {
            int urlLength = (int) (attributes[j].end - attributes[j].value);
            NSString *str = [[NSString alloc] initWithBytes:attributes[j].value
                                                     length:urlLength
                                                   encoding:NSUTF8StringEncoding];
            NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:_currOffset],@"offset",_currFileName,@"filename", nil];
            [_structure addValue:dictionary forKey:str];
            break;
        }
    }
}

- (void)endElement:(const xmlChar *)localname prefix:(const xmlChar *)prefix uri:(const xmlChar *)URI {
    if (tmpString && (0 == strncmp((const char *)localname,[_elementName cStringUsingEncoding:NSUTF8StringEncoding],[_elementName length]))) {
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInt:_currOffset],@"offset",_currFileName,@"filename", nil];
        [_structure addValue:dictionary forKey:tmpString];
        [tmpString release];
        tmpString = nil;
    }
}

- (void)charactersFound:(const xmlChar *)characters length:(int)length {
    if (tmpString) {
        NSString *value = [[NSString alloc] initWithBytes:(const void *)characters
                                                               length:length encoding:NSUTF8StringEncoding];
        [tmpString appendString:value];
        [value release];
    }
}

- (void)parsingError:(const char *)msg, ... {
    NSString *format = [[NSString alloc] initWithBytes:msg length:strlen(msg)
                                              encoding:NSUTF8StringEncoding];
    
    CFStringRef resultString = NULL;
    va_list argList;
    va_start(argList, msg);
    resultString = CFStringCreateWithFormatAndArguments(NULL, NULL,
                                                        (CFStringRef)format,
                                                        argList);
    va_end(argList);
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:(NSString*)resultString
                                                         forKey:@"error_message"];
    NSError *error = [NSError errorWithDomain:@"ParsingDomain"
                                         code:101
                                     userInfo:userInfo];
    NSLog(@"parser error %@, userInfo %@", error, [error userInfo]);
    
    [(NSString*)resultString release];
    [format release];
}

-(void)endDocument {
    
}

-(void) dealloc {
    [_currFileName release];
    [_elementName release];
    [_structure release];
    [tmpString release];
    [super dealloc];
}

@end
