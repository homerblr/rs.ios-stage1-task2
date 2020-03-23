#import "TimeConverter.h"

@implementation TimeConverter

- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    if (hours.intValue > 12 || hours.intValue < 0) {
        return @"";
    }
    if (minutes.intValue >60 || minutes.intValue < 0) {
        return @"";
    }
    
    NSArray *wordsToAdd = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen", @"twenty", @"twenty one", @"twenty two", @"twenty three", @"twenty four", @"twenty five", @"twenty six", @"twenty seven", @"twenty eight", @"twenty nine", @"thirty"];
    
    NSMutableString *stringForMinutes = [NSMutableString string];
    NSMutableString *stringForHours = [NSMutableString string];
    
    
    
    if (minutes.intValue <= 30) {
        
        int firstHalf = minutes.intValue;
        stringForMinutes = [wordsToAdd objectAtIndex:firstHalf];
        stringForHours = [wordsToAdd objectAtIndex:hours.intValue];
        
        if (minutes.intValue == 0 || minutes.intValue == 00) {
            
            return [NSString stringWithFormat:@"%@ o' clock",stringForHours];
            
        } else if (minutes.intValue == 1) {
            
            return [NSString stringWithFormat:@"%@ minute past %@",stringForMinutes,stringForHours];
            
        } else if (minutes.intValue > 1 && minutes.intValue < 30) {
            
            if (minutes.intValue == 15) {
                return [NSString stringWithFormat:@"quarter past %@",stringForHours];
            }
            
            return [NSString stringWithFormat:@"%@ minutes past %@",stringForMinutes,stringForHours];
            
        } else if (minutes.intValue == 30) {
            
            return [NSString stringWithFormat:@"half past %@",stringForHours];
            
        }
    } else {
        
        int secondHalf = 60 - minutes.intValue;
        stringForMinutes = [wordsToAdd objectAtIndex:secondHalf];
        stringForHours = [wordsToAdd objectAtIndex:(hours.intValue + 1)];
        
        if (secondHalf > 1 && secondHalf < 30) {
            
            if (secondHalf == 15) {
                return [NSString stringWithFormat:@"quarter to %@",stringForHours];
            }
            
            return [NSString stringWithFormat:@"%@ minutes to %@",stringForMinutes,stringForHours];
            
        } else if (secondHalf == 30) {
            
            return [NSString stringWithFormat:@"half to %@",stringForHours];
            
        }
        
    }
    
    return @"";
    
}

@end
