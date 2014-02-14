//
//  ViewController.h
//  AugCam
//
//  Created by John Carter on 1/26/2012.
//

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

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <MobileCoreServices/UTType.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>
#import "GLView.h"
#import "GLMapper.h"

@interface GLViewController : UIViewController <AVCaptureVideoDataOutputSampleBufferDelegate>
{
    BOOL ignoreImageStream;
    
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
    int currentViewSource;      // 1=cameraView,    2=glView
    UIView *displayView;
    
    // ViewSettings
    //
    NSUInteger textureMapBuilderCode;
    NSUInteger vertexMapBuilderCode;
    GLfloat vertexMapBuilderScale;
    
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
    
    // Open/GL
    //
    GLView *glView;
    EAGLContext *glViewContext;
    
    // VERTICIES
    //
    GLMapper *glMapper;
    int vertexCount;
    GLfloat *vertexData;
    GLfloat *textureData;
    
    // CAMERA IMAGE TEXTURE BUFFER
    //
    GLuint cameraTextureTag;
    void *cameraTextureImageBuffer;
    CGRect cameraTextureRect;
    CGContextRef cameraTextureContext;
    CGColorSpaceRef cameraTextureColorSpace;
    
    // VERTEX BUFFERING
    //
    GLuint vboVertexBuffer;
    GLuint vboTextureBuffer;
}

@property (readonly,retain) UIImage *cameraImage;
@property (readonly) GLView *glView;
@property (readonly) int cameraImageOrientation;
- (IBAction)takePhoto:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *goForwardButton;

@end