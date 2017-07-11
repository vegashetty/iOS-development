//
//  StudentForum.h
//  NEUStarterApp
//
//  Created by Vega  on 13/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentForum : NSObject
{
    NSString *topic;
    NSString *question;
    NSString *course;
    NSString *yourAnswer;
}

@property(readwrite,retain)NSString *topic;
@property(readwrite,retain)NSString *question;
@property(readwrite,retain)NSString *course;
@property(readwrite,retain)NSString *yourAnswer;

@end
