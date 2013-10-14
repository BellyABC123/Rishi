//
//  Rishi.h
//  Rishi
//
//  Created by Abhineet Prasad on 25/08/13.
//
//

#import "GameCharacter.h"
#import "PhysicsWorld.h"
#import "CommonProtocols.h"

@interface Rishi : GameCharacter<CCTargetedTouchDelegate>{
    double concentrationLevel; //ranges from 0 t0 100
    
}
+(Rishi*) getInstance;
@property (readonly) double concentrationLevel;
@end
