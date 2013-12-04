//
//  ALSimpleInspectorPalette.m
//  InspectThis
//
//  Created by Andy Lee on 12/4/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ALSimpleInspectorPalette.h"

@implementation ALSimpleInspectorPalette

#pragma mark - ALInspectorPalette methods

- (void)reloadContainerView
{
	for (NSViewController *inspectorVC in [self inspectorViewControllers])
	{
		NSView *inspectorView = [inspectorVC view];
		NSRect inspectorFrame = [inspectorView frame];

		inspectorFrame.origin.x = 0;
		inspectorFrame.origin.y = [self _yCoordForNewInspectorWithHeight:inspectorFrame.size.height];
		inspectorFrame.size.width = [[self containerView] bounds].size.width;

		[inspectorView setFrame:inspectorFrame];
		[inspectorView setAutoresizingMask:(NSViewWidthSizable | NSViewMinYMargin)];

		[[self containerView] addSubview:inspectorView];
	}
}

- (void)unloadContainerView
{
	for (NSViewController *inspectorVC in [self inspectorViewControllers])
	{
		[[inspectorVC view] removeFromSuperview];
	}
}

#pragma mark Private methods

- (CGFloat)_yCoordForNewInspectorWithHeight:(CGFloat)heightOfNewInspector
{
	if ([[self containerView] isFlipped])
	{
		CGFloat yCoord = 0;

		for (NSView *subview in [[self containerView] subviews])
		{
			yCoord += [subview frame].size.height;
		}

		return yCoord;
	}
	else
	{
		CGFloat yCoord = NSMaxY([[self containerView] bounds]);

		for (NSView *subview in [[self containerView] subviews])
		{
			yCoord -= [subview frame].size.height;
		}

		return yCoord - heightOfNewInspector;
	}
}

@end
