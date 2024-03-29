//
//  ATDStreamAnalizer.m
//  ATDiploma
//
//  Created by Andrii Titov on 4/26/12.
//  Copyright (c) 2012 home. All rights reserved.
//


#import "ATDStreamAnalizer.h"

@implementation ATDStreamAnalizer
@synthesize delegate = _delegate;

-(id)initWithDelegate:(id<ATDXMLParserDelegate>)delegate {
    self = [super init];
    if (self) {
        _delegate = delegate;
        context = xmlCreatePushParserCtxt(&simpleSAXHandlerStruct, self, NULL, 0, NULL);
    }
    return self;
}

-(void)gotData:(NSData *)data formStream:(id)StreamHandler{
    xmlParseChunk(context, (char *)[data bytes], [data length], 0);
}

-(void)closedStream:(id)streamHandler {
    xmlParseChunk(context, NULL, 0, 1);
}


#pragma mark SAX Parsing Callbacks

static void startElementSAX(void *ctx, const xmlChar *localname, const xmlChar *prefix,
                            const xmlChar *URI, int nb_namespaces, const xmlChar **namespaces,
                            int nb_attributes, int nb_defaulted, const xmlChar **attributes) {
    [((ATDStreamAnalizer *) ctx).delegate elementFound:localname prefix:prefix uri:URI 
                             namespaceCount:nb_namespaces namespaces:namespaces
                             attributeCount:nb_attributes defaultAttributeCount:nb_defaulted
                                 attributes:(xmlSAX2Attributes*)attributes];
}

static void	endElementSAX(void *ctx, const xmlChar *localname, const xmlChar *prefix,
                          const xmlChar *URI) {    
    [((ATDStreamAnalizer *) ctx).delegate endElement:localname prefix:prefix uri:URI];
}

static void	charactersFoundSAX(void *ctx, const xmlChar *ch, int len) {
    [((ATDStreamAnalizer *) ctx).delegate charactersFound:ch length:len];
}

static void errorEncounteredSAX(void *ctx, const char *msg, ...) {
    va_list argList;
    va_start(argList, msg);
    [((ATDStreamAnalizer *) ctx).delegate parsingError:msg, argList];
}

static void endDocumentSAX(void *ctx) {
    [((ATDStreamAnalizer *) ctx).delegate endDocument];
}


static xmlSAXHandler simpleSAXHandlerStruct = {
    NULL,                       /* internalSubset */
    NULL,                       /* isStandalone   */
    NULL,                       /* hasInternalSubset */
    NULL,                       /* hasExternalSubset */
    NULL,                       /* resolveEntity */
    NULL,                       /* getEntity */
    NULL,                       /* entityDecl */
    NULL,                       /* notationDecl */
    NULL,                       /* attributeDecl */
    NULL,                       /* elementDecl */
    NULL,                       /* unparsedEntityDecl */
    NULL,                       /* setDocumentLocator */
    NULL,                       /* startDocument */
    endDocumentSAX,             /* endDocument */
    NULL,                       /* startElement*/
    NULL,                       /* endElement */
    NULL,                       /* reference */
    charactersFoundSAX,         /* characters */
    NULL,                       /* ignorableWhitespace */
    NULL,                       /* processingInstruction */
    NULL,                       /* comment */
    NULL,                       /* warning */
    errorEncounteredSAX,        /* error */
    NULL,                       /* fatalError //: unused error() get all the errors */
    NULL,                       /* getParameterEntity */
    NULL,                       /* cdataBlock */
    NULL,                       /* externalSubset */
    XML_SAX2_MAGIC,             // initialized? not sure what it means just do it
    NULL,                       // private
    startElementSAX,            /* startElementNs */
    endElementSAX,              /* endElementNs */
    NULL,                       /* serror */
};

@end
