//
//  PreferencesViewController.m
//  glamourAR
//
//  Created by Mahmood1 on 1/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PreferencesViewController.h"


@implementation PreferencesViewController

@synthesize dismissKeyboardButton;
@synthesize emailField;
@synthesize searchEngineField;
@synthesize cameraRollSwitch;
@synthesize emailSwitch;
@synthesize scrollView;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    dismissKeyboardButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissKeyboard)];
    
    UIBarButtonItem* dismissControllerButton = [[UIBarButtonItem alloc] initWithTitle:@"Dismiss" style:UIBarButtonItemStyleBordered target:self action:@selector(dismissController)];
    self.navigationItem.leftBarButtonItem = dismissControllerButton;
    
    [self.scrollView setContentSize:CGSizeMake(320, 500)];
    
    NSString* searchEnginePref = nil;
    searchEnginePref = [[NSUserDefaults standardUserDefaults] stringForKey:@"searchEngine"];
    
    if(searchEnginePref ==nil ||searchEnginePref.length ==0){
        searchEnginePref = @"https://www.google.com";
        [[NSUserDefaults standardUserDefaults] setValue:searchEnginePref forKey:@"searchEngine"];
    }
    
    searchEngineField.text = searchEnginePref;
    emailField.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
    
    emailSwitch.on =  [[NSUserDefaults standardUserDefaults] boolForKey:@"sendEmail"];
    cameraRollSwitch.on =  [[NSUserDefaults standardUserDefaults] boolForKey:@"saveToCamera"];
    
}

- (void)viewDidUnload
{
    [self setEmailField:nil];
    [self setSearchEngineField:nil];
    [self setCameraRollSwitch:nil];
    [self setEmailSwitch:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



#pragma mark -
#pragma mark UITextFieldDelegate
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem = dismissKeyboardButton;
    
    
    
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.navigationItem.rightBarButtonItem = dismissKeyboardButton;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 334, 320, 120) animated:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [[NSUserDefaults standardUserDefaults] setValue:searchEngineField.text forKey:@"searchEngine"];
    [[NSUserDefaults standardUserDefaults] setValue:emailField.text forKey:@"email"];

//    dreamEvent.title = textField.text;
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
//    dreamEvent.dreamDescription = textView.text;
}

-(void)dismissKeyboard
{
    [[NSUserDefaults standardUserDefaults] setValue:searchEngineField.text forKey:@"searchEngine"];
    [[NSUserDefaults standardUserDefaults] setValue:emailField.text forKey:@"email"];

    [self.emailField resignFirstResponder];
    [self.searchEngineField resignFirstResponder];
    
    self.navigationItem.rightBarButtonItem = nil;
}

-(void)dismissController
{
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}



- (IBAction)googleButton:(id)sender {
    [[NSUserDefaults standardUserDefaults] setValue: @"https://www.google.com" forKey:@"searchEngine"];
    searchEngineField.text = @"https://www.google.com" ;
    
}

- (IBAction)bingButton:(id)sender {
    [[NSUserDefaults standardUserDefaults] setValue: @"https://www.bing.com" forKey:@"searchEngine"];
    searchEngineField.text = @"https://www.bing.com" ;
}

- (IBAction)yahooButton:(id)sender {
    [[NSUserDefaults standardUserDefaults] setValue: @"https://www.yahoo.com" forKey:@"searchEngine"];
    searchEngineField.text = @"https://www.yahoo.com" ;
}

- (IBAction)saveToCameraRollPrefChanged:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:cameraRollSwitch.on forKey:@"saveToCamera"];
}


- (IBAction)emailImagesPrefChanged:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:emailSwitch.on forKey:@"sendEmail"];

}

//160,317
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.alpha = 1;
//        banner.center = CGPointMake(160,25);
        [UIView commitAnimations];
        bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.alpha = 0;
//        banner.center = CGPointMake(160,-150);
        [UIView commitAnimations];
        bannerIsVisible = NO;
    }
}

@end
