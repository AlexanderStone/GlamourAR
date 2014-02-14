//
//  ScreenCapture.h
//  glamourAR
//
//  Created by Mahmood1 on 1/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLView.h"

@interface ScreenCapture : NSObject

+ (UIImage *) GLViewToImage:(GLView *)glView;
+ (UIImage *) UIViewToImage:(UIView *)view;
+ (UIImage *) UIViewToImage:(UIView *)view withOverlayImage:(UIImage *)overlayImage;

@end
