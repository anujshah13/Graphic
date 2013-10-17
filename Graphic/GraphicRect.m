//
//  GraphicRect.m
//  Graphic
//
//  Created by Anuj Shah on 10/16/13.
//  Copyright (c) 2013 Anuj Shah. All rights reserved.
//

#import "GraphicRect.h"

@implementation GraphicRect

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
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
	CGFloat length = min * 5 / 8;           //of side
    
	CGMutablePathRef p = CGPathCreateMutable();   //right triangle
	CGPathMoveToPoint(p, NULL, 0, 0);          //lower right vertex (the right angle)
	CGPathAddLineToPoint(p, NULL, 0, length);  //upper right vertex
	CGPathAddLineToPoint(p, NULL, -length, 0); //lower left vertex
	CGPathCloseSubpath(p);
    
	CGContextRef c = UIGraphicsGetCurrentContext();
	//Origin at right angle.
	CGContextTranslateCTM(c,
                          (size.width + length) / 2,
                          (size.height + length) / 2
                          );
	CGContextScaleCTM(c, 1, -1);
    
	CGContextBeginPath(c);
	CGContextAddPath(c, p);
    //CGContextSetShadow(c, CGSizeMake(10, -20), 5);
	CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1);
	CGContextFillPath(c);
    
	CGContextBeginPath(c);
	CGContextAddPath(c, p);
	CGContextSetLineWidth(c, 10.0);
	CGContextSetRGBStrokeColor(c, 0.0, 0.0, 1.0, 1);
    CGContextSetShadow(c, CGSizeMake(5, -20), 10);
	CGContextStrokePath(c);
	CGPathRelease(p);
}


@end
