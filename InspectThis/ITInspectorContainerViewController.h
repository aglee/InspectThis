//
//  ITInspectorContainerViewController.h
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/*!
 * Manages a view, called the "container view", that contains subviews called
 * "inspectors".  It's assumed the inspector views implement the "inspector" UI
 * pattern that is common throughout Cocoa apps.  Inspectors contain controls
 * that are used to view and possibly modify values associated with some object,
 * called the "object to inspect".  At any time we can specify a different
 * object to inspect, whereupon all the inspectors change to inspect the new
 * object.
 *
 * You can see this UI pattern in Xcode, OmniGraffle, Keynote, and many other
 * Cocoa apps.
 *
 * Each inspector must have an associated view controller.  To add an inspector,
 * send addInspectorWithViewController: with the inspector's view controller.
 * The inspector will be added as a subview of the container view, and its view
 * controller's representedObject will be set to objectToInspect.  If you set a
 * different objectToInspect, every inspector's view controller will have its
 * representedObject changed to the new objectToInspect.
 *
 * It may often be possible to use a plain, unsubclassed NSViewController as an
 * inspector's view controller.  In the inspector's nib file, there will be
 * controls within the inspector view, and bindings between those controls and
 * FilesOwner.representedObject.someKeyPath.
 *
 * The container view can be any view.  It can be the same as [self view], but
 * does not have to be.
 */
@interface ITInspectorContainerViewController : NSViewController

/*!
 * When this changes, every inspector view controller's representedObject is set
 * to the new value.
 */
@property (nonatomic, strong) id objectToInspect;

@property (weak) IBOutlet NSView *containerView;

- (void)addInspectorWithViewController:(NSViewController *)inspectorVC;

@end
