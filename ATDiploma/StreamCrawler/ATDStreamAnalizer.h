//
//  ATDStreamAnalizer.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/26/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <libxml/tree.h>
#import "ATDStreamCrawler.h"

@interface ATDStreamAnalizer : NSObject<ATDStreamCrawler> {
    
    xmlParserCtxtPtr context;
    
}


@end
