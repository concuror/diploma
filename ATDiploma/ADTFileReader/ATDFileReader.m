//
//  ATDFileReader.m
//  ATDiploma
//
//  Created by Andrii Titov on 4/15/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import "ATDFileReader.h"
#import "ATDStreamAnalizer.h"

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
    static const NSUInteger length = 1024;
    ATDStreamAnalizer *analizer = [[ATDStreamAnalizer alloc] init];
    NSFileHandle *file = [NSFileHandle fileHandleForReadingAtPath:fileName];
    if (nil == file) {
        NSLog(@"Could not open file");
        return;
    }
    NSData *dataChunk;
    NSUInteger offset = 0;
    do {
        [file seekToFileOffset:offset];
        dataChunk = [file readDataOfLength:length];
        [analizer gotData:dataChunk formStream:file];
        offset += length;
    } while (dataChunk);    
}

@end
