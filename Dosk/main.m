//
//  main.m
//  Dosk
//
//  Created by SpringHack on 2017/7/30.
//  Copyright © 2017年 Dosk. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "AppDelegate.h"


int main(int argc, char * argv[]) {
    @autoreleasepool {
        [[NSFileManager defaultManager] removeItemAtPath:@"/tmp/lark.png" error:nil];
        NSApplication * application = [NSApplication sharedApplication];
        NSMenu *mainMenu = [[NSMenu alloc] initWithTitle:@"Application"];
        [NSApp setMainMenu:mainMenu];
        [NSApp activateIgnoringOtherApps:YES];
        AppDelegate * appDelegate = [[AppDelegate alloc] init];
        [application setDelegate:appDelegate];
        [application run];
        return EXIT_SUCCESS;
    }
}
