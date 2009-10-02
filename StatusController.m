//
//  StatusController.m
//  StatusItemCrash
//
//  Created by Michael Harper on 10/1/09.
//  Copyright 2009 Standalone Code LLC. All rights reserved.
//

#import "StatusController.h"


@implementation StatusController

@synthesize statusMenu;
@synthesize status;
@synthesize statusMenuItem;
@synthesize cycleThread;
@synthesize menuOpen;

-(void) awakeFromNib
{
  [self createStatusMenu];
}

-(void) createStatusMenu
{
  NSStatusBar *bar = [NSStatusBar systemStatusBar];
  
  statusMenuItem = [bar statusItemWithLength:NSVariableStatusItemLength];
  [statusMenuItem retain];
  [statusMenuItem setHighlightMode:YES];
  [statusMenuItem setMenu:statusMenu];
  [statusMenuItem setTitle:@"Crash"];
  menuOpen = NO;
}

-(void) cycleStatus:(id) ignore
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  // Loop until thread is cancelled, setting the status item and sleeping.
  NSString *completeTitle = @"12345678901234567890";
  NSInteger titleLength = 2;
  while (![[NSThread currentThread] isCancelled])
  {
    if (!menuOpen)
    {
      [status setTitle:[completeTitle substringToIndex:titleLength]];
      titleLength = (titleLength + 2) % 20;
      NSLog(@"Set Status");
    }
    NSLog(@"Sleeping");
    [NSThread sleepForTimeInterval:2.0];
  }
  
  NSLog(@"Cancelled.");
  [pool release];
}

-(IBAction) cycleAction:(id) sender;
{
  cycleThread = [[NSThread alloc] initWithTarget:self selector:@selector(cycleStatus:) object:nil];
  [cycleThread start];
}

-(IBAction) stopCycleAction:(id) sender;
{
  if (cycleThread != nil)
  {
    [cycleThread cancel];
    [cycleThread release];
    cycleThread = nil;
  }
}

-(IBAction) quitAction:(id) sender;
{
  [[NSApplication sharedApplication] terminate:self];
}

-(void) menuWillOpen:(NSMenu *) menu
{
  menuOpen = YES;
}

-(void) menuDidClose:(NSMenu *) menu
{
  menuOpen = NO;
}

@end
