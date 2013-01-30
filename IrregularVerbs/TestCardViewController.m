//
//  TestCardViewController.m
//  IrregularVerbs
//
//  Created by Rafa Barberá Córdoba on 15/01/13.
//  Copyright (c) 2013 Oswaldo Rubio. All rights reserved.
//

#import "VerbsStore.h"
#import "Verb.h"
#import "TestCardViewController.h"
#import "TestProgressView.h"
#import "Referee.h"
#import  <QuartzCore/QuartzCore.h>

#define TEST_TIMER_INTERVAL 1/60.0f

@interface TestCardViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelSimple;
@property (weak, nonatomic) IBOutlet UILabel *labelTranslation;
@property (weak, nonatomic) IBOutlet UILabel *labelPast;
@property (weak, nonatomic) IBOutlet UILabel *labelParticiple;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UILabel *labelHint;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (nonatomic) CGRect simpleFrame;

@property (nonatomic) BOOL useHintsInTest;

@end

@implementation TestCardViewController


#pragma mark - View lifecicle

- (void)viewDidLoad {
    self.backgroundView.backgroundColor = [UIColor clearColor];
    self.backgroundView.image = [imgHomebuttonwochevron resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4)
                                                              resizingMode:UIImageResizingModeStretch];
    self.simpleFrame = self.labelSimple.frame;
}

- (void)viewWillAppear:(BOOL)animated {
    [self refreshUIForTestEnd:NO];
    self.labelHint.alpha = 0;
    self.useHintsInTest = [[NSUserDefaults standardUserDefaults] boolForKey:@"hintsInTest"];
    if ([self.delegate respondsToSelector:@selector(testCardWillApperar:)]) [self.delegate testCardWillApperar:self];
}

- (void)viewDidAppear:(BOOL)animated {
    if ([self.delegate respondsToSelector:@selector(testCardDidApperar:)]) [self.delegate testCardDidApperar:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    if ([self.delegate respondsToSelector:@selector(testCardWillDisappear:)]) [self.delegate testCardWillDisappear:self];
}

- (void)viewDidDisappear:(BOOL)animated {
    if ([self.delegate respondsToSelector:@selector(testCardDidDisappear:)]) [self.delegate testCardDidDisappear:self];
}

#pragma mark - UI

- (void)refreshUIForTestEnd:(BOOL)testEnd {
    
    self.labelSimple.text = self.verb.simple;
    
    if (self.verb.testPending) {
        self.labelTranslation.text = @"";
        self.labelPast.text = @"";
        self.labelParticiple.text = @"";
        self.labelTime.text = @"";
        CGRect rFrame = self.labelSimple.frame;
        rFrame.origin.y = (self.backgroundView.bounds.size.height-rFrame.size.height)/2.0;
        self.labelSimple.frame = rFrame;
    } else {
        self.labelTranslation.text = self.verb.translation;
        self.labelPast.text = self.verb.past;
        self.labelParticiple.text = self.verb.participle;
        if (self.verb.failed) {
            self.labelTime.text = @"";
        } else {
            self.labelTime.text = [NSString stringWithFormat:@"%.2fs",self.verb.responseTime];
        }
    }

    if (testEnd) {
        self.labelTranslation.alpha = 0;
        self.labelPast.alpha = 0;
        self.labelParticiple.alpha = 0;
        self.labelTime.alpha = 0;
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.labelSimple.frame = self.simpleFrame;
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3 animations:^{
                self.labelTranslation.alpha = 1;
                self.labelPast.alpha = 1;
                self.labelParticiple.alpha = 1;
                self.labelTime.alpha = 1;
                self.labelHint.alpha = 0;
            }];
        }];
    }
}

@end
