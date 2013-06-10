//
//  ITFloatingInspectorWindowController.m
//  InspectThis
//
//  Created by Andy Lee on 6/10/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITFloatingInspectorWindowController.h"
#import "ITDataWindowController.h"
#import "ITMultiInspectorViewController.h"

@interface ITFloatingInspectorWindowController ()
/*! The main window's multi-inspector view controller. */
@property (strong) ITMultiInspectorViewController *mainMultiInspectorViewController;
@end

@implementation ITFloatingInspectorWindowController

- (void)dealloc
{
	[self _stopWatchingForChangesToObjectToInspect];
}

#pragma mark NSWindowController methods

- (void)windowDidLoad
{
	[super windowDidLoad];

	[self _startWatchingForChangesToObjectToInspect];
}

#pragma mark NSKeyValueObserving methods

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context
{
	if ([keyPath isEqualToString:@"mainWindow"])
	{
		id windowDelegate = [[NSApp mainWindow] delegate];

		if ([windowDelegate isKindOfClass:[ITDataWindowController class]])
		{
			[self setMainMultiInspectorViewController:[(ITDataWindowController *)windowDelegate multiInspectorViewController]];
		}
		else
		{
			[self setMainMultiInspectorViewController:nil];
		}
	}
	else
	{
		id objectToInspect = [[self mainMultiInspectorViewController] objectToInspect];

		[[self multiInspectorViewController] setObjectToInspect:objectToInspect];
	}
}

#pragma mark Private methods

- (void)_startWatchingForChangesToObjectToInspect
{
	[NSApp addObserver:self
			forKeyPath:@"mainWindow"
			   options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
			   context:NULL];
	[self addObserver:self
		   forKeyPath:@"mainMultiInspectorViewController.objectToInspect"
			  options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
			  context:NULL];
}

- (void)_stopWatchingForChangesToObjectToInspect
{
	[NSApp removeObserver:self
			   forKeyPath:@"mainWindow"
				  context:NULL];
	[self removeObserver:self
			  forKeyPath:@"mainContainerViewController.objectToInspect"
				 context:NULL];
}

@end
