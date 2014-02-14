//
//  TechnoTranceInduction.m
//  Lucid Dreaming App
//
//  Created by Mahmood1 on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TechnoTranceInduction.h"
#import <QuartzCore/QuartzCore.h>
#import "AppStrings.h"
#import "AppColors.h"

@implementation TechnoTranceInduction
@synthesize videoView;
@synthesize vesselView;
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize label4;
@synthesize label5;
@synthesize label6;
@synthesize clockLabel;
@synthesize singularityButton;
@synthesize dateFormat;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        labels = [[NSMutableArray alloc] initWithCapacity:6];
        labelStrings = [AppStrings produceEnligthment];
    }
    return self;
}

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
    // Do any additional setup after loading the view from its nib.
    
    [labels addObject:label1];
    [labels addObject:label2];
    [labels addObject:label3];
    [labels addObject:label4];
    [labels addObject:label5];
    [labels addObject:label6];
  
}

- (void)viewDidUnload
{
    [self setSingularityButton:nil];
    [self setVideoView:nil];
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [self setLabel4:nil];
    [self setLabel5:nil];
    [self setLabel6:nil];
    [self setVesselView:nil];
    [self setClockLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)singularityAction:(id)sender {
    
    if(self.navigationController.navigationBar.hidden)
       {
           [captureSession stopRunning];
           [animationTimer invalidate];
           vesselView.alpha = 0;
           
           [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
           [self.tabBarController.tabBar setHidden:NO];
           [self.navigationController setNavigationBarHidden:NO animated:YES];
       }else{
           [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
           [self.navigationController setNavigationBarHidden:YES animated:YES];
           [self.tabBarController.tabBar setHidden:YES]; 
           
           
           captureSession = [[AVCaptureSession alloc] init];
           AVCaptureDevice *audioCaptureDevice = nil;
           
//           AVCaptureDevice *audioCaptureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
           
           NSArray *videoDevices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];

           for (AVCaptureDevice *device in videoDevices) {
               if (device.position == AVCaptureDevicePositionFront) {
                   //FRONT-FACING CAMERA EXISTS
                   audioCaptureDevice = device;
                   break;
               }
           }
           
//           AVCaptureDevice *audioCaptureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
           
           NSError *error = nil;
           AVCaptureDeviceInput *audioInput = [AVCaptureDeviceInput deviceInputWithDevice:audioCaptureDevice error:&error];
           if (audioInput) {
               [captureSession addInput:audioInput];
           }
           else {
               // Handle the failure.
           }

          
           AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:captureSession];
           UIView *aView = videoView;
           previewLayer.frame = CGRectMake(0,0,320,480); // Assume you want the preview layer to fill the view.
           [aView.layer addSublayer:previewLayer];
           [captureSession startRunning];
           
//            singularityButton.layer.anchorPoint = CGPointMake(1.6, 0.3);
           
           carrier = 1;
           vesselView.alpha = 1;
           a1 = YES;
           a2 = NO;
           a3 = YES;
           
           //triangle pointing up
           label1.alpha = 1;
           label3.alpha = 1;
           label5.alpha = 1;
           
           //triangle pointing down
           label2.alpha = 1;
           label4.alpha = 1;
           label6.alpha = 1;

           animationTimer=[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(animate) userInfo:nil repeats:YES];
//            animationTimer=[NSTimer scheduledTimerWithTimeInterval:(1/9.0)-0.01 target:self selector:@selector(animate) userInfo:nil repeats:YES];
//           animationTimerPast=[NSTimer scheduledTimerWithTimeInterval:0.99+1/9.0 target:self selector:@selector(animatePast) userInfo:nil repeats:YES];
//           animationTimerPast=[NSTimer scheduledTimerWithTimeInterval:0.99-1/9.0 target:self selector:@selector(animateFuture) userInfo:nil repeats:YES];
       }
}

#define offsetX 160.0
#define shiftFrequency (360/25.0)
#define rotationSpeed 3
-(void)advanceControls
{
    
    NSDate *date= [NSDate dateWithTimeIntervalSinceNow:0];
    int statusIndex = (int)([date timeIntervalSince1970])%360;

//    if(statusIndex %61==0)
//    {
//        clockLabel.textColor =[UIColor yellowColor] ;
//    }else if(statusIndex%41 ==0)
//    {
//         clockLabel.textColor =[UIColor magentaColor] ;
//    }else if (statusIndex%21 == 0){
//         clockLabel.textColor =[UIColor cyanColor] ;
//    }
    
    clockLabel.text = [dateFormat stringFromDate:date];    
  
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(statusIndex*rotationSpeed *(M_PI/180));
    CGAffineTransform transformCCW = CGAffineTransformMakeRotation(-statusIndex*rotationSpeed *(M_PI/180));
    
//    vesselView.alpha = a1&&a2?1:0;
//    singularityButton
    
    //satellite like behavior
//        singularityButton.layer.anchorPoint = CGPointMake(1.2, 0);
//    singularityButton.layer.anchorPoint = CGPointMake(1.6, 0.3);
    singularityButton.transform= transform;
    vesselView.transform = transformCCW;
    
    //            UILabel* l = [labels objectAtIndex:statusIndex%6];
//    label1.text  = a1?@"I":@"is";
//    label3.text  = a2?@"Am":@"is";
//    label5.text  = a3?@"Am":@"is";

    label1.text = [labelStrings objectAtIndex:(statusIndex)%[labelStrings count]];
    label2.text = [labelStrings objectAtIndex:(statusIndex+1)%[labelStrings count]];
    label3.text = [labelStrings objectAtIndex:(statusIndex+2)%[labelStrings count]];
    label4.text = [labelStrings objectAtIndex:(statusIndex+3)%[labelStrings count]];
    label5.text = [labelStrings objectAtIndex:(statusIndex+4)%[labelStrings count]];
    label6.text = [labelStrings objectAtIndex:(statusIndex+5)%[labelStrings count]];
    
    
//    label1.alpha = a1?1:0;
//    label3.alpha = a2?1:0;
//    label5.alpha = a3?1:0;
    bool a1temp = a1;
    a1 = a3;
    a2 =a1temp;
    a3 = ((a1 && !a2) || (!a1 && a2))?1:0; //exclusive or
    

}

-(void)animate
{
      
    if(!animating)
    {  
        //theta waves 9hz, start to decrease to 6.5 hz
        animating=YES;
//        carrier+(a1?1/9.0:-1/9.0)
        [UIView animateWithDuration:carrier delay:0 options:UIViewAnimationCurveEaseOut animations:^(void) {
            
            [self advanceControls];
            
            //                      
        }
                         completion:^(BOOL finished) { 
                             [UIView animateWithDuration:carrier delay:0 options:UIViewAnimationCurveEaseOut animations:^(void) {
                                 [self advanceControls];                                 
                             }
                                              completion:^(BOOL finished) { 
                                                  [UIView animateWithDuration:carrier delay:0 options:UIViewAnimationCurveEaseOut animations:^(void) {
                                                      
                                                      [self advanceControls];                                                          
                                                      
                                                  }
                                                                   completion:^(BOOL finished) { 
                                                                       animating = NO;
                                                                   }];
                                              }];
                         }];
        
        
    }
}


//-(void)animate
//{
//    NSDate *date= [NSDate dateWithTimeIntervalSinceNow:0];
//    int statusIndex = (int)([date timeIntervalSince1970])%61;
//    int hideIndexFuture = (int)(([date timeIntervalSince1970])+25)%61;
//    int hideIndexPast = (int)(([date timeIntervalSince1970])-24)%61;
//
//    CGAffineTransform transformCCW = CGAffineTransformMakeRotation(-1*statusIndex *M_PI/30.0);
//    
//    if(!animating)
//    {
//        animating=YES;
//        [UIView animateWithDuration:0.99 delay:0 options:UIViewAnimationCurveEaseOut animations:^(void) {
//        
//            singularityButton.transform = transformCCW;
//            
//            UILabel* l = [labels objectAtIndex:statusIndex%6];
//            l.alpha = 1;
//            
//           l = [labels objectAtIndex:hideIndexFuture%6];
//            l.alpha = 1;
//            
//             l = [labels objectAtIndex:hideIndexPast%6];
//            l.alpha = 1;
//            
//            for(int i = 0; i<6;i++)
//            {
//                l = [labels objectAtIndex:i];
//                
//                if(i!=statusIndex && i!=hideIndexFuture && i!= hideIndexPast){
//                    l.alpha = 0;    
//                }
//            }
//            
//            
//        }
//                         completion:^(BOOL finished) { 
//                             animating = NO;
//                         }];
//
//        
//    }
//}


//// NSString to ASCII
//NSString *string = @"A";
//int asciiCode = [string characterAtIndex:0]; // 65
//then pass it to function below :
//
//-(NSString*) arrayOfBinaryNumbers:(int) val 
//{
//    NSMutableArray* result = [NSMutableArray array];
//    size_t i;
//    for (i=0; i < CHAR_BIT * sizeof val; i++) {
//        int theBit = (val >> i) & 1;
//        [result addObject:[NSNumber numberWithInt:theBit]];
//    }
//    return result;
//}

@end
