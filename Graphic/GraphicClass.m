//
//  GraphicClass.m
//  Graphic
//
//  Created by Anuj Shah on 10/16/13.
//  Copyright (c) 2013 Anuj Shah. All rights reserved.
//

#import "GraphicClass.h"

@implementation GraphicClass

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       // self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
   
    CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat longSide = min * 15 / 16;
	CGFloat shortSide = longSide / 3;
    
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
    
	CGContextTranslateCTM(c, size.width / 2, size.height / 2); //origin at center of view
	CGContextScaleCTM(c, 1, -1);                               //make Y axis point up
    
	CGRect horizontal = CGRectMake(-longSide / 2, -shortSide / 2, longSide, shortSide);
	CGContextAddRect(c, horizontal);
    
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 0.5);
	CGContextFillPath(c);
    
	CGContextBeginPath(c);
	CGContextRotateCTM(c, M_PI / 2);	//90 degrees clockwise
	CGContextAddRect(c, horizontal);
    
	CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 0.5);
	CGContextFillPath(c);    /*
    CGSize size = self.bounds.size;
	CGFloat min = MIN(size.width, size.height);
	CGFloat longSide = min * 15 / 16;
	CGFloat shortSide = longSide / 3;
    
	CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
    
	CGContextTranslateCTM(c, size.width / 2, size.height / 2); //origin at center of view
	CGContextScaleCTM(c, 1, -1);                               //make Y axis point up
    
	CGRect horizontal = CGRectMake(-longSide / 2, -shortSide / 2, longSide, shortSide);
	CGContextAddRect(c, horizontal);
	CGContextRotateCTM(c, 90 * M_PI / 180);	//90 degrees counterclockwise
	CGContextAddRect(c, horizontal);
    
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
	CGContextFillPath(c);
    */
}


@end
