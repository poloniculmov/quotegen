//
//  ViewController.h
//  quotegen
//
//  Created by Alexandru Nicolae on 12/2/12.
//  Copyright (c) 2012 Alexandru Nicolae. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSArray *movieQuotes;
@property (nonatomic, strong) IBOutlet UITextView *quoteText;
@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;

- (IBAction)quoteButtonTapped:(id)sender;

@end
