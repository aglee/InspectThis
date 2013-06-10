//
//  ITDataWindowController.h
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import "ITWindowWithInspectorsWindowController.h"

@class ITDataView;

@interface ITDataWindowController : ITWindowWithInspectorsWindowController

@property (weak) IBOutlet ITDataView *dataView;
@property (strong) IBOutlet NSArrayController *dataModelsArrayController;

@end
