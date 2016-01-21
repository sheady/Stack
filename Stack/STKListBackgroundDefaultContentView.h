//
//  STKListBackgroundDefaultContentView.h
//  Stack
//
//  Created by Bradley Smith on 12/25/15.
//  Copyright © 2015 Brad Smith. All rights reserved.
//

@import UIKit;

#import "STKListBackgroundView.h"

@class STKListBackgroundDefaultContentView;

@protocol STKListBackgroundDefaultContentViewDelegate <NSObject>

- (void)listBackgroundDefaultContentView:(STKListBackgroundDefaultContentView *)contentView didTapActionButtonWithState:(STKListBackgroundViewState)state;

@end

@interface STKListBackgroundDefaultContentView : UIView <STKListBackgroundContentViewProtocol>

- (UIImage *)imageForState:(STKListBackgroundViewState)state;
- (NSString *)titleForState:(STKListBackgroundViewState)state;
- (NSString *)messageForState:(STKListBackgroundViewState)state;
- (NSString *)actionTitleForState:(STKListBackgroundViewState)state;

- (void)setImage:(UIImage *)image forState:(STKListBackgroundViewState)state;
- (void)setTitle:(NSString *)title forState:(STKListBackgroundViewState)state;
- (void)setMessage:(NSString *)message forState:(STKListBackgroundViewState)state;
- (void)setActionTitle:(NSString *)actionTitle forState:(STKListBackgroundViewState)state;

@property (weak, nonatomic) id <STKListBackgroundDefaultContentViewDelegate> delegate;

@end
