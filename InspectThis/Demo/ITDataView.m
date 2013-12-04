//
//  ITDataView.m
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITDataView.h"
#import "ITDataModel.h"

@implementation ITDataView

- (void)dealloc
{
	[self _stopObservingModelProperties];
}

#pragma mark Getters and setters

- (void)setDataModel:(ITDataModel *)dataModel
{
	if (_dataModel != dataModel)
	{
		[self _stopObservingModelProperties];
		_dataModel = dataModel;
		[self _startObservingModelProperties];

		[self setNeedsDisplay:YES];
	}
}

#pragma mark NSView methods

// Being flipped makes the code a tiny bit simpler for drawing the text in the
// top left corner.
- (BOOL)isFlipped
{
	return YES;
}

- (void)drawRect:(NSRect)dirtyRect
{
	if (_dataModel == nil)
	{
		[[NSColor lightGrayColor] set];
		NSRectFill(dirtyRect);
	}
	else
	{
		[[_dataModel backgroundColor] set];
		NSRectFill(dirtyRect);

		[[_dataModel text] drawAtPoint:NSZeroPoint
						withAttributes:(@{
										NSFontAttributeName: [NSFont fontWithName:@"Georgia" size:48],
										NSForegroundColorAttributeName: ([_dataModel fontColor] ?: [NSColor blackColor])
										})];
	}
}

#pragma mark NSKeyValueObserving methods

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context
{
	[self setNeedsDisplay:YES];
}

#pragma mark Private methods

- (NSArray *)_modelPropertiesToObserve
{
	return @[ @"text", @"backgroundColor", @"fontColor" ];
}

- (void)_startObservingModelProperties
{
	for (NSString *propertyName in [self _modelPropertiesToObserve])
	{
		[_dataModel addObserver:self
					 forKeyPath:propertyName
						options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
						context:NULL];
	}
}

- (void)_stopObservingModelProperties
{
	for (NSString *propertyName in [self _modelPropertiesToObserve])
	{
		[_dataModel removeObserver:self
						forKeyPath:propertyName
						   context:NULL];
	}
}

@end
