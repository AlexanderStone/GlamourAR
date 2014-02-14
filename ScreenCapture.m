//
//  ScreenCapture.m
//  LiveEffectsCam
//
//  Created by John Carter on 10/8/10.
//

#import "ScreenCapture.h"

#import <QuartzCore/CABase.h>
#import <QuartzCore/CATransform3D.h>
#import <QuartzCore/CALayer.h>
#import <QuartzCore/CAScrollLayer.h>

#import <OpenGLES/EAGL.h>

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGLDrawable.h>


@implementation ScreenCapture


//
//
//+ (UIImage *) GLViewToImage:(GLView *)glView
//{
//    UIImage *glImage = [GLView snapshot:glView];                            // returns an autoreleased image
//    
//    return glImage;
//}



//+ (UIImage *) GLViewToImage:(GLView *)glView withOverlayImage:(UIImage *)overlayImage
//{
//    UIImage *glImage = [GLView snapshot:glView];                            // returns an autoreleased image
//    
//    // Merge Image and Overlay
//    //
//    CGRect imageRect = CGRectMake((CGFloat)0.0, (CGFloat)0.0, glImage.size.width*glImage.scale, glImage.size.height*glImage.scale);
//    CGImageRef overlayCopy = CGImageCreateCopy( overlayImage.CGImage );
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGContextRef context = CGBitmapContextCreate(NULL, (int)glImage.size.width*glImage.scale, (int)glImage.size.height*glImage.scale, 8, (int)glImage.size.width*4*glImage.scale, colorSpace, kCGImageAlphaPremultipliedLast);
//    CGContextDrawImage(context, imageRect, glImage.CGImage);
//    CGContextDrawImage(context, imageRect, overlayCopy);
//    CGImageRef newImage = CGBitmapContextCreateImage(context);
//    UIImage *combinedViewImage = [[[UIImage alloc] initWithCGImage:newImage] autorelease];
//    CGImageRelease(newImage);
//    CGImageRelease(overlayCopy);
//    CGContextRelease(context);
//    CGColorSpaceRelease(colorSpace);
//    
//    return combinedViewImage;
//}




+ (UIImage *) UIViewToImage:(UIView *)view withOverlayImage:(UIImage *)overlayImage
{
    UIImage *viewImage = [ScreenCapture UIViewToImage:view];                            // returns an autoreleased image
    
    
    // Merge Image and Overlay
    //
    CGRect imageRect = CGRectMake((CGFloat)0.0, (CGFloat)0.0, viewImage.size.width*viewImage.scale, viewImage.size.height*viewImage.scale);
    CGImageRef overlayCopy = CGImageCreateCopy( overlayImage.CGImage );
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, (int)viewImage.size.width*viewImage.scale, (int)viewImage.size.height*viewImage.scale, 8, (int)viewImage.size.width*4*viewImage.scale, colorSpace, kCGImageAlphaPremultipliedLast);
    CGContextDrawImage(context, imageRect, viewImage.CGImage);
    CGContextDrawImage(context, imageRect, overlayCopy);
    CGImageRef newImage = CGBitmapContextCreateImage(context);
    UIImage *combinedViewImage = [[UIImage alloc] initWithCGImage:newImage] ;
    CGImageRelease(newImage);
    CGImageRelease(overlayCopy);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    return combinedViewImage;
}



+ (UIImage *) UIViewToImage:(UIView *)view
{
    // Create a graphics context with the target size
    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
    //
    //  CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    CGSize imageSize = CGSizeMake( (CGFloat)320, (CGFloat)480);        // camera image size
    
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSAssert(context!=nil,@"graphics context is nil!");
    // Start with the view...
    //
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, [view center].x, [view center].y);
    CGContextConcatCTM(context, [view transform]);
    CGContextTranslateCTM(context,-[view bounds].size.width * [[view layer] anchorPoint].x,-[view bounds].size.height * [[view layer] anchorPoint].y);
    [[view layer] renderInContext:context];
    CGContextRestoreGState(context);
    
    // ...then repeat for every subview from back to front
    //
    for (UIView *subView in [view subviews]) 
    {
        if ( [subView respondsToSelector:@selector(screen)] )
            if ( [(UIWindow *)subView screen] == [UIScreen mainScreen] )
                continue;
        
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, [subView center].x, [subView center].y);
        CGContextConcatCTM(context, [subView transform]);
        CGContextTranslateCTM(context,-[subView bounds].size.width * [[subView layer] anchorPoint].x,-[subView bounds].size.height * [[subView layer] anchorPoint].y);
     
         [[subView layer] renderInContext:context];
//     for (CALayer* sublayer in   subView.layer.sublayers)
//      {
//          [sublayer renderInContext:context];
//      }
       
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();   // autoreleased image
    
    UIGraphicsEndImageContext();
    
    return image;
}
//
//+ (UIImage *) snapshot:(GLView *)eaglview
//{
//    NSInteger x = 0;
//    NSInteger y = 0;
//    NSInteger width = [eaglview backingWidth];
//    NSInteger height = [eaglview backingHeight];
//    NSInteger dataLength = width * height * 4;
//    
//    NSUInteger i;
//    for ( i=0; i<100; i++ )
//    {
//        glFlush();
//        CFRunLoopRunInMode(kCFRunLoopDefaultMode, (float)1.0/(float)60.0, FALSE);
//    }
//    
//    GLubyte *data = (GLubyte*)malloc(dataLength * sizeof(GLubyte));
//    
//    // Read pixel data from the framebuffer
//    //
//    glPixelStorei(GL_PACK_ALIGNMENT, 4);
//    glReadPixels(x, y, width, height, GL_RGBA, GL_UNSIGNED_BYTE, data);
//    
//    // Create a CGImage with the pixel data
//    // If your OpenGL ES content is opaque, use kCGImageAlphaNoneSkipLast to ignore the alpha channel
//    // otherwise, use kCGImageAlphaPremultipliedLast
//    //
//    CGDataProviderRef ref = CGDataProviderCreateWithData(NULL, data, dataLength, NULL);
//    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
//    CGImageRef iref = CGImageCreate(width, height, 8, 32, width * 4, colorspace, kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast, ref, NULL, true, kCGRenderingIntentDefault);
//    
//    // OpenGL ES measures data in PIXELS
//    // Create a graphics context with the target size measured in POINTS
//    //
//    NSInteger widthInPoints;
//    NSInteger heightInPoints;
//    
//    if (NULL != UIGraphicsBeginImageContextWithOptions)
//    {
//        // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
//        // Set the scale parameter to your OpenGL ES view's contentScaleFactor
//        // so that you get a high-resolution snapshot when its value is greater than 1.0
//        //
//        CGFloat scale = eaglview.contentScaleFactor;
//        widthInPoints = width / scale;
//        heightInPoints = height / scale;
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(widthInPoints, heightInPoints), NO, scale);
//    }
//    else
//    {
//        // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
//        //
//        widthInPoints = width;
//        heightInPoints = height;
//        UIGraphicsBeginImageContext(CGSizeMake(widthInPoints, heightInPoints));
//    }
//    
//    CGContextRef cgcontext = UIGraphicsGetCurrentContext();
//    
//    // UIKit coordinate system is upside down to GL/Quartz coordinate system
//    // Flip the CGImage by rendering it to the flipped bitmap context
//    // The size of the destination area is measured in POINTS
//    //
//    CGContextSetBlendMode(cgcontext, kCGBlendModeCopy);
//    CGContextDrawImage(cgcontext, CGRectMake(0.0, 0.0, widthInPoints, heightInPoints), iref);
//    
//    // Retrieve the UIImage from the current context
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();   // autoreleased image
//    
//    UIGraphicsEndImageContext();
//    
//    // Clean up
//    free(data);
//    CFRelease(ref);
//    CFRelease(colorspace);
//    CGImageRelease(iref);
//    
//    return image;
//}
//




+ (UIImage *) GLViewToImage:(GLView *)glView
{
    UIImage *glImage = [GLView snapshot:glView];                            // returns an autoreleased image
    
    return glImage;
}


@end