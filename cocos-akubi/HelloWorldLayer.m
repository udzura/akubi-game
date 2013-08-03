//
//  HelloWorldLayer.m
//  cocos-akubi
//
//  Created by Uchio on 2013/08/03.
//  Copyright Uchio 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init]) ) {
        force = CGPointMake(1.0f, 0.0f);
        speedBoost = 30;
		udzura = [self createInstanceWithFile: @"uchio.jpg"];
        udzura.scale = 0.35f;
        udzura.position = ccp( 400/2, 320/2 );
        
        akubi = [self createInstanceWithFile: @"akubi01.jpg"];
        akubi.scale = 0.25f;
        akubi.position = ccp( 400/2 * 2 , 320/2 );

        [self addChild: udzura];
        [self addChild: akubi];
        
        [self schedule: @selector(nextFrame:)];
        
        [self setMouseEnabled: YES];

//		// create and initialize a Label
//		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
//
//		// ask director for the window size
//		CGSize size = [[CCDirector sharedDirector] winSize];
//	
//		// position the label on the center of the screen
//		label.position =  ccp( size.width /2 , size.height/2 );
//		
//		// add the label as a child to this Layer
//		[self addChild: label];
	}
	return self;
}

- (void) nextFrame: (ccTime) dt
{
    speedBoost = speedBoost + 1.0f;
    // NSLog(@"speedBoost = %f", speedBoost);
    akubi.position = ccp(
        akubi.position.x + force.x * speedBoost * dt,
        akubi.position.y + force.y * speedBoost * dt
    );
    CGSize win = [[CCDirector sharedDirector] winSize];
    if (akubi.position.x < 0 || akubi.position.x > win.width) {
        force = CGPointMake(-force.x, force.y);
    }
    if (akubi.position.y < 0 || akubi.position.y > win.height) {
        force = CGPointMake(force.x, -force.y);
    }
}

- (BOOL) ccMouseDown:(NSEvent *)event
{
    NSPoint mouse = [event locationInWindow];
    NSLog(@"x = %f, y = %f", mouse.x, mouse.y);
    CGPoint dest = CGPointMake(mouse.x - akubi.position.x, mouse.y - akubi.position.y);
    float length = ccpLength(dest);
    force = CGPointMake(dest.x / length, dest.y / length);
    return YES;
}


- (CCSprite *) createInstanceWithFile: (NSString *) name
{
    return [[CCSprite alloc] initWithFile: name];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
    [udzura release];
    [akubi release];
    
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
