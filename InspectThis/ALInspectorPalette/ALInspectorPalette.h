//
//  ITMultiInspectorViewController.h
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ALInspectorPaletteDelegate.h"

/*!
 * Abstract base class that manages a collection of views called "inspectors".
 * The inspectors are all contained in the inspector palette's containerView.
 *
 * An inspector contains controls that are used to view and modify properties of
 * the palette's objectToInspect.  Whenever objectToInspect changes, two things
 * happen:
 *
 * - The inspectors may be swapped out for a different set of inspectors that
 *   is appropriate for the new objectToInspect.  The delegate has methods to
 *   handle this.
 *
 * - The representedObject of every inspector's view controller is set to the
 *   new objectToInspect.
 *
 * If the controls within an inspector have bindings to representedObject, they
 * will automatically reflect the change.  This means you can often use a plain
 * NSViewController for the inspectors, because no glue code is needed.
 *
 * Inspectors -- or more precisely, their view controllers -- must be registered
 * with the inspector palette.  This can be done by the delegate, or you can
 * omit the delegate and register the inspectors yourself.  One reason to
 * register them yourself would be if there is one fixed set of inspectors that
 * will never need to be swapped out regardless of the objectToInspect.
 *
 * Inspector views are not necessarily direct subviews of the container view,
 * nor is the container view necessarily a plain NSView; it could be an outline
 * view, for example.  Concrete subclasses of ALInspectorPalette must implement
 * reloadContainerView and unloadContainerView to add and remove inspector views
 * from the view hierarchy.
 */
@interface ALInspectorPalette : NSObject

/*!
 * When this changes, every inspector view controller's representedObject is set
 * to the new value.
 */
@property (nonatomic, weak) id objectToInspect;

@property (readonly) NSArray *inspectorViewControllers;

@property (nonatomic, weak) IBOutlet id<ALInspectorPaletteDelegate> delegate;

@property (nonatomic, strong) IBOutlet NSView *containerView;

/*!
 * Used only for error checking.  When the containerView outlet is set, an
 * exception will be thrown if it is not an instance of this class.  Returns
 * NSView by default.  Subclasses can optionally override this for stronger
 * error checking if they expect a different class.
 */
+ (Class)classForContainerView;

/*!
 * Adds the view controller to the receiver's internal array.  Does not modify
 * the view hierarchy.
 */
- (void)addInspectorViewController:(NSViewController *)inspectorVC;

/*!
 * Removes all inspector view controllers from the receiver's internal array.
 * Does not modify the view hiearchy.
 */
- (void)removeAllInspectorViewControllers;

/*!
 * Subclasses must override this method.
 *
 * Assumes there are no inspectors in the container view.  Gets inspector views
 * from all the view controllers in the internal array and adds them to the
 * container view.
 */
- (void)reloadContainerView;

/*!
 * Subclasses must override this method.
 *
 * Removes all inspectors from the container view.
 */
- (void)unloadContainerView;

@end
