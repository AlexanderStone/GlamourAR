//
//  TechnoTranceInduction.h
//  Lucid Dreaming App
//
//  Created by Mahmood1 on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AVFoundation/AVFoundation.h>

@interface TechnoTranceInduction : UIViewController
{
    AVCaptureSession *captureSession;
    NSTimer* animationTimer;
    bool animating;
    
    NSTimer* animationTimerPast;
    NSTimer* animationTimerFuture;
//    NSTimer* animationTimer;
    bool animatingLabels;
    
    NSMutableArray* labels;
    
    bool a1;
    bool a2;
    bool a3;
    
    int carrier;
    
    NSArray* labelStrings;
}
@property(nonatomic,strong) NSDateFormatter* dateFormat;
@property (weak, nonatomic) IBOutlet UIButton *singularityButton;

- (IBAction)singularityAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *videoView;



@property (weak, nonatomic) IBOutlet UIImageView *vesselView;


@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (weak, nonatomic) IBOutlet UILabel *label2;

@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;

@property (weak, nonatomic) IBOutlet UILabel *label5;

@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *clockLabel;

@end
