//
//  PreferencesViewController.h
//  glamourAR
//
//  Created by Mahmood1 on 1/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PreferencesViewController : UIViewController<UITextFieldDelegate>
{
    bool bannerIsVisible;
}

@property(nonatomic,strong)UIBarButtonItem* dismissKeyboardButton;





@property (weak, nonatomic) IBOutlet UITextField *emailField;



@property (weak, nonatomic) IBOutlet UITextField *searchEngineField;





@property (weak, nonatomic) IBOutlet UISwitch *cameraRollSwitch;


@property (weak, nonatomic) IBOutlet UISwitch *emailSwitch;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;



- (IBAction)googleButton:(id)sender;

- (IBAction)bingButton:(id)sender;

- (IBAction)yahooButton:(id)sender;


- (IBAction)dismissController:(id)sender;




@end
