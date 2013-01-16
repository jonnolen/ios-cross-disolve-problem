//
//  DTViewController.m
//  test_storyboard_render
//
//  Created by Jonathan Nolen on 1/15/13.
//  Copyright (c) 2013 Developertown. All rights reserved.
//

#import "DTViewController.h"
#import "DTCallbackViewController.h"
#import "DTSnapshotViewController.h"
#import "UIView+DTUtility.h"


@interface DTViewController (){
    BOOL hasShownSegue;
}

@end

@implementation DTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView * view = [UIView new];
    
    view.frame = self.view.bounds;
    view.backgroundColor = [UIColor colorWithWhite:.95 alpha:.7];

    NSLog(@"View Bounds: %@", NSStringFromCGRect(self.view.bounds));
    
    
    
    
    UIView *button = [self.view viewWithTag:100];
    
    [self.view insertSubview:view belowSubview:button];
    
    self.label.text = @"Hello!";
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (!hasShownSegue){
        [self performSegueWithIdentifier:@"modal.1.segue" sender:self];
        hasShownSegue = YES;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DTCallbackViewController *vc = segue.destinationViewController;
    
    vc.completionCallback = ^{
        [self dismissViewControllerAnimated:YES completion:^{
            DTCallbackViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"vc.2"];
            
            vc.completionCallback = ^{
                [self dismissViewControllerAnimated:YES completion:nil];
            };
            
            [self presentViewController:vc animated:YES completion:nil];
            
        }];
    };

}

-(IBAction)showSnapshot:(id)sender{
    DTSnapshotViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"snaphsot.vc"];
    
    vc.completionCallback = ^{[self dismissViewControllerAnimated:YES completion:nil];};
    vc.snapshot = [self.view viewSnapshot];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
