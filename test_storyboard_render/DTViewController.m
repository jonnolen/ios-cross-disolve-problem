//
//  DTViewController.m
//  test_storyboard_render
//
//  Created by Jonathan Nolen on 1/15/13.
//  Copyright (c) 2013 Developertown. All rights reserved.
//

#import "DTViewController.h"
#import "DTCallbackViewController.h"
@interface DTViewController (){
    BOOL hasShownSegue;
}

@end

@implementation DTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView * view = [UIView new];
    
    view.frame = self.view.bounds;
    view.backgroundColor = [UIColor colorWithWhite:.95 alpha:.7];
//    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    NSLog(@"View Bounds: %@", NSStringFromCGRect(self.view.bounds));
    
    [self.view addSubview:view];
//    self.view.backgroundColor = [UIColor orangeColor];
    
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
