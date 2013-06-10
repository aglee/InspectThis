//
//  ITWindowController.h
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ITInspectorContainerViewController;

/*!
 * Abstract base class.  Manages a window that contains a "multi-inspector view"
 * as defined by ITInspectorContainerViewController.
 */
@interface ITWindowWithInspectorsWindowController : NSWindowController

@property (strong) IBOutlet ITInspectorContainerViewController *inspectorContainerViewController;

@end
