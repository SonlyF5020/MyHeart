//
//  rootViewController.h
//  MyHeart
//
//  Created by twer on 9/28/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iflyMSC/IFlyRecognizerViewDelegate.h"
#import "iflyMSC/IFlyRecognizerView.h"
#import "iflyMSC/IFlySynthesizerView.h"
#import "useWordsViewController.h"

#define APPID    @"523e8a23"

@interface rootViewController : UITableViewController<IFlyRecognizerViewDelegate,IFlySynthesizerViewDelegate,RootDelegate>

@property NSMutableArray *dataItems;
@property (nonatomic) IBOutlet UITableView *tableViewList;
@property IFlyRecognizerView *iFlyRecongnizerView;
@property IFlySynthesizerView *iFlySynthesizerView;
@property (nonatomic) IBOutlet UITextView *mainText;
@property NSString *grammarID;
@property NSString *ent;
@property (nonatomic) IBOutlet UIButton *speakButton;

- (IBAction)readStart:(UIButton*)sender;
- (IBAction)seeUseWords:(id)sender;
- (IBAction)start:(id)sender;
- (IBAction)cleanMainText:(id)sender;

@end
