//
//  AppDelegate.m
//  Dosk
//
//  Created by SpringHack on 2017/7/30.
//  Copyright © 2017年 Dosk. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    NSMetadataQuery *query;
}

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

-(void)doAQuery {
    query = [[NSMetadataQuery alloc] init];
    //[query setSearchScopes: @[@"/Applications"]];  // If you want to find applications only in /Applications folder
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"kMDItemContentType == 'com.apple.application-bundle'"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(queryDidFinishGathering:) name:NSMetadataQueryDidFinishGatheringNotification object:nil];
    [query setPredicate:predicate];
    [query startQuery];
}

-(void)queryDidFinishGathering:(NSNotification *)notif {
    int i = 0;
    for(i = 0; i< query.resultCount; i++ ){
        NSLog(@"%@", [[query resultAtIndex:i] valueForAttribute:[NSString stringWithFormat:@"%@", kMDItemDisplayName]]);
    }
}

@end
