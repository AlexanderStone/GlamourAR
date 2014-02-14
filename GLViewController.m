//
//  ViewController.m
//  AugCam
//
//  Created by John Carter on 1/26/2012.
//

#import "GLViewController.h"
#import "ScreenCapture.h"

@interface GLViewController()

- (void) performImageCaptureFrom:(CMSampleBufferRef)sampleBuffer;
- (void) activateCameraFeed;
- (void) initOpenGL;
- (void) refreshVBObjects;
- (void) scanForCameraDevices;
- (void) mapGLViewForOrientation:(UIInterfaceOrientation)toInterfaceOrientation;
- (void) swapCameras;
- (void) setViewSource:(int)newViewSource;
- (void) saveDisplayView;
- (void) saveGLView;
- (void) goLive;

@end

@implementation GLViewController
@synthesize goForwardButton;

@synthesize cameraImage;
@synthesize glView;
@synthesize cameraImageOrientation;

- (void)dealloc
{
    if ( captureOutput != nil )
    {
        [captureOutput release];
        captureOutput = nil;
    }
    
    if ( captureInput != nil )
    {
        [captureInput release];
        captureInput = nil;
    }
    
    if ( glMapper != nil )
    {
        [glMapper release];
        glMapper = nil;
    }
    
    if ( glView != nil )
    {
        [glView removeFromSuperview];
        [glView release];
        glView = nil;
    }
    
    if ( cameraView != nil )
    {
        [cameraView removeFromSuperview];
        [cameraView release];
        cameraView = nil;
    }
    
    if (backingLayer != nil)
    {
        [backingLayer removeFromSuperview];
        [backingLayer release];
        backingLayer=nil;
    }
    
    if (overlayLayer != nil)
    {
        [overlayLayer removeFromSuperview];
        [overlayLayer release];
        overlayLayer=nil;
    }
    
    if (displayView != nil)
    {
        [displayView removeFromSuperview];
        [displayView release];
        displayView=nil;
    }
    
    [super dealloc];
}

- (id) init
{
    self = [super init];
    
    [[self view] setBackgroundColor:[UIColor blackColor]];
    
    return self;
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self goLive];
}

- (void) goLive
{
    // Disable Processing any Camera Fees for now
    //
    ignoreImageStream = YES;
    
    // Device Info
    //
    currentDeviceOrientation = UIInterfaceOrientationPortrait;
    currentViewSource = 0;          // or VIEWSOURCE_UIIMAGEVIEW or VIEWSOURCE_OPENGLVIEW
//    currentViewSource = VIEWSOURCE_UIIMAGEVIEW;
  
    // Scan for Cameras
    //
    cameraCount = 0;
    frontCameraDeviceIndex = -1;
    backCameraDeviceIndex = -1;
    
    [self scanForCameraDevices];
    
    // Turn on the Camera
    //
    [self activateCameraFeed];
    
    // Init Open/GL
    //
    [self initOpenGL];
    
    vertexMapBuilderScale = (GLfloat)1.0;
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glTranslatef(0.0, 0.0, -1.0);
    
    // testing gl manipulation
    //
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glTranslatef(0.0, 0.0, -1.5);
    glRotatef( (GLfloat)M_PI, (GLfloat)1.0, (GLfloat)0.0, (GLfloat)0.0 );
    glRotatef( (GLfloat)M_PI, (GLfloat)0.0, (GLfloat)1.0, (GLfloat)0.0 );
    glRotatef( (GLfloat)M_PI, (GLfloat)0.0, (GLfloat)0.0, (GLfloat)1.0 );
    
    [self mapGLViewForOrientation:UIInterfaceOrientationPortrait];
    
    // Init the test layers
    //
    backingLayer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backinglayer.png"]];
    overlayLayer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overlaylayer.png"]];
    
    // Init the Plain Camera
    //
    cameraView = [[UIImageView alloc] initWithFrame:CGRectMake((CGFloat)0.0, (CGFloat)0.0, (CGFloat)480.0, (CGFloat)640.0)];    // size of the camera feed images
    
    // Init the displayView container and set the transform to scale the 480x640 so it will fit in 320x480 view (becomes 320x427)
    //
    displayView = [[UIImageView alloc] initWithFrame:CGRectMake((CGFloat)0.0, (CGFloat)0.0, (CGFloat)480.0, (CGFloat)640.0)];   // size of the camera feed images
    [displayView setTransform:CGAffineTransformIdentity];
    [displayView setTransform:CGAffineTransformScale([displayView transform], (CGFloat)0.667, (CGFloat)0.667)];
    [displayView setTransform:CGAffineTransformTranslate([displayView transform], (CGFloat)-120, (CGFloat)-173)];
    [self.view addSubview:displayView];
    
    cameraView.alpha = 0.5;
    [self.view insertSubview:cameraView belowSubview:goForwardButton];
    
    // Set the default view source (also turns on the image stream)
    //
     [self setViewSource:VIEWSOURCE_UIIMAGEVIEW];
//    [self setViewSource:VIEWSOURCE_OPENGLVIEW];
}

- (void) setViewSource:(int)newViewSource
{
    if ( newViewSource==currentViewSource )
    {
        return;
    }
    
    ignoreImageStream=YES;
    
    // Pop all the views off the container view
    //
    if ( overlayLayer != nil )
        [overlayLayer removeFromSuperview];
    
    switch( currentViewSource )
    {
        case VIEWSOURCE_OPENGLVIEW:
            [glView removeFromSuperview];
            break;
            
        case VIEWSOURCE_UIIMAGEVIEW:
            [cameraView removeFromSuperview];
            break;
    }
    
    if ( backingLayer != nil )
        [backingLayer removeFromSuperview];
    
    currentViewSource = newViewSource;
    
    // Put all the views back in the container view
    //
    if ( backingLayer != nil )
        [displayView addSubview:backingLayer];
    
    switch( newViewSource )
    {
        case VIEWSOURCE_OPENGLVIEW:
            [displayView addSubview:glView];
            break;
            
        case VIEWSOURCE_UIIMAGEVIEW:
            [displayView addSubview:cameraView];
            cameraView.alpha = 0.5;
            break;
    }
    
    if ( overlayLayer != nil )
        [displayView addSubview:overlayLayer];
    
    ignoreImageStream=NO;
}

//
// This will only automatically change the size of self.view
// it will not change the sizes and locations of subviews
//
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return( interfaceOrientation==UIInterfaceOrientationPortrait );
}

//
// This method releases the 'newimage' because it may change it
// so the references passed can no longer be released by the
// caller of this method
//
- (void) newCameraImageNotification:(CGImageRef)newImage
{
    if ( newImage == nil )
        return;
    
    if ( currentViewSource == VIEWSOURCE_UIIMAGEVIEW )
    {
        cameraImage0 = [[UIImage alloc] initWithCGImage:newImage scale:(CGFloat)1.0 orientation:cameraImageOrientation];
        cameraImage = cameraImage0;
        
        [cameraView setImage:cameraImage];
        
        
        if ( cameraImage1 != nil )
            [cameraImage1 release];
        cameraImage1 = cameraImage0;
    }
    else
        if ( currentViewSource == VIEWSOURCE_OPENGLVIEW )
        {
            size_t textureBufferWidth = (size_t)rintf( cameraTextureRect.size.width );
            size_t textureBufferHeight = (size_t)rintf( cameraTextureRect.size.height );
            
            //      memset( cameraTextureImageBuffer, (unsigned char)0, textureBufferWidth * textureBufferHeight * 4 ); // needs to be done to avoid shadowing under transparency
            
            // Draw the full image into our cameraTextureImageBuffer (which is sized to account for this) even though
            // for texture mapping to work, we will only bind to a 512x512 section of the image
            //
            CGRect extractRect = CGRectMake((CGFloat)0.0, (CGFloat)0.0, (CGFloat)CGImageGetWidth(newImage), (CGFloat)CGImageGetHeight(newImage));
            CGContextDrawImage(cameraTextureContext, extractRect, newImage);
            glBindTexture(GL_TEXTURE_2D, cameraTextureTag);
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, textureBufferWidth, textureBufferHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, cameraTextureImageBuffer);
            
            [self refreshVBObjects];
        }
    
    CGImageRelease(newImage);
}

- (void) savedSnapShot:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if ( error != nil )
    {
         NSLog(@"Error saving snapshot");
//        NSLog(@"Error saving snapshot: %@",
//              <div class="error">
//              <div class="message_box_content"></div>
//              <div class="clearboth"></div>
//              </div>"
//              
//              );
    }
}

- (void) snapShot
{
    if ( ignoreImageStream )
        return;
    
    ignoreImageStream = YES;
    
    if ( currentViewSource==VIEWSOURCE_OPENGLVIEW )
        [self saveGLView];
    else
        if ( currentViewSource==VIEWSOURCE_UIIMAGEVIEW )
            [self saveDisplayView];
    
    ignoreImageStream = NO;
}

- (void) saveGLView
{
    UIImage *photo = [ScreenCapture GLViewToImage:glView];              // returns an autoreleased image
    
    if ( photo == nil )
        return;
    
    [photo retain];
    
    // Replace CAEAGLLayer glView with a UIImageView version of itself
    //
    NSInteger viewIndex = [[displayView subviews] indexOfObject:glView];
    UIImageView *glImageView = [[UIImageView alloc] initWithImage:photo];
    [glView removeFromSuperview];
    [displayView insertSubview:glImageView atIndex:viewIndex];
    [photo release];
    
    // Take a normal snapshot now
    //
    [self saveDisplayView];
    
    // Put glView back and release the temporary UIImageView version of it
    //
    [glImageView removeFromSuperview];
    [glImageView release];
    [displayView insertSubview:glView atIndex:viewIndex];
}

- (void) saveDisplayView
{
//    UIImage *photo = [ScreenCapture UIViewToImage:displayView];   
     UIImage *photo = [ScreenCapture UIViewToImage:cameraView];
    // returns an autoreleased image
    
    if ( photo == nil )
        return;
    
    [photo retain];
    
    UIImageWriteToSavedPhotosAlbum(photo, self, @selector(savedSnapShot:didFinishSavingWithError:contextInfo:), nil);
    
    [photo release];
}

- (void) refreshVBObjects
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    glBindBuffer(GL_ARRAY_BUFFER, vboVertexBuffer);
    glEnableClientState(GL_VERTEX_ARRAY);
    glVertexPointer(3, GL_FLOAT, 0, (void *)0);
    
    glBindBuffer(GL_ARRAY_BUFFER, vboTextureBuffer);
    glEnable(GL_TEXTURE_2D);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glBindTexture(GL_TEXTURE_2D, cameraTextureTag);
    glTexCoordPointer(2, GL_FLOAT, 0, (void *)0);
    
    glDrawArrays(GL_TRIANGLES, 0, vertexCount);
    
    [glViewContext presentRenderbuffer:GL_RENDERBUFFER_OES];
}

- (void) mapGLViewForOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if ( vboVertexBuffer != 0 )
    {
        glDeleteBuffers( 1, &vboVertexBuffer );
        glDeleteBuffers( 1, &vboTextureBuffer );
    }
    
    [glMapper buildVertexMap:vertexMapBuilderCode scale:vertexMapBuilderScale];
    
    [glMapper buildTextureMap:textureMapBuilderCode forOrientation:toInterfaceOrientation frontCamera:(currentCameraDeviceIndex==frontCameraDeviceIndex)];
    
    vertexCount = [glMapper vertexCount];
    vertexData = [glMapper vertexData];
    textureData = [glMapper textureData];
    
    glGenBuffers(1, &vboVertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vboVertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(GLfloat)*vertexCount*3, vertexData, GL_STATIC_DRAW);
    
    glGenBuffers(1, &vboTextureBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vboTextureBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(GLfloat)*vertexCount*2, textureData, GL_STATIC_DRAW);
    
    glBindBuffer(GL_ARRAY_BUFFER, 0);
}

- (void) initOpenGL
{
    glView = [[GLView alloc] init];
    glViewContext = [glView context];
    
    glMapper = [[GLMapper alloc] init];
    
    //
    // Establish Location of Camera
    //
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glTranslatef(0.0, 0.0, -1.0);
    
    cameraTextureRect = CGRectMake( (CGFloat)0.0, (CGFloat)0.0, (CGFloat)1024.0, (CGFloat)1024.0 );
    
    size_t imageWidth = (size_t)rintf( cameraTextureRect.size.width );
    size_t imageHeight = (size_t)rintf( cameraTextureRect.size.height );
    
    //
    // To increase performance, the full captured image is copied to this buffer so the
    // size of the buffer needs to match the size of the images (480x640) even though
    // for texture mapping we use a 512x512 section of the date which equates to
    // chopping the final texture mapped image to a 480x546 image.
    //
    // The final 480x546 image still has a ratio of 480x640 so after it is mapped
    // as a 512x512 texture the texture mapping needs to account for the
    // perspective correction
    //
    unsigned int dataSize = 960 * 1280 * 4;
    
    cameraTextureImageBuffer = malloc( dataSize );
    memset( cameraTextureImageBuffer, (unsigned char)0, dataSize );
    
    // Create Texture Colorspace
    //
    cameraTextureColorSpace = CGColorSpaceCreateDeviceRGB();
    
    // Create the texture Context
    cameraTextureContext = CGBitmapContextCreate(cameraTextureImageBuffer, imageWidth, imageHeight, 8, imageWidth*4, cameraTextureColorSpace, kCGImageAlphaPremultipliedLast);
    
    if ( cameraTextureContext == NULL )
    {
        NSLog(@"error creating texture context");
        return;
    }
    
    glGenTextures(1, &cameraTextureTag);
    glBindTexture(GL_TEXTURE_2D, cameraTextureTag);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glEnable(GL_TEXTURE_2D);
}

- (void) scanForCameraDevices
{
    cameraCount = 0;
    frontCameraDeviceIndex = -1;
    backCameraDeviceIndex = -1;
    
    AVCaptureDevice *backCameraDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSArray *deviceList = [AVCaptureDevice devices];
    NSRange cameraSearch;
    NSUInteger i;
    
    for ( i=0; i<[deviceList count]; i++ )
    {
        AVCaptureDevice *currentDevice = (AVCaptureDevice *)[deviceList objectAtIndex:i];
        
        //
        // This is the best info so skip string the string searches
        // that follow if we have a match on this
        //
        if ( currentDevice==backCameraDevice )
        {
            backCameraDeviceIndex = i;
            cameraCount++;
            continue;
        }
        
        cameraSearch = [[currentDevice description] rangeOfString:@"front camera" options:NSCaseInsensitiveSearch];
        if ( frontCameraDeviceIndex<0 && cameraSearch.location != NSNotFound )
        {
            frontCameraDeviceIndex = i;
            cameraCount++;
            continue;
        }
        
        cameraSearch = [[currentDevice description] rangeOfString:@"back camera" options:NSCaseInsensitiveSearch];
        if ( backCameraDevice<0 && cameraSearch.location != NSNotFound )
        {
            backCameraDeviceIndex = i;
            cameraCount++;
            continue;
        }
        
        cameraSearch = [[currentDevice description] rangeOfString:@"camera" options:NSCaseInsensitiveSearch];
        if ( backCameraDevice<0 && cameraSearch.location != NSNotFound )
        {
            backCameraDeviceIndex = i;
            cameraCount++;
            continue;
        }
    }
}

- (void) activateCameraFeed
{
    videoSettings = nil;
    
    pixelFormatCode = [[NSNumber alloc] initWithUnsignedInt:(unsigned int)kCVPixelFormatType_32BGRA];
    pixelFormatKey = [[NSString alloc] initWithString:(NSString *)kCVPixelBufferPixelFormatTypeKey];
    videoSettings = [[NSDictionary alloc] initWithObjectsAndKeys:pixelFormatCode, pixelFormatKey, nil]; 
    
    dispatch_queue_t queue = dispatch_queue_create("com.jellyfilledstudios.ImageCaptureQueue", NULL);
    
    captureOutput = [[AVCaptureVideoDataOutput alloc] init];
    [captureOutput setAlwaysDiscardsLateVideoFrames:YES];
    [captureOutput setSampleBufferDelegate:self queue:queue];
    [captureOutput setVideoSettings:videoSettings];
    
    dispatch_release(queue);
    
    AVCaptureDevice *selectedCamera;
    
    currentCameraDeviceIndex = -1;
    
    // default to front facing camera
    //
    if ( YES )
    {
        currentCameraDeviceIndex = frontCameraDeviceIndex;
        cameraImageOrientation = UIImageOrientationLeftMirrored;
    }
    else
    {
        currentCameraDeviceIndex = backCameraDeviceIndex;
        cameraImageOrientation = UIImageOrientationRight;
    }
    
    if ( currentCameraDeviceIndex < 0 )
        selectedCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    else
        selectedCamera = [[AVCaptureDevice devices] objectAtIndex:(NSUInteger)currentCameraDeviceIndex];
    
    captureInput = [AVCaptureDeviceInput deviceInputWithDevice:selectedCamera error:nil];
    
    if ( [selectedCamera lockForConfiguration:nil] )
    {
        if ( [selectedCamera isExposureModeSupported:AVCaptureExposureModeContinuousAutoExposure] )
        {
            [selectedCamera setExposureMode:AVCaptureExposureModeContinuousAutoExposure];
        }
        
        if ( [selectedCamera isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance] )
        {
            [selectedCamera setWhiteBalanceMode:AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance];
        }
        
        if ( [selectedCamera isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus] )
        {
            [selectedCamera setFocusMode:AVCaptureFocusModeContinuousAutoFocus];
        }
        
        if ( [selectedCamera isTorchModeSupported:AVCaptureTorchModeAuto] )
        {
            [selectedCamera setTorchMode:AVCaptureTorchModeOff];    // AVCaptureTorchModeOn turns the "torch" light ON
        }
        
        if ( [selectedCamera isFlashModeSupported:AVCaptureFlashModeAuto] )
        {
            [selectedCamera setFlashMode:AVCaptureFlashModeAuto];   // AVCaptureFlashModeAuto
        }
        
        [selectedCamera unlockForConfiguration];
    }
    
    captureSession = [[AVCaptureSession alloc] init];
    [captureSession beginConfiguration];
    
    if ( [selectedCamera supportsAVCaptureSessionPreset:AVCaptureSessionPreset640x480])
    {
        cameraDeviceSetting = CameraDeviceSetting640x480;
        [captureSession setSessionPreset:AVCaptureSessionPreset640x480];    // AVCaptureSessionPresetHigh or AVCaptureSessionPreset640x480
    }
    else
        if ( [selectedCamera supportsAVCaptureSessionPreset:AVCaptureSessionPresetHigh] )
        {
            cameraDeviceSetting = CameraDeviceSettingHigh;
            [captureSession setSessionPreset:AVCaptureSessionPresetHigh];   // AVCaptureSessionPresetHigh or AVCaptureSessionPreset640x480
        }
        else
            if ( [selectedCamera supportsAVCaptureSessionPreset:AVCaptureSessionPresetMedium] )
            {
                cameraDeviceSetting = CameraDeviceSettingMedium;
                [captureSession setSessionPreset:AVCaptureSessionPresetMedium]; // AVCaptureSessionPresetHigh or AVCaptureSessionPreset640x480
            }
            else
                if ( [selectedCamera supportsAVCaptureSessionPreset:AVCaptureSessionPresetLow] )
                {
                    cameraDeviceSetting = CameraDeviceSettingLow;
                    [captureSession setSessionPreset:AVCaptureSessionPresetLow];    // AVCaptureSessionPresetHigh or AVCaptureSessionPreset640x480
                }   
    
    [captureSession addInput:captureInput];
    [captureSession addOutput:captureOutput];
    [captureSession commitConfiguration];
    
    [captureSession startRunning];
}

- (void)cameraSwapAnimation:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
}

- (void) swapCameras
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(cameraSwapAnimation:finished:context:)];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self view] cache:YES];
    [UIView commitAnimations];
    
    [captureSession stopRunning];
    [captureSession beginConfiguration];
    [captureSession removeInput:captureInput];
    
    if ( currentCameraDeviceIndex==frontCameraDeviceIndex )
    {
        currentCameraDeviceIndex = backCameraDeviceIndex;
        cameraImageOrientation = UIImageOrientationRight;
    }
    else
    {
        currentCameraDeviceIndex = frontCameraDeviceIndex;
        cameraImageOrientation = UIImageOrientationLeftMirrored;
    }
    
    //
    // Re-map the Open/GL to account for imageOrientation change
    //
    [self mapGLViewForOrientation:UIInterfaceOrientationPortrait];
    
    // Start the Camera
    //
    AVCaptureDevice *selectedCamera = [[AVCaptureDevice devices] objectAtIndex:(NSUInteger)currentCameraDeviceIndex];
    
    captureInput = [AVCaptureDeviceInput deviceInputWithDevice:selectedCamera error:nil];
    
    if ( [selectedCamera lockForConfiguration:nil] )
    {
        if ( [selectedCamera isExposureModeSupported:AVCaptureExposureModeContinuousAutoExposure] )
        {
            [selectedCamera setExposureMode:AVCaptureExposureModeContinuousAutoExposure];
        }
        
        if ( [selectedCamera isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance] )
        {
            [selectedCamera setWhiteBalanceMode:AVCaptureWhiteBalanceModeContinuousAutoWhiteBalance];
        }
        
        if ( [selectedCamera isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus] )
        {
            [selectedCamera setFocusMode:AVCaptureFocusModeContinuousAutoFocus];
        }
        
        if ( [selectedCamera isTorchModeSupported:AVCaptureTorchModeAuto] )
        {
            [selectedCamera setTorchMode:AVCaptureTorchModeOff];    // AVCaptureTorchModeOn turns the "torch" light ON
        }
        
        if ( [selectedCamera isFlashModeSupported:AVCaptureFlashModeAuto] )
        {
            [selectedCamera setFlashMode:AVCaptureFlashModeAuto];   // AVCaptureFlashModeAuto
        }
        
        [selectedCamera unlockForConfiguration];
    }
    
    if ( [selectedCamera supportsAVCaptureSessionPreset:AVCaptureSessionPreset640x480])
    {
        cameraDeviceSetting = CameraDeviceSetting640x480;
        [captureSession setSessionPreset:AVCaptureSessionPreset640x480];    // AVCaptureSessionPresetHigh or AVCaptureSessionPreset640x480
    }
    else
        if ( [selectedCamera supportsAVCaptureSessionPreset:AVCaptureSessionPresetHigh] )
        {
            cameraDeviceSetting = CameraDeviceSettingHigh;
            [captureSession setSessionPreset:AVCaptureSessionPresetHigh];   // AVCaptureSessionPresetHigh or AVCaptureSessionPreset640x480
        }
        else
            if ( [selectedCamera supportsAVCaptureSessionPreset:AVCaptureSessionPresetMedium] )
            {
                cameraDeviceSetting = CameraDeviceSettingMedium;
                [captureSession setSessionPreset:AVCaptureSessionPresetMedium]; // AVCaptureSessionPresetHigh or AVCaptureSessionPreset640x480
            }
            else
                if ( [selectedCamera supportsAVCaptureSessionPreset:AVCaptureSessionPresetLow] )
                {
                    cameraDeviceSetting = CameraDeviceSettingLow;
                    [captureSession setSessionPreset:AVCaptureSessionPresetLow];    // AVCaptureSessionPresetHigh or AVCaptureSessionPreset640x480
                }   
    
    [captureSession addInput:captureInput];
    [captureSession commitConfiguration];
    
    [captureSession startRunning];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    if ( ignoreImageStream )
        return;
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [self performImageCaptureFrom:sampleBuffer];
    [pool drain];
} 

- (void) performImageCaptureFrom:(CMSampleBufferRef)sampleBuffer
{
    CVImageBufferRef imageBuffer;
    
    if ( CMSampleBufferGetNumSamples(sampleBuffer) != 1 )
        return;
    if ( !CMSampleBufferIsValid(sampleBuffer) )
        return;
    if ( !CMSampleBufferDataIsReady(sampleBuffer) )
        return;
    
    imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer); 
    
    if ( CVPixelBufferGetPixelFormatType(imageBuffer) != kCVPixelFormatType_32BGRA )
        return;
    
    CVPixelBufferLockBaseAddress(imageBuffer,0); 
    
    uint8_t *baseAddress = (uint8_t *)CVPixelBufferGetBaseAddress(imageBuffer);
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer); 
    
    CGImageRef newImage = nil;
    
    if ( cameraDeviceSetting == CameraDeviceSetting640x480 )
    {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef newContext = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
        newImage = CGBitmapContextCreateImage(newContext);
        CGColorSpaceRelease( colorSpace );
        CGContextRelease(newContext);
    }
    else
    {
        uint8_t *tempAddress = malloc( 640 * 4 * 480 );
        memcpy( tempAddress, baseAddress, bytesPerRow * height );
        baseAddress = tempAddress;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef newContext = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace,  kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipFirst);
        newImage = CGBitmapContextCreateImage(newContext);
        CGContextRelease(newContext);
        newContext = CGBitmapContextCreate(baseAddress, 640, 480, 8, 640*4, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
        CGContextScaleCTM( newContext, (CGFloat)640/(CGFloat)width, (CGFloat)480/(CGFloat)height );
        CGContextDrawImage(newContext, CGRectMake(0,0,640,480), newImage);
        CGImageRelease(newImage);
        newImage = CGBitmapContextCreateImage(newContext);
        CGColorSpaceRelease( colorSpace );
        CGContextRelease(newContext);
        free( tempAddress );
    }
    
    if ( newImage != nil )
    {
        [self performSelectorOnMainThread:@selector(newCameraImageNotification:) withObject:(id)newImage waitUntilDone:YES];
    }
    
    CVPixelBufferUnlockBaseAddress(imageBuffer,0);
}

static BOOL processingTouchEvent = NO;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ( processingTouchEvent )
        return;
    processingTouchEvent = YES;
    
    [self snapShot];
    [self swapCameras];
    
    processingTouchEvent = NO;
}

- (IBAction)takePhoto:(id)sender {
    
    [self snapShot];
}
- (void)viewDidUnload {
    [self setGoForwardButton:nil];
    [super viewDidUnload];
}
@end