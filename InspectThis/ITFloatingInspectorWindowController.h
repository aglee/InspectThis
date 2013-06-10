//
//  ITFloatingInspectorWindowController.h
//  InspectThis
//
//  Created by Andy Lee on 6/10/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITWindowWithInspectorsWindowController.h"

/*!
 * Note that in FloatingInspectorWindow.xib our window is an NSPanel instead of
 * an NSWindow, so that it can't become the main window.
 */
@interface ITFloatingInspectorWindowController : ITWindowWithInspectorsWindowController

@end
