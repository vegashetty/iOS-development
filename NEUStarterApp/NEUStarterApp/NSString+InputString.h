//
//  NSString+InputString.h
//  NEUStarterApp
//
//  Created by Vega  on 16/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (InputString)          //@interface ClassName (CategoryName)

//Read simple string input from the console
-(NSString *) readString;


//****Validation Methods ***//


// Validate Phone Number
-(BOOL) validatePhoneNumber : (NSString *) input;

// Vaidate for WhiteSpaces
-(int) checkforwhitespace : (NSString *) string;

// Validate String for Only Letter
-(int) checkifNSStringOnlyLetter :(NSString *) string;

// Validate String for Only Digit
-(int) checkifNSStringOnlyDigit : (NSString *) string;
-(BOOL) NSStringIsValidEmail:(NSString *)checkString;

@end
