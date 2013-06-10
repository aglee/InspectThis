//
//  ITWindowWithInspectorsWindowController.h
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ITMultiInspectorViewController;

/*!
 * Abstract base class.  Manages a window that contains a "multi-inspector view"
 * as defined by ITMultiInspectorViewController.  Every instance has the same
 * set of inspectors.
 */
@interface ITWindowWithInspectorsWindowController : NSWindowController

@property (strong) IBOutlet ITMultiInspectorViewController *multiInspectorViewController;

@end
