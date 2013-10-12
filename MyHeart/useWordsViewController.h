//
//  useWordsViewController.h
//  MyHeart
//
//  Created by twer on 9/28/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RootDelegate
-(void) passValue:(NSString *) value;
@end

@interface useWordsViewController : UITableViewController<UIGestureRecognizerDelegate>
- (IBAction)startEdit:(id)sender;
- (IBAction)openAddPage:(UIBarButtonItem *)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableViewList;
@property NSMutableArray *dataItems;
@end
