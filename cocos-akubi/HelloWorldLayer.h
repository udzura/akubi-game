//
//  HelloWorldLayer.h
//  cocos-akubi
//
//  Created by Uchio on 2013/08/03.
//  Copyright Uchio 2013年. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CCSprite * udzura;
    CCSprite * akubi;
    float speedBoost;
    CGPoint force;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

-(CCSprite *) createInstanceWithFile: (NSString *) name;

@end
