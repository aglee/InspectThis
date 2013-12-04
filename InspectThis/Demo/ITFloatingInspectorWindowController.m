//
//  ITFloatingInspectorWindowController.m
//  InspectThis
//
//  Created by Andy Lee on 6/10/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITFloatingInspectorWindowController.h"
#import "ITDataWindowController.h"
#import "ALInspectorPalette.h"

static void *ALMainWindowKVOContext = &ALMainWindowKVOContext;
static void *ALObjectToInspectKVOContext = &ALObjectToInspectKVOContext;

@interface ITFloatingInspectorWindowController ()
@property (strong) ALInspectorPalette *inspectorPaletteToMirror;
@end

@implementation ITFloatingInspectorWindowController

- (void)dealloc
{
	[self _stopWatchingForChangesToObjectToInspect];
	[self _stopWatchingForChangesToMainWindow];
}

#pragma mark NSWindowController methods

- (void)windowDidLoad
{
	[super windowDidLoad];

	[self _startWatchingForChangesToMainWindow];
}

#pragma mark NSKeyValueObserving methods

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context
{
	if (context == ALMainWindowKVOContext)
	{
		ALInspectorPalette *inspectorPaletteToMirror = [self _inspectorPaletteOfMainWindow];

		[self _stopWatchingForChangesToObjectToInspect];
		[self setInspectorPaletteToMirror:inspectorPaletteToMirror];
		[self _startWatchingForChangesToObjectToInspect];
	}
	else if (context == ALObjectToInspectKVOContext)
	{
		[[self inspectorPalette] setObjectToInspect:change[NSKeyValueChangeNewKey]];
	}
	else
	{
		[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
	}
}

#pragma mark Private methods

- (ALInspectorPalette *)_inspectorPaletteOfMainWindow
{
	id windowDelegate = [[NSApp mainWindow] delegate];

	if ([windowDelegate isKindOfClass:[ITDataWindowController class]])
	{
		return [(ITDataWindowController *)windowDelegate inspectorPalette];
	}
	else
	{
		return nil;
	}
}

- (void)_startWatchingForChangesToMainWindow
{
	[NSApp addObserver:self
			forKeyPath:@"mainWindow"
			   options:(NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew)
			   context:ALMainWindowKVOContext];
}

- (void)_stopWatchingForChangesToMainWindow
{
	[NSApp removeObserver:self
			   forKeyPath:@"mainWindow"
				  context:ALMainWindowKVOContext];
}

- (void)_startWatchingForChangesToObjectToInspect
{
	[[self inspectorPaletteToMirror] addObserver:self
									  forKeyPath:@"objectToInspect"
										 options:(NSKeyValueObservingOptionInitial
												  | NSKeyValueObservingOptionNew)
										 context:ALObjectToInspectKVOContext];
}

- (void)_stopWatchingForChangesToObjectToInspect
{
	[[self inspectorPaletteToMirror] removeObserver:self
										 forKeyPath:@"objectToInspect"
											context:ALObjectToInspectKVOContext];
}

@end
