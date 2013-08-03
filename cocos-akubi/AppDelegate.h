//
//  AppDelegate.h
//  cocos-akubi
//
//  Created by Uchio on 2013/08/03.
//  Copyright Uchio 2013. All rights reserved.
//

#import "cocos2d.h"

@interface cocos_akubiAppDelegate : NSObject <NSApplicationDelegate>
{
	NSWindow	*window_;
	CCGLView	*glView_;
}

@property (assign) IBOutlet NSWindow	*window;
@property (assign) IBOutlet CCGLView	*glView;

- (IBAction)toggleFullScreen:(id)sender;

@end
