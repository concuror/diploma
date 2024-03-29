//
//  ATDPTrie.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ATDPNode;

@interface ATDPTrie : NSObject<NSCoding> {
    
    ATDPNode *_root;
    
}

-(void) insertWord:(NSString *)word;

-(NSString *)findSuccessor:(NSString *)word;

-(NSString *)findPredecessor:(NSString *)word;

-(BOOL)lookupWord:(NSString *)word;

-(void) deleteWord:(NSString *)label;

-(void) addValue:(NSObject *)value forKey:(NSString *)key;

-(ATDPNode *)findNodeForKey:(NSString *)key;

-(void) saveTrieToFile:(NSString *)fileName;

-(void) loadFromFile:(NSString *)fileName;

-(NSUInteger) getTreeSize;

@end
