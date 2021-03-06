//
//  ITWindowWithInspectorsWindowController.m
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITWindowWithInspectorsWindowController.h"
#import "ALInspectorPalette.h"

@implementation ITWindowWithInspectorsWindowController

#pragma mark - ALInspectorPaletteDelegate methods

- (void)addInspectorsToInspectorPalette:(ALInspectorPalette *)inspectorPalette
{
	[self _addInspectorWithNibName:@"TextInspector"];
	[self _addInspectorWithNibName:@"FontColorInspector"];
	[self _addInspectorWithNibName:@"BackgroundColorInspector"];
}

#pragma mark Private methods

- (void)_addInspectorWithNibName:(NSString *)nibName
{
	NSViewController *inspectorVC = [[NSViewController alloc] initWithNibName:nibName bundle:nil];

	[[self inspectorPalette] addInspectorViewController:inspectorVC];
}

@end
