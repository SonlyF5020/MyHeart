//
//  AddWordsViewController.h
//  MyHeart
//
//  Created by twer on 10/7/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddWordsViewController : UITableViewController
- (IBAction)saveAddedWords:(id)sender;
@property (nonatomic) IBOutlet UITextView *addTextView;

@end
