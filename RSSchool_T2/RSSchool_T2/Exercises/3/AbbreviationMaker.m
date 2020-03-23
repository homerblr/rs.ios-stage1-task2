#import "AbbreviationMaker.h"

@implementation AbbreviationMaker

- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSString *newString = [a uppercaseString];
    NSMutableString *outputString = [NSMutableString string];
    
    for (int a1 = 0; a1 < b.length; a1++){
        
        NSString *symbolB = [b substringWithRange:NSMakeRange(a1, 1)];
        
        for (int i = a1; i <a.length; i++) {
            
            NSString *symbolA = [newString substringWithRange:NSMakeRange(i, 1)];
            
            if ([symbolA isEqualToString:symbolB]) {
                [outputString appendString:symbolA];
            }
            
        }
        
    }
    
    if ([outputString isEqualToString:b]) {
        return @"YES";
    }
    
    return @"NO";
}
@end
