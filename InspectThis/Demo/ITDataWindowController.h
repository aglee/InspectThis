//
//  ITDataWindowController.h
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITWindowWithInspectorsWindowController.h"

@class ITDataView;

/*!
 * Manages a "data window".  Displays a list of ITDataModel objects that the
 * user can select from.  The selected data model is displayed in an ITDataView
 * and is set to the objectToInspect of our inspectors.
 */
@interface ITDataWindowController : ITWindowWithInspectorsWindowController

@property (weak) IBOutlet ITDataView *dataView;
@property (strong) IBOutlet NSArrayController *dataModelsArrayController;

@end
