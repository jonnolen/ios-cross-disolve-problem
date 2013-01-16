//
//  DTSnapshotViewController.h
//  test_storyboard_render
//
//  Created by Jonathan Nolen on 1/15/13.
//  Copyright (c) 2013 Developertown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTCallbackViewController.h"

@interface DTSnapshotViewController : DTCallbackViewController

@property (nonatomic, strong) UIImage *snapshot;

@property (nonatomic, strong) IBOutlet UIImageView *snapshotView;

@end
