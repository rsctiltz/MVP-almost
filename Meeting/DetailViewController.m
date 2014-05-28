//
//  DetailViewController.m
//  Meeting
//
//  Created by Ryan Tiltz on 5/27/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import "DetailViewController.h"
#import "WebsiteViewController.h"


@interface DetailViewController ()

{
//    __weak IBOutlet UINavigationBar *navBarTitle;
    __weak IBOutlet UILabel *rsvpLabel;
    __weak IBOutlet UILabel *groupNameLabel;

    __weak IBOutlet UILabel *forWhomLabel;


    __weak IBOutlet UIButton *detailLinkButton;
    __weak IBOutlet UIWebView *descriptionWebViewField;
    __weak IBOutlet UILabel *yesLabel;

    NSString *urlForWebView;

}
@end

@implementation DetailViewController
@synthesize event;


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = [NSString stringWithFormat:@"%@", event[@"name"]];
    yesLabel.text = [NSString stringWithFormat:@"%@", event[@"yes_rsvp_count"]];
    rsvpLabel.text = [NSString stringWithFormat:@"%@", event[@"maybe_rsvp_count"]];
    groupNameLabel.text = event[@"group"][@"name"];
    forWhomLabel.text = event[@"group"][@"who"];

    [descriptionWebViewField loadHTMLString:event[@"description"] baseURL:nil];



    if([event[@"event_url"] isEqualToString:@""])
    {
        detailLinkButton.alpha = 0;
    } else {
        detailLinkButton.alpha = 1;
        
        urlForWebView = event[@"event_url"];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WebsiteViewController *wvc = segue.destinationViewController;
    wvc.urlString = urlForWebView;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end