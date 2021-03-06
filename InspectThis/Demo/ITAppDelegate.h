//
//  ITAppDelegate.h
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ITAppDelegate : NSObject <NSApplicationDelegate>

#pragma mark Action methods

- (IBAction)openNewDataWindow:(id)sender;
- (IBAction)showFloatingInspectorWindow:(id)sender;

@end
