//
//  ViewController.m
//  MyProject
//
//  Created by Alexey Sinitsa on 05.08.15.
//  Copyright (c) 2015 IdeasWorld. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "JVMenuPopover.h"
#import "SecondController.h"
#import "MenuController.h"

@interface ViewController () <UINavigationControllerDelegate, JVMenuPopoverViewControllerDelegate>{
    LeftMenuController *leftMenu;
    MainViewController *mainController;
    SecondController *secondController;
}

@property (strong, nonatomic) JVMenuPopoverViewController *menuController;


@end

@implementation ViewController
- (JVMenuPopoverViewController *)menuController
{
    if(!_menuController)
    {
        _menuController = [[JVMenuPopoverViewController alloc] initWithImages:@[[UIImage imageNamed:@"icon_Expences"],
                                                                                [UIImage imageNamed:@"icon_History"],
                                                                                [UIImage imageNamed:@"icon_setting"],
                                                                                [UIImage imageNamed:@"icon_Summary"]]
                                                                       titles:@[@"Home",
                                                                                @"About Us",
                                                                                @"Our Service",
                                                                                @"Contact Us"]
                                                                   closeImage:[UIImage imageNamed:@"icon_Summary"]];
        _menuController.delegate = self;
        _menuController.slideInWithBounceAnimation = YES; // choose our animation type
    }
    
    return _menuController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (IBAction)menuAction:(id)sender{
    NSLog(@"menu action");
    [self performSegueWithIdentifier:@"toMain" sender:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.delegate = self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_Summary"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
}
- (void)showMenu
{
    [self.menuController showMenuFromController:self];
}

// closing menu when close button is pressed
- (void)closeMenu:(JVMenuPopoverViewController *)JVMenuPopoverViewController
{
    [self.navigationController popToViewController:JVMenuPopoverViewController animated:NO];
}

// setting the view controllers to be presented
- (void)setNewViewController:(UINavigationController *)navController fromIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        mainController = [[MainViewController alloc] init];
//        [self.navigationController setViewControllers:@[mainController]];
        [self.navigationController pushViewController:mainController animated:YES];
    }
    else if(indexPath.row == 1)
    {
        secondController = [[SecondController alloc] init];
        [self.navigationController setViewControllers:@[secondController]];

    }
}
@end
