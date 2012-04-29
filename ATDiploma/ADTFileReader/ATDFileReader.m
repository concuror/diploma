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
    [file seekToEndOfFile];
    NSUInteger lengthOfFile = [file offsetInFile];
    NSUInteger offset = 0;
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    while (offset < lengthOfFile) {
        [file seekToFileOffset:offset];
        dataChunk = [file readDataOfLength:length];
        [analizer gotData:dataChunk formStream:file];
        offset += length;
        [pool drain];
    }
    [pool release];
}

@end
