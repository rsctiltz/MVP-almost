//
//  ViewController.m
//  Meeting
//
//  Created by Ryan Tiltz on 5/27/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property NSDictionary *myDictionary;
@property NSDictionary *firstDictionary;
@property NSArray *myArray;
@end

@implementation ViewController

- (void)viewDidLoad
{

    [super viewDidLoad];


    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=477d1928246a4e162252547b766d3c6d"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {

         _myArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError] [@"results"];

         [self.myTableView reloadData];

     }];
}
#pragma mark UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyEventCellID"];

    NSDictionary *event = self.myArray[indexPath.row];
    cell.textLabel.text = [event objectForKey:@"name"];
    cell.detailTextLabel.text = [[event valueForKey:@"venue"]valueForKey: @"address_1"];

    return cell;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    DetailViewController *dvc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:sender];
    dvc.event = self.myArray[indexPath.row];

}

@end


