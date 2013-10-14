//
//  PhysicsWorld.h
//  BouncingBall
//
//  Created by Abhineet Prasad on 15/08/13.
//
//

#import <Foundation/Foundation.h>
#import "Box2D.h"

@interface PhysicsWorld : NSObject


+(b2World*) getWorld;
@end
