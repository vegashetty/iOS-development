//
//  Course.h
//  NEUStarterApp
//
//  Created by Vega  on 10/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
{
    NSString *name;
    NSString *professorName;
    NSNumber *rating;
    NSString *resources;
    NSString *comments;
    
}

@property(readwrite,retain)NSString *name;
@property(readwrite,retain)NSString *professorName;
@property(readwrite,retain)NSString *resources;
@property(readwrite,retain)NSString *comments;
@property(readwrite,retain)NSNumber *rating;

//@property(readwrite)double *rating;

@end
