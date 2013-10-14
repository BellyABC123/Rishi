//
//  EnemyFactory.h
//  Rishi
//
//  Created by Abhineet Prasad on 25/08/13.
//
//

#import <Foundation/Foundation.h>
#import "Enemy.h"
#import "CommonProtocols.h"
#import "ArcherEnemy.h"

@interface EnemyFactory : NSObject

-(Enemy*) makeEnemy:(EnemyType) enemyType;
@end
