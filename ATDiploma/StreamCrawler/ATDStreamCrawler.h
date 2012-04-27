//
//  ATDStreamCrawler.h
//  ATDiploma
//
//  Created by Andrii Titov on 4/26/12.
//  Copyright (c) 2012 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ATDStreamCrawler <NSObject>

@required
-(void)gotData:(NSData *)data formStream:(id)StreamHandler;


@optional
-(void)openedStream:(id)streamHandler;

-(void)closedStream:(id)streamHandler;


@end
