//
//  ALInspectorPalette.m
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ALInspectorPalette.h"

@implementation ALInspectorPalette
{
	NSMutableArray *_inspectorViewControllers;
}

- (id)init
{
	self = [super init];
	if (self)
	{
		_inspectorViewControllers = [[NSMutableArray alloc] init];
	}

	return self;
}

+ (Class)classForContainerView
{
	return [NSView class];
}

- (void)addInspectorViewController:(NSViewController *)inspectorVC
{
	[_inspectorViewControllers addObject:inspectorVC];
}

- (void)removeAllInspectorViewControllers
{
	[_inspectorViewControllers removeAllObjects];
}

- (void)reloadContainerView
{
	abort();  // [agl] throw a proper exception
}

- (void)unloadContainerView
{
	abort();  // [agl] throw a proper exception
}

#pragma mark Getters and setters

- (void)setObjectToInspect:(id)objectToInspect
{
	if ([self _shouldReloadInspectorsForNewObject:objectToInspect
										oldObject:_objectToInspect])
	{
		[self unloadContainerView];
		[self removeAllInspectorViewControllers];
		[[self delegate] registerInspectorsForInspectorPalette:self];
		[self reloadContainerView];
	}

	_objectToInspect = objectToInspect;

	for (NSViewController *vc in _inspectorViewControllers)
	{
		[vc setRepresentedObject:_objectToInspect];
	}
}

- (NSArray *)inspectorViewControllers
{
	return [_inspectorViewControllers copy];
}

- (void)setContainerView:(NSView *)containerView
{
	if (![containerView isKindOfClass:[[self class] classForContainerView]])
	{
		abort();  // [agl] throw a proper exception
	}

	_containerView = containerView;
}

#pragma mark - Private methods

- (BOOL)_shouldReloadInspectorsForNewObject:(id)newObjectToInspect
								  oldObject:(id)oldObjectToInspect
{
	if ([self delegate] == nil)
	{
		return NO;
	}

	if (![[self delegate] respondsToSelector:@selector(inspectorPalette:shouldReloadForObject:oldObject:)])
	{
		return YES;
	}

	return [[self delegate] inspectorPalette:self
					   shouldReloadForObject:newObjectToInspect
								   oldObject:oldObjectToInspect];
}

@end
