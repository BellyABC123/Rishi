//
//  CommonProtocols.h
//  PunchGame
//
//  Created by Abhineet Prasad on 19/02/13.
//  Copyright (c) 2013 abhineetpr@gmail.com. All rights reserved.
//

#ifndef Rishi_CommonProtocols_h
#define Rishi_CommonProtocols_h

#define PTM_RATIO 32
#define swipeThreshold 4


typedef enum {
    kRishiType
    
} GameCharacterType;

typedef enum {
    kArcherEnemyType
} EnemyType;

typedef enum{
    kClick,
    kSwipeLeft,
    kSwipeRight,
    kSwipeUp,
    kSwipeDown,
    kTouchNone
}TouchType;

typedef enum{
    kRishiCouchAction,
}ActionType;

typedef enum{
    kRishiCouchState,
    kRishiStandingState,
    kIdleState
}GameCharacterState;

#endif
