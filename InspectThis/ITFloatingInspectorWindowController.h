//
//  ITFloatingInspectorWindowController.h
//  InspectThis
//
//  Created by Andy Lee on 6/10/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITWindowWithInspectorsWindowController.h"

/*!
 * Sets its objectToInspect to match the application's main window, if that
 * window is a "data window" in the sense defined by ITDataWindowController.
 *
 * Note that in FloatingInspectorWindow.xib the window is an NSPanel instead of
 * an NSWindow, so that it can't become the main window.
 */
@interface ITFloatingInspectorWindowController : ITWindowWithInspectorsWindowController

@end
