//
//  Rishi.m
//  Rishi
//
//  Created by Abhineet Prasad on 25/08/13.
//
//

#import "Rishi.h"

@implementation Rishi
static Rishi* theRishi;
@synthesize concentrationLevel;

+(Rishi*) getInstance{
    if(theRishi == nil){
        @synchronized(self){
            if(theRishi == nil){
                theRishi = [[Rishi alloc]initWithFile:@"rishi1.png"];
            }
        }
    }
    return  theRishi;
}


-(void)createPhysicsBody{
    b2BodyDef rishiBodyDef;
    rishiBodyDef.type = b2_dynamicBody;
    rishiBodyDef.position.Set(self.position.x/PTM_RATIO, self.position.y/PTM_RATIO);
    rishiBodyDef.userData = self;
    
    body_ = [PhysicsWorld getWorld]->CreateBody(&rishiBodyDef);
    body_->SetGravityScale(0);
    b2PolygonShape rishiPolygon;
    rishiPolygon.SetAsBox(100/PTM_RATIO, 300/PTM_RATIO);
    
    b2FixtureDef rishiFixtureDef;
    rishiFixtureDef.density = 1.0f;
    
}

-(void) initRishiAnim{
    
    if([[CCAnimationCache sharedAnimationCache] animationByName:@"rishiCouchAnim"] == nil){
        CCAnimation* punchedAnim = [CCAnimation animation];
        [punchedAnim addSpriteFrameWithFilename:@"rishi1.png"];
        [punchedAnim addSpriteFrameWithFilename:@"rishi2.png"];
        [punchedAnim addSpriteFrameWithFilename:@"rishi2.png"];
        [punchedAnim addSpriteFrameWithFilename:@"rishi3.png"];
        [punchedAnim addSpriteFrameWithFilename:@"rishi3.png"];
        [[CCAnimationCache sharedAnimationCache] addAnimation:punchedAnim name:@"rishiCouchAnim"];
    }
}

-(id) getAction:(ActionType)actionType{
    CCAnimation *rishiCouchAnim ;
    id action;
    switch (actionType) {
        case kRishiCouchAction:{
            rishiCouchAnim = [[CCAnimationCache sharedAnimationCache] animationByName:@"rishiCouchAnim"];
            action = [CCAnimate actionWithDuration:0.1f animation:rishiCouchAnim restoreOriginalFrame:NO];
        }
            break;
            
        default:
            break;
    }
    return action;
   
}

-(id)initWithFile:(NSString *)filename{
    if(self =  [super initWithFile:filename]){
        [self initRishiAnim];
        gameCharacterType = kRishiType;
        isActive = YES;
        self.tag = gameCharacterType;
        concentrationLevel = 100;
        [self createPhysicsBody];
        [self scheduleUpdate];
        characterState = kRishiStandingState;
    }
    return self;
}
-(void)setPosition:(CGPoint)position{
    [super setPosition:position];
    body_->SetTransform(b2Vec2(position.x/PTM_RATIO,position.y/PTM_RATIO), body_->GetAngle());
}

-(void)update:(ccTime) dt{
    b2World* world = [PhysicsWorld getWorld];
    world->Step(dt, 10, 10);
    for(b2Body * b = world->GetBodyList();b;b=b->GetNext()){
        if(b->GetUserData()!=nil){
            GameCharacter* gameSprite = (GameCharacter*)b->GetUserData();
            if(gameSprite.gameCharacterType == gameCharacterType){
                gameSprite.position = ccp(b->GetPosition().x * PTM_RATIO, b->GetPosition().y * PTM_RATIO);
                gameSprite.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
            }else
                continue;
        }
    }
    
        switch (touchType) {
            case kSwipeDown:{
                if(characterState == kRishiStandingState) {
                    [self runAction:[CCSequence actions:[self getAction:kRishiCouchAction],[CCCallFunc actionWithTarget:self selector:@selector(logTime)], nil]];
                    characterState = kRishiCouchState;
                    touchType = kTouchNone;
                }
            }
                break;
            case kSwipeUp:
                if(characterState == kRishiCouchState){
                    [self runAction:[[self getAction:kRishiCouchAction ] reverse]];
                    characterState = kRishiStandingState;
                    touchType = kTouchNone;
                }
            default:
                break;
        
        }
}
//-(void) logTime{
//    CCLOG(@"end time is %@",[NSDate date]);
//}

-(void)dealloc{
    body_=nil;
    [super dealloc];
    
    
}

@end
