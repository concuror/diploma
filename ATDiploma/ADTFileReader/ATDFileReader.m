//
//  ATDFileReader.m
//  ATDiploma
//
//  Created by Andrii Titov on 4/15/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import "ATDFileReader.h"
#import "ATDStreamAnalizer.h"
#import "ATDIndexer.h"

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

+(void) crawlXMLAtPath:(NSString *)fileName forIndexer:(ATDIndexer *)indexer {
    static const NSUInteger length = 1024;
    indexer.currFileName = fileName;
    ATDStreamAnalizer *analizer = [[ATDStreamAnalizer alloc] initWithDelegate:indexer];
    NSFileHandle *file = [NSFileHandle fileHandleForReadingAtPath:fileName];
    if (nil == file) {
        NSLog(@"Could not open file");
        return;
    }
    NSData *dataChunk;
    [file seekToEndOfFile];
    NSUInteger lengthOfFile = [file offsetInFile];
    NSUInteger offset = 0;
    while (offset < lengthOfFile) {
        @autoreleasepool {
            [file seekToFileOffset:offset];
            indexer.currOffset = offset;
            dataChunk = [file readDataOfLength:length];
            [analizer gotData:dataChunk formStream:file];
            offset += length;
        }
    }
    [analizer closedStream:file];
    [file closeFile];
}

@end
