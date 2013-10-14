//
//  BackgroundLayer.m
//  Rishi
//
//  Created by Abhineet Prasad on 20/09/13.
//
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer

-(void) dealloc{
    
    CCLOG(@"Game Background deallocated");
    [self removeAllChildrenWithCleanup:YES];
    [self removeFromParentAndCleanup:YES];
    [super dealloc];
}

-(id) init{
    
    self =[super init];
    CGSize screenSize = [[CCDirector sharedDirector]winSize];
    CCSprite* backgroundImage ;
    backgroundImage =[CCSprite spriteWithFile:@"background.png"];
    [backgroundImage setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
    [self addChild:backgroundImage z:0 tag:0];
    return self;
}

@end
