//
//  DTViewController.h
//  test_storyboard_render
//
//  Created by Jonathan Nolen on 1/15/13.
//  Copyright (c) 2013 Developertown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *label;

-(IBAction)showSnapshot:(id)sender;
@end
