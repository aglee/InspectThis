//
//  ITMultiInspectorViewController.h
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*!
 * Manages a "multi-inspector view", which is a container view for subviews
 * called "inspectors".
 *
 * This class supports the "inspector" UI pattern that is used in many Cocoa
 * apps.  An inspector contains controls that are used to view and modify
 * properties of some object, which we call the "object to inspect".  You can
 * see this UI pattern in Xcode, OmniGraffle, Keynote, and many other apps.
 *
 * Each inspector's view controller has its representedObject set to the object
 * to inspect.  This allows controls within the inspector to bind to key paths
 * relative to that object.
 *
 * At any time we can specify a different object to inspect, whereupon all the
 * inspectors change to inspect the new object.
 *
 * Each inspector must have an associated view controller.  To add an inspector,
 * send addInspectorWithViewController: with its view controller.
 *
 * It is often possible to use a plain, unsubclassed NSViewController as an
 * inspector's view controller.  In the inspector's nib file, there will be
 * controls within the inspector view, and bindings between those controls and
 * FilesOwner.representedObject.someKeyPath.
 *
 * The container view can be any view.  It can be the same as [self view], but
 * does not have to be.
 */
@interface ITMultiInspectorViewController : NSViewController

/*!
 * When this changes, every inspector view controller's representedObject is set
 * to the new value.
 */
@property (nonatomic, strong) id objectToInspect;

@property (weak) IBOutlet NSView *containerView;

- (void)addInspectorWithViewController:(NSViewController *)inspectorVC;

@end
