//
//  XMLHelper.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/27/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#ifndef ATDiploma_XMLHelper_h
#define ATDiploma_XMLHelper_h
#import <libxml/tree.h>

struct _xmlSAX2Attributes {
    const xmlChar* localname;
    const xmlChar* prefix;
    const xmlChar* uri;
    const xmlChar* value;
    const xmlChar* end;
};

typedef struct _xmlSAX2Attributes xmlSAX2Attributes;

#endif
