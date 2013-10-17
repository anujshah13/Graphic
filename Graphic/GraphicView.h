//
//  GraphicView.h
//  Graphic
//
//  Created by Anuj Shah on 10/14/13.
//  Copyright (c) 2013 Anuj Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DEG2RAD(angle) angle*M_PI/180.0

#define INITIAL_ANGLE 180
#define ENDING_ANGLE 0
#define CENTER_WIDTH 8

@interface GraphicView : UIView{
    int angleSeconds;
    int angleMinute;
    int angleHours;
}

//- (id) initWithInitialTime:(int)Hours:(int) Minutes:(int) Seconds;

@end
