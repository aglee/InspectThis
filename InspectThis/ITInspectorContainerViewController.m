//
//  ITInspectorContainerViewController.m
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITInspectorContainerViewController.h"

@implementation ITInspectorContainerViewController
{
	NSMutableArray *_inspectorViewControllers;
}

- (void)_commonInit
{
	_inspectorViewControllers = [[NSMutableArray alloc] init];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self)
	{
		[self _commonInit];
	}

	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
	{
		[self _commonInit];
	}

	return self;
}

- (void)addInspectorWithViewController:(NSViewController *)inspectorVC
{
	// Add the inspector's view controller to our list.
	[_inspectorViewControllers addObject:inspectorVC];

	// Add the inspector view to the view hierarchy.  We arrange the inspector
	// views in a column that fills the width of _containerView.
	NSView *inspectorView = [inspectorVC view];
	NSRect inspectorFrame = [inspectorView frame];

	inspectorFrame.origin.x = 0;
	inspectorFrame.origin.y = [self _yCoordForNewInspectorWithHeight:inspectorFrame.size.height];
	inspectorFrame.size.width = [_containerView bounds].size.width;

	[inspectorView setFrame:inspectorFrame];
	[inspectorView setAutoresizingMask:(NSViewWidthSizable | NSViewMinYMargin)];

	[_containerView addSubview:inspectorView];

	// Set the inspector view controller's representedObject.
	[inspectorVC setRepresentedObject:_objectToInspect];
}

#pragma mark Getters and setters

- (void)setObjectToInspect:(id)objectToInspect
{
	_objectToInspect = objectToInspect;

	for (NSViewController *vc in _inspectorViewControllers)
	{
		[vc setRepresentedObject:_objectToInspect];
	}
}

#pragma mark Private methods

- (CGFloat)_yCoordForNewInspectorWithHeight:(CGFloat)heightOfNewInspector
{
	if ([_containerView isFlipped])
	{
		CGFloat yCoord = 0;

		for (NSView *subview in [_containerView subviews])
		{
			yCoord += [subview frame].size.height;
		}

		return yCoord;
	}
	else
	{
		CGFloat yCoord = NSMaxY([_containerView bounds]);

		for (NSView *subview in [_containerView subviews])
		{
			yCoord -= [subview frame].size.height;
		}

		return yCoord - heightOfNewInspector;
	}
}

@end
