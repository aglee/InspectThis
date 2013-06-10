//
//  ITAppDelegate.m
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITAppDelegate.h"
#import "ITDataWindowController.h"
#import "ITFloatingInspectorWindowController.h"

@implementation ITAppDelegate
{
	ITFloatingInspectorWindowController *_floatingInspectorWindowController;
	NSMutableArray *_dataWindowControllers;
}

- (void)dealloc
{
	// Just for completeness.  In practice we don't get dealloc'ed until the app
	// terminates (and maybe not even then), so this isn't really needed.
	[self _stopListeningForWindowClose];
}

#pragma mark Action methods

- (IBAction)openNewDataWindow:(id)sender
{
	ITWindowWithInspectorsWindowController *wc = [[ITDataWindowController alloc] initWithWindowNibName:@"DataWindow"];

	[_dataWindowControllers addObject:wc];
	[wc showWindow:nil];
}

- (IBAction)showFloatingInspectorWindow:(id)sender
{
	[_floatingInspectorWindowController showWindow:nil];
}

#pragma mark NSApplicationDelegate methods

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Initialize ivars.
	_floatingInspectorWindowController = [[ITFloatingInspectorWindowController alloc] initWithWindowNibName:@"FloatingInspectorWindow"];
	_dataWindowControllers = [[NSMutableArray alloc] init];

	// Handle the notification whenever a window closes.
	[self _startListeningForWindowClose];

	// Display initial windows.
	[self openNewDataWindow:nil];
	[self showFloatingInspectorWindow:nil];
}

#pragma mark Private methods

- (void)_startListeningForWindowClose
{
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(_handleWindowWillCloseNotification:)
												 name:NSWindowWillCloseNotification
											   object:nil];
}

- (void)_stopListeningForWindowClose
{
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:NSWindowWillCloseNotification
												  object:nil];
}

- (void)_handleWindowWillCloseNotification:(NSNotification *)notif
{
	id windowDelegate = [(NSWindow *)[notif object] delegate];

	if ([windowDelegate isKindOfClass:[ITDataWindowController class]])
	{
		[_dataWindowControllers performSelector:@selector(removeObjectIdenticalTo:)
								 withObject:windowDelegate
								 afterDelay:0];
	}
}

@end
