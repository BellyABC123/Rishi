//
//  PhysicsWorld.m
//  BouncingBall
//
//  Created by Abhineet Prasad on 15/08/13.
//
//

#import "PhysicsWorld.h"

@implementation PhysicsWorld{
  
}
static b2World* world =nil;

+(b2World*) getWorld{
    if(world == nil){
        b2Vec2 gravity = b2Vec2(0.0f,-9.8f);
        world = new b2World(gravity);
        world->SetAllowSleeping(YES);
        world->SetContinuousPhysics(true);
    }
    return world;
}

-(void) dealloc
{
	delete world;
	world = NULL;
	
	
	[super dealloc];
}

@end
