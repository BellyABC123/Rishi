//
//  Enemy.h
//  Rishi
//
//  Created by Abhineet Prasad on 25/08/13.
//
//

#import "GameCharacter.h"
#import "Weapon.h"
@interface Enemy : GameCharacter{
    
    double health;
    Weapon* weapon;
    
}

-(void) aimAtHero;
-(void) attackHero;

@end
