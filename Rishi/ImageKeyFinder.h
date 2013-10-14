//
//  ImageKeyFinder.h
//  Rishi
//
//  Created by Abhineet Prasad on 23/09/13.
//
//

#import <Foundation/Foundation.h>
typedef enum{
    EnumSideLeft,
    EnumSideRight
} EnumSide;

typedef enum{
    EnumShadeLight,
    EnumShadeDark
}EnumShade;

typedef struct {
    UIControlState uiControlState;
    EnumSide enumSide;
    EnumShade enumShade;
}ImageKey;

@interface ImageKeyFinder : NSObject
+(NSString*)getImagePath:(ImageKey *)imagekey;
@end
