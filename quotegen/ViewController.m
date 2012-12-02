//
//  ViewController.m
//  quotegen
//
//  Created by Alexandru Nicolae on 12/2/12.
//  Copyright (c) 2012 Alexandru Nicolae. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 1 - Add array of personal quotes
    self.myQuotes = @[
                        @"Live and let life",
                        @"Don't cry over spilt milk",
                        @"Always look on the bright side of life",
                        @"Nobody's perfect",
                        @"Can't see the woods for the trees",
                        @"Better to have loved and lost then not loved at all",
                        @"The early bird catches the worm",
                        @"As slow as a wet week"
                        ];
    // 2 - Load movie quotes
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes= [NSMutableArray arrayWithContentsOfFile:plistCatPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)quoteButtonTapped:(id)sender {
    if (self.quoteOpt.selectedSegmentIndex ==2) {
        // 1 - Get number of rows
        int array_tot = [self.myQuotes count];
        NSString *all_my_quotes = @"";
        NSString *my_quote = nil;
        
        for (int x=0; x< array_tot; x++) {
            my_quote = self.myQuotes[x];
            all_my_quotes = [NSString stringWithFormat:@"%@\n%@\n", all_my_quotes, my_quote];
        }
        self.quoteText.text = [NSString stringWithFormat:@"%@", all_my_quotes];
    }
    else {
        // determine category
        NSString *selectedCategory = @"classic";
        if (self.quoteOpt.selectedSegmentIndex == 1) {
            selectedCategory = @"modern";
        }
        
        // Filter array using predicate
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
        NSArray *filtredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
        // Number of items
        int array_tot = [filtredArray count];
        // Testing if arrray is not empty
        if (array_tot > 0) {
            int index = (arc4random() % array_tot);
            NSString *source = [[filtredArray objectAtIndex:index] valueForKey:@"source"];
            NSString *quote = filtredArray[index][@"quote"];
            
            if (![source length] == 0) {
                quote = [NSString stringWithFormat:@"%@\n\n(%@)", quote, source];
            }
            
            if ([selectedCategory isEqualToString:@"classic"]) {
                quote = [NSString stringWithFormat:@"From Classic Movie\n\n%@", quote];
            } else {
                quote = [NSString stringWithFormat:@"Movie Quote:\n\n%@", quote];
            }
            self.quoteText.text = quote;
        } else {
            self.quoteText.text = [NSString stringWithFormat:@"No quotes to display"];
        }
    }
}

@end
