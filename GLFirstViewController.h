//
//  GLFirstViewController.h
//  glamourAR
//
//  Created by Mahmood1 on 1/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AVFoundation/AVFoundation.h>
#import <MessageUI/MFMailComposeViewController.h>


#define kImageCapturedSuccessfully @"imageCapturedSuccessfully"

enum    {
    VIEWSOURCE_UIIMAGEVIEW = 1,
    VIEWSOURCE_OPENGLVIEW,
};

enum    {
    CameraDeviceSetting640x480 = 0,
    CameraDeviceSettingHigh = 1,
    CameraDeviceSettingMedium = 2,
    CameraDeviceSettingLow = 3,
};



@interface GLFirstViewController : UIViewController<AVCaptureVideoDataOutputSampleBufferDelegate,MFMailComposeViewControllerDelegate>
{
     BOOL ignoreImageStream;
    
    NSTimer* animationTimer;
    bool animating;
    bool running;
    
    bool useFrontCamera;

    UIView* alphaView;
    
    AVCaptureVideoPreviewLayer *previewLayer;
    
    AVCaptureStillImageOutput* imageOutput;
    
    // Device Information
    //
    int cameraCount;
    int currentCameraDeviceIndex;
    int frontCameraDeviceIndex;
    int backCameraDeviceIndex;
    int cameraImageOrientation;
    UIInterfaceOrientation currentDeviceOrientation;
    
    // test layers for augmented screen capture
    //
    UIImageView *backingLayer;
    UIImageView *overlayLayer;
    
    // The primary View for image capture
    // and it's cooresponding view for display
    //
    int currentViewSource; 
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    //
    // Camera Capture, OpenGL and Pixel Manipulation Stuff
    //
    ////////////////////////////////////////////////////////////////////////////////////////////////////
    //
    //
    AVCaptureDeviceInput *captureInput;
    AVCaptureVideoDataOutput *captureOutput;
    AVCaptureSession *captureSession;
    AVCaptureVideoPreviewLayer *cameraPreviewLayer;
    NSDictionary* videoSettings;
    NSNumber *pixelFormatCode;
    NSString *pixelFormatKey;
    int cameraDeviceSetting;
    
    UIImageView *cameraView;
    UIImage *cameraImage;
    UIImage *cameraImage0;
    UIImage *cameraImage1;
    UIImage* tempImage;
    
    float savedRotation;
}

- (void)captureStillImage;
- (void) activateCameraFeed;
- (void) swapCameras;
- (void) scanForCameraDevices;
- (void) snapShot;
-(void)emailImage:(UIImage*)image;


-(void)hideButtons:(BOOL) hide;
@property (strong, nonatomic) IBOutlet UIView *webControls;
@property (strong, nonatomic) IBOutlet UIView *cameraControls;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *webModeLabels;

@property (strong, nonatomic) IBOutlet UIView *transparencyContainer;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *controls;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundView;
@property (strong) AVCaptureStillImageOutput *stillImageOutput;
@property (nonatomic, strong) UIImage *stillImage;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UISlider *transparencySlider;

- (IBAction)transparencyChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *arOverlayView;


- (IBAction)buttonAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIPinchGestureRecognizer *pinchGestureRecognizer;
- (IBAction)handlePinch:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)enableDisableOverlayInteraction:(id)sender;

- (IBAction)switchCameraMode:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UISlider *hueSlider;
- (IBAction)hueChanged:(id)sender;
- (IBAction)saveOverlay:(id)sender;

- (IBAction)saveComposite:(id)sender;
- (IBAction)timerAction:(id)sender;
- (IBAction)backArrowAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;


- (UIImage *) imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer ;

- (IBAction)modeChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *toolPanel;

@property (weak, nonatomic) IBOutlet UIButton *modeButton;
@property (weak, nonatomic) IBOutlet UIButton *screenshotButton;
@property (weak, nonatomic) IBOutlet UIButton *cameraModeButton;
@property (weak, nonatomic) IBOutlet UIButton *startStopButton;

@property (weak, nonatomic) IBOutlet UIImageView *timerArrow;
@property (weak, nonatomic) IBOutlet UIButton *saveCompositeButton;

- (IBAction)searchButton:(id)sender;
- (IBAction)helpButtonAction:(id)sender;
- (IBAction)facebookButtonAction:(id)sender;
- (IBAction)preferencesButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;

@property (weak, nonatomic) IBOutlet UIButton *helpButton;

@property (weak, nonatomic) IBOutlet UIButton *preferencesButton;


@property (weak, nonatomic) IBOutlet UILabel *transparencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *hueLabel;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *rotationRecognizer;
- (IBAction)rotateView:(id)sender;


//additional ipad controls
@property (weak, nonatomic) IBOutlet UIButton *modeButton2;
@property (weak, nonatomic) IBOutlet UIButton *cameraModeButton2;
@property (weak, nonatomic) IBOutlet UIButton *startStopButton2;
@property (weak, nonatomic) IBOutlet UIButton *screenshotButton2;
@property (weak, nonatomic) IBOutlet UIButton *arScreenshotButton2;

@property (strong, nonatomic) UITapGestureRecognizer *tapToStopGesture;

//collection to hide and show labels
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *buttonLabels;

@end
