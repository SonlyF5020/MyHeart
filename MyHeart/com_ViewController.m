//
//  com_ViewController.m
//  MyHeart
//
//  Created by twer on 9/25/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import "com_ViewController.h"

@interface com_ViewController ()

@end

@implementation com_ViewController
@synthesize resultText;
@synthesize iFlyRecongnizerView;

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",APPID ];
        iFlyRecongnizerView = [[IFlyRecognizerView alloc] initWithOrigin:CGPointMake(15, 60) initParam:initString];
        iFlyRecongnizerView.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setText:(NSString *) text{
    self.resultText.text = text;
}

- (void) setGrammar:(NSString *)grammar{
    
}

-(void) onResult:(IFlyRecognizerView *)iFlyRecognizerView theResult:(NSArray *)resultArray{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    for (NSString *key in dic) {
        [result appendFormat:@"%@(置信度:%@)\n",key,[dic objectForKey:key]];
    }
    //    NSLog(@"result:%@",results);
    self.resultText.text = [NSString stringWithFormat:@"%@%@",self.resultText.text,result];
    NSLog(@"……正常结束……");
}

-(void) onEnd:(IFlyRecognizerView *)iFlyRecognizerView theError:(IFlySpeechError *)error{
    NSLog(@"……语音识别结束……");
}

- (IBAction)start:(id)sender {
    self.resultText.text = nil;
    [iFlyRecongnizerView setParameter:@"grammarID" value:_grammarID];
    [iFlyRecongnizerView setParameter:@"domain" value:@"iat"];
    [iFlyRecongnizerView setParameter:@"sample_rate" value:@"16000"];
    [iFlyRecongnizerView setParameter:@"vad_eos" value:@"1800"];
    [iFlyRecongnizerView setParameter:@"vad_bos" value:@"6000"];
    [iFlyRecongnizerView start];
}
@end
