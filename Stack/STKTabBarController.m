//
//  STKTabBarController.m
//  Stack
//
//  Created by Bradley Smith on 12/21/15.
//  Copyright © 2015 Brad Smith. All rights reserved.
//

#import "STKTabBarController.h"
#import "STKFeedViewController.h"
#import "STKBookmarksViewController.h"

#import "STKAnalyticsManager.h"
#import "UIView+STKShadow.h"

@interface STKTabBarController () <UITabBarControllerDelegate>

@end

@implementation STKTabBarController

#pragma mark - Lifecycle

- (instancetype)init {
    self = [super init];

    if (self) {
        [self setupViewControllers];
        [self.tabBar stk_setupShadow];
    }

    return self;
}

#pragma mark - Setup

- (void)setupViewControllers {
    STKFeedViewController *feedViewController = [[STKFeedViewController alloc] init];
    STKNavigationController *feedNavigationController = [[STKNavigationController alloc] initWithRootViewController:feedViewController];

    STKBookmarksViewController *bookmarksViewController = [[STKBookmarksViewController alloc] init];
    STKNavigationController *bookmarksNavigationController = [[STKNavigationController alloc] initWithRootViewController:bookmarksViewController];

//    STKSettingsViewModel *settingsViewModel = [[STKSettingsViewModel alloc] init];
//    STKSettingsViewController *settingsViewController = [[STKSettingsViewController alloc] initWithViewModel:settingsViewModel];
//    STKNavigationController *settingsNavigationController = [[STKNavigationController alloc] initWithRootViewController:settingsViewController];

    [self setViewControllers:@[feedNavigationController, bookmarksNavigationController] animated:YES];
}

#pragma mark - Tab Bar Controller Delegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSUInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    if (index != NSNotFound) {
        switch (index) {
            case 0:
                [STKAnalyticsManager logEventDidClickFeedTab];
                break;

            case 1:
                [STKAnalyticsManager logEventDidClickBookmarksTab];
                break;

            case 2:
                [STKAnalyticsManager logEventDidClickSettingsTab];
                break;
        }
    }
}

@end
