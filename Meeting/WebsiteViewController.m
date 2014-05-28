//
//  WebsiteViewController.m
//  Meeting
//
//  Created by Ryan Tiltz on 5/27/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import "WebsiteViewController.h"

@interface WebsiteViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation WebsiteViewController

- (void)goToURLSTring:(NSString *)urlString
{

    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];


}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self goToURLSTring:self.urlString];


}

@end
