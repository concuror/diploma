//
//  ATDFileReader.m
//  ATDiploma
//
//  Created by Andrii Titov on 4/15/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import "ATDFileReader.h"

@implementation ATDFileReader

+(NSData *)readFromFile:(NSString *)fileName starting:(NSUInteger)offset length:(NSUInteger)bytes {
    NSFileHandle *file = [NSFileHandle fileHandleForReadingAtPath:fileName];
    if (nil == file) {
        NSLog(@"Could not open file");
        return nil;
    }
    [file seekToFileOffset:offset];
    NSData *dataChunk = [file readDataOfLength:bytes];
    return dataChunk;
}

+(void) crawlXMLAtPath:(NSString *)fileName forIndexer:(id)indexer {
    
}

@end
