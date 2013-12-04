//
//  ALInspectorPaletteDelegate.h
//  InspectThis
//
//  Created by Andy Lee on 12/4/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALInspectorPalette;

@protocol ALInspectorPaletteDelegate <NSObject>

#pragma mark - Required methods
@required

/*!
 * Assumes the inspector palette has no inspectors.  Registers all inspectors
 * appropriate for the palette's objectToInspect.
 *
 * When implementing this, remember to handle the case where the objectToInspect
 * is nil.
 */
- (void)registerInspectorsForInspectorPalette:(ALInspectorPalette *)inspectorPalette;

#pragma mark - Optional methods
@optional

/*!
 * Called when the inspector palette is about to change its objectToInspect.
 * Returns YES if the change requires the inspectors to be reloaded.  If the
 * palette has a delegate but this method is not implemented, the answer will be
 * assumed to be YES.
 *
 * When implementing this, remember to handle the case where either of the
 * objects is nil.
 */
- (BOOL)inspectorPalette:(ALInspectorPalette *)inspectorPalette
   shouldReloadForObject:(id)newObjectToInspect
			   oldObject:(id)oldObjectToInspect;

@end
