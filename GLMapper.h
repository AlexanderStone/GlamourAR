//
//  GLMapper.h
//  AugCam
//
//  Created by John Carter on 1/26/2012.
//

#import "GLView.h"

@interface GLMapper : NSObject
{
    // VERTICIES
    //
    GLfloat modelScale;
    int vertexCount;
    GLfloat *vertexData;
    GLfloat *textureData;
}

@property (readonly) int vertexCount;
@property (readonly) GLfloat *vertexData;
@property (readonly) GLfloat *textureData;

- (void) buildVertexMap:(NSUInteger)buildOptions;
- (void) buildVertexMap:(NSUInteger)buildOptions scale:(GLfloat)scaleOption;
- (void) buildTextureMap:(NSUInteger)buildOptions forOrientation:(UIInterfaceOrientation)toInterfaceOrientation frontCamera:(BOOL)useFrontCamera;

@end