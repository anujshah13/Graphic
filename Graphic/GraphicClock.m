//
//  GraphicClock.m
//  Graphic
//
//  Created by Anuj Shah on 10/16/13.
//  Copyright (c) 2013 Anuj Shah. All rights reserved.
//

#import "GraphicClock.h"

@implementation GraphicClock

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
     //   self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    
    //CGPoint p = CGPointZero;
    
    
    //  CGFloat w = self.bounds.size.width;
    //CGFloat h = self.bounds.size.height;
    //self.bounds = CGRectMake(-w / 2, -h / 2, w, h);
    
    CGRect bounds = self.bounds;
    CGFloat rad = .35 * bounds.size.width;
	CGFloat radius = .3 * bounds.size.width;
    CGFloat minRadius = .25 * bounds.size.width;
    CGFloat hrRadius = 0.2 * bounds.size.width;
    
    CGAffineTransform translate = CGAffineTransformMakeTranslation(
                                                                   bounds.size.width / 2,
                                                                   bounds.size.height / 2
                                                                   );
    
    
    CGFloat angle1 = DEG2RAD2(210);
    CGFloat angle2 = DEG2RAD2(360);
    CGFloat angle3 = DEG2RAD2(90);
    CGFloat initialAngle = DEG2RAD2(90);
    CGPoint startingPoint = CGPointMake(radius * cosf(initialAngle), radius * sinf(initialAngle));
    
 	CGRect r = CGRectMake(
                          -rad,
                          -rad,
                          2 * rad,
                          2 * rad
                          );
    
    // self.bounds = r;
    
    NSLog(@"Origin is at %g %g %g %g", self.bounds.origin.x, self.bounds.origin.y, r.origin.x, r.origin.y);
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextConcatCTM(c, translate);
    CGContextBeginPath(c);
    CGContextAddEllipseInRect(c, r);
	CGContextSetRGBFillColor(c, 0.0, 0.0, 0.0, 0.2);	//red, opaque
	CGContextFillPath(c);
    
    NSString *twelve =@"12";
    NSString *three = @"3";
    NSString *six = @"6";
    NSString *nine = @"9";
    
    CGPoint p = CGPointMake(-10, -rad);
    CGPoint q = CGPointMake(-10, +rad-20);
    CGPoint s = CGPointMake(rad-20, -10);
    CGPoint t = CGPointMake(-rad, -10);
    UIFont *f = [UIFont italicSystemFontOfSize:20];
    
    [twelve drawAtPoint:p withFont:f];
    [six drawAtPoint:q withFont:f];
    [three drawAtPoint:s withFont:f];
    [nine drawAtPoint:t withFont:f];
    
    
    
    
     CGContextBeginPath(c);
     CGContextMoveToPoint( c, 0, 0 );
     CGContextAddLineToPoint( c, startingPoint.x, startingPoint.y );
     
     //CGContextTranslateCTM(c, translate);
     //unnecessary here: the path is already empty.
     CGContextAddArc(c, 0, 0, radius, initialAngle, angle1, NO);
     //CGContextAddArcToPoint(c, 112.0, 120.0, 115.0, 150.0, radius);
     //CGContextAddEllipseInRect(c, r);
     CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);	//red, opaque
     CGContextFillPath(c);
     CGContextClosePath(c);
     
     //CGContextRef c = UIGraphicsGetCurrentContext();
     //CGContextConcatCTM(c, translate);
     //CGContextTranslateCTM(c, translate);
     CGContextBeginPath(c);//unnecessary here: the path is already empty.
     CGContextMoveToPoint(c,0,0);
     CGContextAddLineToPoint(c, radius* cosf(angle1), radius*sinf(angle1));
     CGContextAddArc(c, 0, 0, radius, angle1, angle2, NO);
     //CGContextAddArcToPoint(c, 112.0, 120.0, 115.0, 150.0, radius);
     //CGContextAddEllipseInRect(c, r);
     CGContextSetRGBFillColor(c, 0.0, 1.0, 0.0, 1.0);	//red, opaque
     CGContextFillPath(c);
     CGContextClosePath(c);
     
     //CGContextRef c = UIGraphicsGetCurrentContext();
     //CGContextConcatCTM(c, translate);
     //CGContextTranslateCTM(c, translate);
     CGContextBeginPath(c);	//unnecessary here: the path is already empty.
     CGContextMoveToPoint(c,0,0);
     CGContextAddLineToPoint(c, radius* cosf(angle2), radius*sinf(angle2));
     CGContextAddArc(c, 0, 0, radius, angle2, angle3, NO);
     //CGContextAddArcToPoint(c, 112.0, 120.0, 115.0, 150.0, radius);
     //CGContextAddEllipseInRect(c, r);
     CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 1.0);	//red, opaque
     CGContextFillPath(c);
     CGContextClosePath(c);
     
     
    
    /*
    NSLog(@"%d %d %d", angleSeconds, angleMinute, angleHours);
    
    
    CGFloat initAngle = DEG2RAD((angleSeconds + 45)*6);
    CGFloat angleMinutes = DEG2RAD((angleMinute+ 45)*6);
    CGFloat angleHour = DEG2RAD((angleHours + 45)*6);
    
    CGContextBeginPath(c);
    CGContextMoveToPoint(c,0, 0);
    CGContextAddLineToPoint(c, radius * cosf(initAngle) , radius * sinf(initAngle));
    CGContextSetRGBStrokeColor(c, 0.0, 0.0, 1.0, 1);
	CGContextStrokePath(c);
    
    
    CGContextBeginPath(c);
    CGContextMoveToPoint(c,0, 0);
    CGContextAddLineToPoint(c, minRadius * cosf(angleMinutes) , minRadius * sinf(angleMinutes));
    CGContextSetRGBStrokeColor(c, 0.0, 1.0, 0.0, 1);
	CGContextStrokePath(c);
    
    
    CGContextBeginPath(c);
    CGContextMoveToPoint(c,0, 0);
    CGContextAddLineToPoint(c, hrRadius * cosf(angleHour) , hrRadius * sinf(angleHour));
    CGContextSetRGBStrokeColor(c, 1.0, 0.0, 0.0, 1);
	CGContextStrokePath(c);
    
    
    if(angleSeconds*6 != 360)
    {
        angleSeconds++;
    }
    else if(angleSeconds*6 == 360 && angleMinute*6 != 360) {
        angleSeconds = 1;
        angleMinute++;
    }
    else if(angleSeconds*6 == 360 && angleMinute*6 == 360 && angleHours*6 != 360)
    {
        angleHours++;
        angleMinute =1;
        angleSeconds = 1;
    }
    else{
        angleSeconds = 0;
        angleMinute = 0;
        angleHours = 0;
    }
    
    
    [self performSelector: @selector(setNeedsDisplay) withObject: nil afterDelay: 1.0];
    */

}


@end
