//
//  GameWorldLayer.h
//  Rishi
//
//  Created by Abhineet Prasad on 14/09/13.
//
//
#import <GameKit/GameKit.h>
#import "CCLayer.h"
#import "cocos2d.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "PhysicsWorld.h"
#import "CommonProtocols.h"
#import "Rishi.h"

@interface GameWorldLayer : CCLayer
+(CCScene *) scene;
@end
