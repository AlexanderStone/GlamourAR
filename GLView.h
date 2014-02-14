
//
//  GLView.h
//  AugCam
//
//  Created by John Carter on 1/26/2012.
//

#define HIRESDEVICE (((int)rintf([[[UIScreen mainScreen] currentMode] size].width/[[UIScreen mainScreen] bounds].size.width )>1))

#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGLDrawable.h>

@interface GLView : UIView
{
@private
    /* The pixel dimensions of the backbuffer */
    GLint backingWidth;
    GLint backingHeight;
    
    EAGLContext *context;
    
    /* OpenGL names for the renderbuffer and framebuffers used to render to this view */
    GLuint viewRenderbuffer;
    GLuint viewFramebuffer;
    GLuint depthRenderbuffer;
    
    /* OpenGL name for the sprite texture */
    GLuint spriteTexture;
}

@property (readonly) GLint backingWidth;
@property (readonly) GLint backingHeight;
@property (readonly) EAGLContext *context;

- (void) drawView;
+ (UIImage *) snapshot:(GLView *)eaglview;

@end