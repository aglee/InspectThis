//
//  ITDataWindowController.m
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITDataWindowController.h"
#import "ITDataModel.h"
#import "ITDataView.h"
#import "ITMultiInspectorViewController.h"

@implementation ITDataWindowController
{
	NSMutableArray *_dataModels;
}

#pragma mark NSWindowController methods

- (void)windowDidLoad
{
	[super windowDidLoad];
	
	_dataModels = [[NSMutableArray alloc] init];
	[self _loadDataModels];

	[_dataModelsArrayController setContent:_dataModels];
	[_dataModelsArrayController setSelectionIndex:0];

	[[self window] recalculateKeyViewLoop];
}

#pragma mark NSTableViewDelegate methods

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
	NSInteger selectedRow = [(NSTableView *)[aNotification object] selectedRow];
	ITDataModel *selectedDataModel = [self _dataModelAtIndex:selectedRow];
	
	[_dataView setDataModel:selectedDataModel];
	[[self multiInspectorViewController] setObjectToInspect:selectedDataModel];
}

#pragma mark NSSplitViewDelegate methods

- (BOOL)splitView:(NSSplitView *)splitView shouldAdjustSizeOfSubview:(NSView *)subview
{
	// Only resize the middle pane (the data view), not the list pane or the
	// inspectors pane.
	return (subview == [splitView subviews][1]);
}

#pragma mark Private methods

// Add elements to the _dataModels array.
- (void)_loadDataModels
{
	[self _addDataModelWithProperties:(@{
									   @"backgroundColor": [NSColor redColor],
									   @"text": @"One"
									   })];
	[self _addDataModelWithProperties:(@{
									   @"backgroundColor": [NSColor greenColor],
									   @"text": @"Two"
									   })];
	[self _addDataModelWithProperties:(@{
									   @"backgroundColor": [NSColor blueColor],
									   @"text": @"Three"
									   })];
}

- (void)_addDataModelWithProperties:(NSDictionary *)props
{
	ITDataModel *dataModel = [[ITDataModel alloc] init];

	[dataModel setValuesForKeysWithDictionary:props];

	[_dataModels addObject:dataModel];
}

- (ITDataModel *)_dataModelAtIndex:(NSInteger)dataModelIndex
{
	if (dataModelIndex < 0
		|| dataModelIndex >= [_dataModels count])
	{
		return nil;
	}
	else
	{
		return _dataModels[dataModelIndex];
	}
}

@end
