//
//  StatusController.h
//  StatusItemCrash
//
//  Created by Michael Harper on 10/1/09.
//  Copyright 2009 Standalone Code LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface StatusController : NSObject <NSMenuDelegate>
{
  IBOutlet NSMenu *statusMenu;
  IBOutlet NSMenuItem *status;
  NSStatusItem *statusMenuItem;
  NSThread *cycleThread;
  BOOL menuOpen;
}

@property (nonatomic, retain) NSMenu *statusMenu;
@property (nonatomic, retain) NSMenuItem *status;
@property (nonatomic, retain) NSStatusItem *statusMenuItem;
@property (nonatomic, retain) NSThread *cycleThread;
@property (nonatomic) BOOL menuOpen;

-(void) createStatusMenu;
-(void) cycleStatus:(id) ignore;
-(IBAction) cycleAction:(id) sender;
-(IBAction) stopCycleAction:(id) sender;
-(IBAction) quitAction:(id) sender;

@end
