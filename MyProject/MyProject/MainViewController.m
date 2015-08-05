//
//  MainViewController.m
//  MyProject
//
//  Created by Alexey Sinitsa on 05.08.15.
//  Copyright (c) 2015 IdeasWorld. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController() <UINavigationControllerDelegate>{

}

@end

@implementation MainViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)menuAction:(id)sender {
}

-(void) backAction {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
