//
//  EnemyFactory.m
//  Rishi
//
//  Created by Abhineet Prasad on 25/08/13.
//
//

#import "EnemyFactory.h"

@implementation EnemyFactory


-(Enemy*) makeEnemy:(EnemyType) enemyType{
    
    Enemy* enemy = nil;
    switch (enemyType) {
        case kArcherEnemyType:
            enemy =  [[ArcherEnemy alloc] initializeEnemy];
            break;
            
        default:
            break;
    }
    
    return enemy;
}

@end
