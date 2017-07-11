//
//  QuestionAnswer.h
//  NEUStarterApp
//
//  Created by Vega  on 14/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionAnswer : NSObject
{
    NSString *question;
    NSString *yourAnswer;
}

@property(readwrite,retain)NSString *question;

@property(readwrite,retain)NSString *yourAnswer;

@end
