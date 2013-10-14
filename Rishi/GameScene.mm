//
//  GameScene.m
//  Rishi
//
//  Created by Abhineet Prasad on 20/09/13.
//
//

#import "GameScene.h"


@implementation GameScene

-(void) dealloc{
    [self removeAllChildrenWithCleanup:YES];
    CCLOG(@"game scene dealloc called");
    [super dealloc];
}
-(void)pauseGame{
    
   // [[self getChildByTag:21] showPauseLayer:NO];
}
-(id) init{
    self = [super init];
    BackgroundLayer* background = [BackgroundLayer node];
    GameWorldLayer* gameLayer = [GameWorldLayer node];
    
    if(self != nil){
        [self addChild:background z:0 tag:11];
        [self addChild:gameLayer z:5 tag:21];
    }
    return self;
}

@end
