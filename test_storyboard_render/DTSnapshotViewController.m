//
//  DTSnapshotViewController.m
//  test_storyboard_render
//
//  Created by Jonathan Nolen on 1/15/13.
//  Copyright (c) 2013 Developertown. All rights reserved.
//

#import "DTSnapshotViewController.h"


@interface DTSnapshotViewController ()

@end

@implementation DTSnapshotViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.snapshotView.image = self.snapshot;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
