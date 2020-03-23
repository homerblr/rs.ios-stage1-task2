#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSString *newString = [NSString stringWithFormat:@"%@ %@ %@", year, month, day];
    
    NSDateFormatter *newFormat = [[NSDateFormatter alloc]init];
    [newFormat setDateFormat:@"YYYY MM dd"];
    NSDate *newDate = [newFormat dateFromString:newString];
    
    [newFormat setDateFormat:@"dd MMMM, EEEE"];
    [newFormat setLocale:[NSLocale localeWithLocaleIdentifier:@"ru-RU"]];
    
    NSString *result = [newFormat stringFromDate:newDate];
    
    if (result == nil) {
        return @"Такого дня не существует";
    }
    
    return result;
    
}

@end
