//
//  rootViewController.m
//  MyHeart
//
//  Created by twer on 9/28/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import "rootViewController.h"

@interface rootViewController ()

@end

@implementation rootViewController
@synthesize iFlyRecongnizerView;
@synthesize iFlySynthesizerView;
@synthesize speakButton;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.title = @"心声";
        NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",APPID ];
        iFlyRecongnizerView = [[IFlyRecognizerView alloc] initWithOrigin:CGPointMake(15, 60) initParam:initString];
        iFlyRecongnizerView.delegate = self;
        iFlySynthesizerView = [[IFlySynthesizerView alloc] initWithOrigin:CGPointMake(10, 60) params:initString];
        iFlySynthesizerView.delegate = self;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataItems = [[NSMutableArray alloc] initWithObjects:@"第一名",@"第二名",@"第三名", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_dataItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSInteger row = [indexPath row];
    if (row == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"bigArea" forIndexPath:indexPath];

        cell.textLabel.text = [_dataItems objectAtIndex:row];
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.textLabel.text = [_dataItems objectAtIndex:row];
    }
    // Configure the cell...
    
    return cell;
}

- (void) onBufferProress:(IFlySynthesizerView *)iFlySynthesizerView progress:(int)progress
{
}

- (void) onEnd:(IFlySynthesizerView *)iFlySynthesizerView error:(IFlySpeechError *)error
{
    speakButton.enabled = YES;
}

- (void) onPlayProress:(IFlySynthesizerView *)iFlySynthesizerView progress:(int)progress
{
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void) onResult:(IFlyRecognizerView *)iFlyRecognizerView theResult:(NSArray *)resultArray{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    for (NSString *key in dic) {
        [result appendFormat:@"%@\n",key];
    }
    //    NSLog(@"result:%@",results);
    self.mainText.text = [NSString stringWithFormat:@"%@%@",self.mainText.text,result];
    [self.mainText setFont:[UIFont fontWithName:@"Helvetica" size:30]];
}

-(void) onEnd:(IFlyRecognizerView *)iFlyRecognizerView theError:(IFlySpeechError *)error{
}

- (IBAction)readStart:(UIButton*)sender {
    sender.enabled = NO;
    [iFlySynthesizerView startSpeaking:_mainText.text];
}

- (IBAction)seeUseWords:(id)sender {
    [self performSegueWithIdentifier:@"useWords" sender:self];
}

- (IBAction)start:(id)sender {
    self.mainText.text = nil;
    [iFlyRecongnizerView setParameter:@"grammarID" value:_grammarID];
    [iFlyRecongnizerView setParameter:@"domain" value:@"iat"];
    [iFlyRecongnizerView setParameter:@"sample_rate" value:@"16000"];
    [iFlyRecongnizerView setParameter:@"vad_eos" value:@"1800"];
    [iFlyRecongnizerView setParameter:@"vad_bos" value:@"6000"];
    [iFlyRecongnizerView start];
}

- (IBAction)cleanMainText:(id)sender {
    [_mainText becomeFirstResponder];
    _mainText.text = nil;
}
-(void)passValue:(NSString *)value{
    _mainText.text = value;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"useWords"]) {
        useWordsViewController *target = segue.destinationViewController;
        [target setValue:self forKey:@"rootDelegate"];
    }
}

//controller keyboard
#pragma mark - UITextView Delegate Methods
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

@end
