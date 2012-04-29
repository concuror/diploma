//
//  ATDXMLParserDelegate.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/27/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "XMLHelper.h"

@protocol ATDXMLParserDelegate <NSObject>

- (void)parserDidEndDocument:(NSXMLParser *)parser;

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict;

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError;

@end
