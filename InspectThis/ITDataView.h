//
//  ITDataView.h
//  InspectThis
//
//  Created by Andy Lee on 6/9/13.
//  Copyright (c) 2013 Andy Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ITDataModel;

/*!
 * Draws the data given by an ITDataModel.  Observes changes to dataModel's
 * properties and redraws automatically when they change.
 */
@interface ITDataView : NSView

@property (nonatomic, strong) ITDataModel *dataModel;

@end
