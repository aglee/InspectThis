//
//  ITWindowWithInspectorsWindowController.h
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ALInspectorPaletteDelegate.h"

@class ALInspectorPalette;

/*!
 * Abstract base class.  Manages a window that contains an inspector palette.
 * Every instance has the same set of inspectors.
 */
@interface ITWindowWithInspectorsWindowController : NSWindowController <ALInspectorPaletteDelegate>

@property (strong) IBOutlet ALInspectorPalette *inspectorPalette;

@end
