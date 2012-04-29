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

- (void)elementFound:(const xmlChar *)localname prefix:(const xmlChar *)prefix 
                 uri:(const xmlChar *)URI namespaceCount:(int)namespaceCount
          namespaces:(const xmlChar **)namespaces attributeCount:(int)attributeCount 
defaultAttributeCount:(int)defaultAttributeCount attributes:(xmlSAX2Attributes *)attributes;

- (void)endElement:(const xmlChar *)localname prefix:(const xmlChar *)prefix uri:(const xmlChar *)URI;

- (void)charactersFound:(const xmlChar *)characters length:(int)length;

- (void)parsingError:(const char *)msg, ...;

- (void)endDocument;

@end
