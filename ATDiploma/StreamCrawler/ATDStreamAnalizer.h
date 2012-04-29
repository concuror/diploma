//
//  ATDStreamAnalizer.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/26/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATDStreamCrawler.h"
#import "ATDXMLParserDelegate.h"
#include "XMLHelper.h"

@interface ATDStreamAnalizer : NSObject<ATDStreamCrawler> {
    
    xmlParserCtxtPtr context;
    
    id<ATDXMLParserDelegate> _delegate;
    
}

-(id)initWithDelegate:(id<ATDXMLParserDelegate>)delegate;

@property(assign) id<ATDXMLParserDelegate> delegate;


@end
