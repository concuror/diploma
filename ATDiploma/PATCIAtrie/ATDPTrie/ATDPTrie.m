//
//  ATDPTrie.m
//  ATDiploma
//
//  Created by Andrii Titov on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ATDPTrie.h"
#import "ATDPNode.h"

@implementation ATDPTrie

-(id)init {
    self = [super init];
    if (self) {
        _root = [[ATDPNode alloc] initWithLabel:@""];
    }
    return self;
}

-(NSInteger) matchConsecutiveChars:(NSString *)word inNode:(ATDPNode *)node {
    
}

-(void) insertWord:(NSString *)wordPart inNode:(ATDPNode *)node {
    
}

-(NSString *)findSuccessor:(NSString *)wordPart inNode:(ATDPNode *)node withCarry:(NSString *)carry {
    return nil;
}

-(NSString *)findPredecessor:(NSString *)wordPart inNode:(ATDPNode *)node withCarry:(NSString *)carry {
    return nil;
}

-(BOOL)lookupWord:(NSString *)wordPart inNode:(ATDPNode *)node {
    return YES;
}

-(void) deleteWord:(NSString *)wordPart inNode:(ATDPNode *)node {
    
}

-(void) insertWord:(NSString *)word {
    [self insertWord:word inNode:_root];
}

-(NSString *)findSuccessor:(NSString *)word {
    return [self findSuccessor:word inNode:_root withCarry:@""];
}

-(NSString *)findPredecessor:(NSString *)word {
    return [self findPredecessor:word inNode:_root withCarry:@""];
}

-(BOOL)lookupWord:(NSString *)word {
    return [self lookupWord:word inNode:_root];
}

-(void) deleteWord:(NSString *)label {
    [self deleteWord:label inNode:_root];
}

-(void) dealloc {
    [_root release];
    [super dealloc];
}

@end
