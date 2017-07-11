//
//  NSString+InputString.m
//  NEUStarterApp
//
//  Created by Vega  on 16/12/16.
//  Copyright © 2016 NEU. All rights reserved.
//

#import "NSString+InputString.h"

@implementation NSString (InputString)

//read simple string input from the console

-(NSString *) readString{
    NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
    NSData *inputData = [NSData dataWithData:[input availableData]];
    NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
    inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return inputString;
}


-(int) checkforwhitespace : (NSString *) string;
{
    int status = 0;
    // Character set to check if there is only whitespaces
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    
    if ([[string stringByTrimmingCharactersInSet: set] length] == 0)
    {
        status = 0;
    }
    else
    {
        status = 1;
    }
    return status;
}
-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
-(int) checkifNSStringOnlyLetter :(NSString *) string;
{
    int status = 0;
    
    //Create character set to check if the string contains only letters
    NSCharacterSet *validChars = [NSCharacterSet letterCharacterSet];
    validChars = [validChars invertedSet];
    
    //Check against that
    NSRange  range = [string rangeOfCharacterFromSet:validChars];
    if (NSNotFound != range.location) {
        status = 0;
    }
    else
        status = 1;
    return status;
}

-(int) checkifNSStringOnlyDigit : (NSString *) string;
{
    int status = 0;
    
    //Create character set to check if the string contains only letters
    NSCharacterSet *notDigits = [NSCharacterSet decimalDigitCharacterSet].invertedSet;
    
    if ([string rangeOfCharacterFromSet:notDigits].length == 0)
    {
        status = 1;
    }
    else
        status = 0;
    return status;
}


@end
