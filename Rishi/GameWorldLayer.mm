//
//  GameWorldLayer.m
//  Rishi
//
//  Created by Abhineet Prasad on 14/09/13.
//
//

#import "GameWorldLayer.h"
#import "ImageKeyFinder.h"

@implementation GameWorldLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	GameWorldLayer *layer = [GameWorldLayer node];
	[scene addChild: layer];
	return scene;
}

CGSize screenSize;

-(void)createRoom{
    
    
    b2BodyDef roomDef;
    roomDef.position.SetZero();
    
    b2Body* roomBody = [PhysicsWorld getWorld]->CreateBody(&roomDef);
    b2EdgeShape edge;
    edge.Set(b2Vec2(0,10/PTM_RATIO), b2Vec2(screenSize.width/PTM_RATIO,10/PTM_RATIO));
    b2FixtureDef fixtureDef;
    fixtureDef.shape = &edge;
    roomBody->CreateFixture(&fixtureDef);
    edge.Set(b2Vec2(screenSize.width/PTM_RATIO,0), b2Vec2(screenSize.width/PTM_RATIO,screenSize.height/PTM_RATIO));
    roomBody->CreateFixture(&fixtureDef);
    edge.Set(b2Vec2(0,0), b2Vec2(0,screenSize.height/PTM_RATIO));
    roomBody->CreateFixture(&fixtureDef);
    edge.Set(b2Vec2(0,screenSize.height/PTM_RATIO), b2Vec2(screenSize.width/PTM_RATIO,screenSize.height/PTM_RATIO));
    roomBody->CreateFixture(&fixtureDef);
    
}
-(id) init
{
	if( (self=[super init])) {
        
        ImageKey key;
        key.enumShade = EnumShadeDark;
        key.enumSide = EnumSideLeft;
        key.uiControlState = UIControlStateDisabled;
        CCLOG(@"%@",[ImageKeyFinder getImagePath:&key]);
        [self createRoom];
        screenSize = [[CCDirector sharedDirector] winSize];
        //Rishi* rishi = [[Rishi alloc]initWithFile:@"rishi1.png"];
		[self addChild:[Rishi getInstance]];
        [[Rishi getInstance] setPosition:ccp(screenSize.width/2, screenSize.height/2)];
    }
    return self;
}


@end
