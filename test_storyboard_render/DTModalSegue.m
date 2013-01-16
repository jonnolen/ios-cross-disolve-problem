//
//  DTModalSegue.m
//  test_storyboard_render
//
//  Created by Jonathan Nolen on 1/15/13.
//  Copyright (c) 2013 Developertown. All rights reserved.
//

#import "DTModalSegue.h"

@implementation DTModalSegue


-(void)perform{
    [self.sourceViewController presentViewController:self.destinationViewController animated:YES completion:nil];
}
@end
