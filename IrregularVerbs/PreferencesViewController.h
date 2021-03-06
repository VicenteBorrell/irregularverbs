//
//  PreferencesViewController.h
//  IrregularVerbs
//
//  Created by Oswaldo Rubio on 20/12/12.
//  Copyright (c) 2012 Oswaldo Rubio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PreferencesViewController;

@protocol PreferencesViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(PreferencesViewController *)controller;
@end

@interface PreferencesViewController : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *aboutLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;
@property (weak, nonatomic) IBOutlet UIButton *buttonAbout;

- (IBAction)clearStatistics:(UIButton *)sender;
- (IBAction)showAboutLink:(id)sender;
@end
