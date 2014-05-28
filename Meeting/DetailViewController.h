//
//  DetailViewController.h
//  Meeting
//
//  Created by Ryan Tiltz on 5/27/14.
//  Copyright (c) 2014 Ryan Tiltz. All rights reserved.
//

#import "ViewController.h"

@interface DetailViewController : UIViewController


@property NSDictionary *event;

@property NSString *name;
@property NSString *rsvpCounts;
@property NSString *hostInformation;
@property NSString *description;
@property NSString *url;
@property NSString *forWhom;
@property NSString *groupName;

@end