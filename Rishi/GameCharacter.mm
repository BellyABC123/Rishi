//
//  GameCharacter.m
//  Rishi
//
//  Created by Abhineet Prasad on 25/08/13.
//
//

#import "GameCharacter.h"


@implementation GameCharacter
@synthesize isActive,gameCharacterType,touchType,characterState;
CGPoint touchStartLocation;
-(id)initWithFile:(NSString *)filename{
    if(self = [super initWithFile:filename]){
        isActive = YES;
        touchType = kTouchNone;
        characterState = kIdleState;
    }
    return self;
}
- (void)onEnter
{
	[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	[super onEnter];
}

- (void)onExit
{
	[[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
	[super onExit];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    
    CGPoint loc = [touch locationInView:[touch view]];
    CGPoint currentPos = [[CCDirector sharedDirector] convertToGL:loc];
    touchStartLocation = currentPos;
    if(CGRectContainsPoint(self.boundingBox, currentPos)){
        CCLOG(@"start time is %@",[NSDate date]);
        return  YES;
    }
    else
        return NO;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
    CGPoint loc = [touch locationInView:[touch view]];
    loc =[[CCDirector sharedDirector] convertToGL:loc];
    double touchDistanceX= abs(loc.x - touchStartLocation.x);
    double touchDistanceY = abs(loc.y - touchStartLocation.y);
    bool isHorizontal = touchDistanceX>touchDistanceY?YES:NO;
    if(loc.x - touchStartLocation.x> swipeThreshold && isHorizontal){
        touchType = kSwipeRight;
    }else if( touchStartLocation.x - loc.x > swipeThreshold && isHorizontal){
        touchType = kSwipeLeft;
    }else if(loc.y - touchStartLocation.y > swipeThreshold && !isHorizontal){
        touchType = kSwipeUp;
    }else if(touchStartLocation.y - loc.y > swipeThreshold && !isHorizontal){
        touchType = kSwipeDown;
    }else touchType = kClick;
    
}

-(void) logTime{
    CCLOG(@"end time is %@",[NSDate date]);
}


-(void)dealloc{
    [super dealloc];
}

@end
