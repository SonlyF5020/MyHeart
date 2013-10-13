//
//  com_ViewController.h
//  MyHeart
//
//  Created by twer on 9/25/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iflyMSC/IFlyRecognizerViewDelegate.h"
#import "iflyMSC/IFlyRecognizerView.h"

#define APPID    @"523e8a23"

@interface com_ViewController : UIViewController<IFlyRecognizerViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *resultText;
@property NSString *grammarID;
@property NSString *ent;
@property IFlyRecognizerView *iFlyRecongnizerView;

- (IBAction)start:(id)sender;
- (void) setText:(NSString *) text;
- (void) setGrammar:(NSString *)grammar;

@end
