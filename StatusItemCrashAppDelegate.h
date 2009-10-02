//
//  StatusItemCrashAppDelegate.h
//  StatusItemCrash
//
//  Created by Michael Harper on 10/1/09.
//  Copyright 2009 Standalone Code LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StatusItemCrashAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
