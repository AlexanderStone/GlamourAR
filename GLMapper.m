//
//  GLMapper.m
//  AugCam
//
//  Created by John Carter on 1/26/2012.
//

#import "GLMapper.h"

static CGFloat aspectAdjustment = 1.333;

// FOUR PANELS
//
static int planeDefVertexCount=24;
static const GLfloat planeDef[] =
{
    -1.0f,  0.0f,   0.0f,
    -1.0f,  1.0f,   0.0f,
    0.0f,   0.0f,   0.0f,   
    
    0.0f,   0.0f,   0.0f,
    -1.0f,  1.0f,   0.0f,
    0.0f,   1.0f,   0.0f,   
    
    0.0f,   0.0f,   0.0f,
    0.0f,   1.0f,   0.0f,
    1.0f,   1.0f,   0.0f,   
    
    0.0f,   0.0f,   0.0f,
    1.0f,   1.0f,   0.0f,
    1.0f,   0.0f,   0.0f,   
    
    -1.0f,  -1.0f,  0.0f,
    -1.0f,  0.0f,   0.0f,
    0.0f,   0.0f,   0.0f,   
    
    -1.0f,  -1.0f,  0.0f,
    0.0f,   0.0f,   0.0f,
    0.0f,   -1.0f,  0.0f,   
    
    0.0f,   -1.0f,  0.0f,
    0.0f,   0.0f,   0.0f,
    1.0f,   -1.0f,  0.0f,   
    
    1.0f,   -1.0f,  0.0f,
    0.0f,   0.0f,   0.0f,
    1.0f,   0.0f,   0.0f,
};

@implementation GLMapper

@synthesize vertexCount;
@synthesize vertexData;
@synthesize textureData;

- (void) dealloc
{
    if ( vertexData != NULL )
    {
        free( vertexData );
        vertexData=NULL;
    }
    
    if ( textureData != NULL )
    {
        free( textureData );
        textureData=NULL;
    }
    
   
}

- (id) init
{
    self = [super init];
    
    vertexCount=0;
    vertexData=NULL;
    textureData=NULL;
    
    return self;
}

- (void) buildTextureMap:(NSUInteger)buildOptions forOrientation:(UIInterfaceOrientation)toInterfaceOrientation frontCamera:(BOOL)frontCamera
{
    int i;
    int textureIndex = 0;
    int vertexIndex = 0;
    GLfloat xMinVertex = FLT_MAX;
    GLfloat yMinVertex = FLT_MAX;
    GLfloat xMaxVertex = -FLT_MAX;
    GLfloat yMaxVertex = -FLT_MAX;
    
    if ( textureData != NULL )
    {
        free( textureData );
        textureData=NULL;
    }
    
    textureData = (GLfloat *)malloc(sizeof(GLfloat) * vertexCount * 2);
    memset(textureData, (unsigned int)0, sizeof(GLfloat) * vertexCount * 2);
    
    for ( i=0; i<vertexCount*3; i+=3 )
    {
        if ( vertexData[i+0] < xMinVertex )
            xMinVertex = vertexData[i+0] ;
        if ( vertexData[i+1] < yMinVertex )
            yMinVertex = vertexData[i+1] ;
        
        if ( vertexData[i+0] > xMaxVertex )
            xMaxVertex = vertexData[i+0] ;
        if ( vertexData[i+1] > yMaxVertex )
            yMaxVertex = vertexData[i+1] ;
    }
    
    GLfloat xVertexRange = fabs(xMaxVertex - xMinVertex);
    GLfloat yVertexRange = fabs(yMaxVertex - yMinVertex);
    
    double vertexPctX;
    double vertexPctY;
    double texturePointX;
    double texturePointY;
    double texturePointXsizeAdjusted;
    double texturePointYsizeAdjusted;
    
    GLfloat xMinTexture = FLT_MAX;
    GLfloat yMinTexture = FLT_MAX;
    GLfloat xMaxTexture = -FLT_MAX;
    GLfloat yMaxTexture = -FLT_MAX;
    
    //
    // TEXTURE COORDINATES
    //
    for ( i=0; i<vertexCount; i++ )
    {
        vertexIndex = i*3;
        textureIndex = i*2;
        
        vertexPctX = (double)((vertexData[vertexIndex+0] - xMinVertex) / xVertexRange);
        vertexPctY = (double)((vertexData[vertexIndex+1] - yMinVertex) / yVertexRange);
        
        if ( frontCamera )
        {
            texturePointX = (double)1024.0 - (double)vertexPctY * (double)1024.0;
            texturePointY = (double)vertexPctX * (double)1024.0;
        }
        else
        {
            texturePointX = (double)1024.0 - (double)vertexPctY * (double)1024.0;
            texturePointY = (double)1024.0 - (double)vertexPctX * (double)1024.0;
        }
        
        texturePointXsizeAdjusted = texturePointX * (double)((double)640.0 / (double)1024.0);
        texturePointYsizeAdjusted = texturePointY * (double)((double)480.0 / (double)1024.0) + (double)544.0;
        
        textureData[textureIndex+0] = (GLfloat)texturePointXsizeAdjusted/1024.0;
        textureData[textureIndex+1] = (GLfloat)texturePointYsizeAdjusted/1024.0;
        
        if ( textureData[textureIndex+0] < xMinTexture )
            xMinTexture = textureData[textureIndex+0] ;
        if ( textureData[textureIndex+1] < yMinTexture )
            yMinTexture = textureData[textureIndex+1] ;
        
        if ( textureData[textureIndex+0] > xMaxTexture )
            xMaxTexture = textureData[textureIndex+0] ;
        if ( textureData[textureIndex+1] > yMaxTexture )
            yMaxTexture = textureData[textureIndex+1] ;
    }
}

- (void) buildVertexMap:(NSUInteger)buildOptions
{
    [self buildVertexMap:buildOptions scale:(GLfloat)1.0];
}

- (void) buildVertexMap:(NSUInteger)buildOptions scale:(GLfloat)scaleOption
{
    int i;
    int vertexIndex = 0;
    
    if ( vertexData != NULL )
    {
        free( vertexData );
        vertexData=NULL;
    }
    vertexCount=0;
    
    modelScale = (GLfloat)1.0;
    
    if ( scaleOption > (GLfloat)0.0 )
        modelScale = scaleOption;
    
    GLfloat xScale = modelScale;
    GLfloat yScale = modelScale * aspectAdjustment;
    GLfloat zScale = modelScale;
    
    vertexCount = planeDefVertexCount;
    
    vertexData = (GLfloat *)malloc( sizeof(GLfloat) * vertexCount * 3 );
    memset( vertexData, (unsigned char)0, sizeof(GLfloat) * vertexCount * 3 );
    
    for ( i=0; i<vertexCount*3; i+=3 )
    {
        vertexData[vertexIndex+0] = planeDef[i+0] * xScale;
        vertexData[vertexIndex+1] = planeDef[i+1] * yScale;
        vertexData[vertexIndex+2] = planeDef[i+2] * zScale;
        vertexIndex+=3;
    }
}

@end