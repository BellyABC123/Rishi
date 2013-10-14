//
//  GameCharacter.h
//  Rishi
//
//  Created by Abhineet Prasad on 25/08/13.
//
//

#import "PhysicsSprite.h"
#import "CommonProtocols.h"

@interface GameCharacter : PhysicsSprite<CCTargetedTouchDelegate>{
    
    GameCharacterType gameCharacterType;
    BOOL isActive;
    TouchType touchType;
    GameCharacterState characterState;
}

@property(readwrite) BOOL isActive;
@property(readwrite) GameCharacterType gameCharacterType;
@property(readwrite) TouchType touchType;
@property(readwrite) GameCharacterState characterState;
@end
