//
//  ATDFileReader.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/15/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATDFileReader : NSObject

+(NSData *)readFromFile:(NSString *)fileName starting:(NSUInteger)offset length:(NSUInteger)bytes;

+(void) crawlXMLAtPath:(NSString *)fileName forIndexer:(id)indexer;

@end
