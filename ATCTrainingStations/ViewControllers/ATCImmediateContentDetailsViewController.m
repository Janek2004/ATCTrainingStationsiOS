//
//  ATCContentDetailsViewController.m
//  ATCTrainingStations
//
//  Created by Janusz Chudzynski on 6/23/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import "ATCImmediateContentDetailsViewController.h"

@interface ATCImmediateContentDetailsViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation ATCImmediateContentDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSURL *targetURL = [NSURL URLWithString:@"http://atcwebapp.argo.uwf.edu/trainingstations/wp_trainingstations/wp-content/uploads/2014/06/Juniorsimapp2.pdf"];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    
    [self.webview loadRequest:request];
    self.webview.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
