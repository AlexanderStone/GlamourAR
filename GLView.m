//
//  GLView.m
//  AugCam
//
//  Created by John Carter on 1/26/2012.
//

#define DEGREES_TO_RADIANS(__ANGLE__) ((__ANGLE__) / 180.0 * M_PI)

#import "GLView.h"

// Private Methods
//
@interface GLView()

- (BOOL) createFramebuffer;
- (void) destroyFramebuffer;

@end

@implementation GLView

@synthesize backingWidth;
@synthesize backingHeight;
@synthesize context;

+ (Class) layerClass
{
    return [CAEAGLLayer class];
}

- (id)init
{
    self = [[super init] initWithFrame:CGRectMake(0.0, 0.0, 480.0, 640.0)];     // size of the camera image being captures
    
    if ( self==nil )
        return self;
    
    // Set Content Scaling
    //
    if ( HIRESDEVICE )
    {
        self.contentScaleFactor = (CGFloat)2.0;
    }
    
    // Get our backing layer
    //
    CAEAGLLayer *eaglLayer = (CAEAGLLayer*) self.layer;
    
    // Configure it so that it is opaque, does not retain the contents of the backbuffer when displayed, and uses RGBA8888 color.
    //
    eaglLayer.opaque = YES;
    
    eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithBool:FALSE], kEAGLDrawablePropertyRetainedBacking,
                                    kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat,
                                    nil];
    
    // Create our EAGLContext, and if successful make it current and create our framebuffer.
    //
    context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    
    if(!context || ![EAGLContext setCurrentContext:context] || ![self createFramebuffer])
    {
        
        return nil;
    }
    
    // Final View Settings
    //
    [self setOpaque:YES];
    self.multipleTouchEnabled = YES;
    self.backgroundColor = [UIColor clearColor];
    
    [EAGLContext setCurrentContext:context];
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
    
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    
    GLfloat zNear = 1.0;
    GLfloat zFar = 1000.0;
    GLfloat fieldOfView = 90;       // Lens Angle of View
    GLfloat size = zNear * tanf(DEGREES_TO_RADIANS(fieldOfView) / 2.0);
    CGRect rect = CGRectMake( (CGFloat)0.0, (CGFloat)0.0, backingWidth, backingHeight);
    
    glFrustumf(-size, size, -size / (rect.size.width / rect.size.height), size / (rect.size.width / rect.size.height), zNear, zFar);
    
    glViewport(0, 0, backingWidth, backingHeight);
    
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LESS);
    glEnable(GL_MULTISAMPLE);
    glEnable(GL_LINE_SMOOTH);
    glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
    glHint(GL_LINE_SMOOTH_HINT, GL_NICEST);
    glHint(GL_POINT_SMOOTH_HINT, GL_NICEST);
    glDisable(GL_ALPHA_TEST);
    
    // Turn Translucent Textures: OFF
    //
    glDisable(GL_BLEND);
    
    //  // Turn Translucent Textures: ON
    //  //
    //  glEnable(GL_BLEND);
    //  glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
    
    return self;
}

- (void) drawView
{
    [context presentRenderbuffer:GL_RENDERBUFFER_OES];
}

- (BOOL)createFramebuffer
{
    // Generate IDs for a framebuffer object and a color renderbuffer
    //
    glGenFramebuffersOES(1, &viewFramebuffer);
    glGenRenderbuffersOES(1, &viewRenderbuffer);
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
    
    // This call associates the storage for the current render buffer with the EAGLDrawable (our CAEAGLLayer)
    // allowing us to draw into a buffer that will later be rendered to screen whereever the layer is (which corresponds with our view).
    //
    [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:(CAEAGLLayer*)self.layer];
    
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, viewRenderbuffer);
    
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);
    
    // If this app uses a depth buffer, we'll create and attach one via another renderbuffer.
    //
    if ( YES )
    {
        glGenRenderbuffersOES(1, &depthRenderbuffer);
        glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthRenderbuffer);
        glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES, backingWidth, backingHeight);
        glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthRenderbuffer);
    }   
    
    if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
    {
        NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
        return NO;
    }
    
    return YES;
}

- (void) destroyFramebuffer
{
    glDeleteFramebuffersOES(1, &viewFramebuffer);
    viewFramebuffer = 0;
    
    glDeleteRenderbuffersOES(1, &viewRenderbuffer);
    viewRenderbuffer = 0;
    
    if(depthRenderbuffer)
    {
        glDeleteRenderbuffersOES(1, &depthRenderbuffer);
        depthRenderbuffer = 0;
    }
}

+ (UIImage *) snapshot:(GLView *)eaglview
{
    NSInteger x = 0;
    NSInteger y = 0;
    NSInteger width = [eaglview backingWidth];
    NSInteger height = [eaglview backingHeight];
    NSInteger dataLength = width * height * 4;
    
    NSUInteger i;
    for ( i=0; i<100; i++ )
    {
        glFlush();
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, (float)1.0/(float)60.0, FALSE);
    }
    
    GLubyte *data = (GLubyte*)malloc(dataLength * sizeof(GLubyte));
    
    // Read pixel data from the framebuffer
    //
    glPixelStorei(GL_PACK_ALIGNMENT, 4);
    glReadPixels(x, y, width, height, GL_RGBA, GL_UNSIGNED_BYTE, data);
    
    // Create a CGImage with the pixel data
    // If your OpenGL ES content is opaque, use kCGImageAlphaNoneSkipLast to ignore the alpha channel
    // otherwise, use kCGImageAlphaPremultipliedLast
    //
    CGDataProviderRef ref = CGDataProviderCreateWithData(NULL, data, dataLength, NULL);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGImageRef iref = CGImageCreate(width, height, 8, 32, width * 4, colorspace, kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast, ref, NULL, true, kCGRenderingIntentDefault);
    
    // OpenGL ES measures data in PIXELS
    // Create a graphics context with the target size measured in POINTS
    //
    NSInteger widthInPoints;
    NSInteger heightInPoints;
    
    if (NULL != UIGraphicsBeginImageContextWithOptions)
    {
        // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
        // Set the scale parameter to your OpenGL ES view's contentScaleFactor
        // so that you get a high-resolution snapshot when its value is greater than 1.0
        //
        CGFloat scale = eaglview.contentScaleFactor;
        widthInPoints = width / scale;
        heightInPoints = height / scale;
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(widthInPoints, heightInPoints), NO, scale);
    }
    else
    {
        // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
        //
        widthInPoints = width;
        heightInPoints = height;
        UIGraphicsBeginImageContext(CGSizeMake(widthInPoints, heightInPoints));
    }
    
    CGContextRef cgcontext = UIGraphicsGetCurrentContext();
    
    // UIKit coordinate system is upside down to GL/Quartz coordinate system
    // Flip the CGImage by rendering it to the flipped bitmap context
    // The size of the destination area is measured in POINTS
    //
    CGContextSetBlendMode(cgcontext, kCGBlendModeCopy);
    CGContextDrawImage(cgcontext, CGRectMake(0.0, 0.0, widthInPoints, heightInPoints), iref);
    
    // Retrieve the UIImage from the current context
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();   // autoreleased image
    
    UIGraphicsEndImageContext();
    
    // Clean up
    free(data);
    CFRelease(ref);
    CFRelease(colorspace);
    CGImageRelease(iref);
    
    return image;
}

@end