//
//  GraphicAppDelegate.h
//  Graphic
//
//  Created by Anuj Shah on 10/14/13.
//  Copyright (c) 2013 Anuj Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GraphicView;
@class GraphicClass;
@class GraphicClock;
@class GraphicRect;

@interface GraphicAppDelegate : UIResponder <UIApplicationDelegate>{
    GraphicView *view;
    GraphicClass *viewRect;
    GraphicClock *viewClock;
    GraphicRect *viewTriang;
}

@property (strong, nonatomic) UIWindow *window;

@end
