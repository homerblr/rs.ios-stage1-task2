#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    NSMutableArray *fibbonacciArray = [NSMutableArray array];
    NSMutableArray<NSNumber *> *resultArray = [NSMutableArray array];
    NSMutableArray *checkLastItem = [NSMutableArray array];
    
    for (int i = 0; i < (number.intValue/3); i ++) {
        if (i == 0) {
            NSNumber *object = [NSNumber numberWithInt:i];
            [fibbonacciArray addObject: object];
        } else if (i == 1){
            NSNumber *object = [NSNumber numberWithInt:i];
            [fibbonacciArray addObject: object];
        } else {
            NSNumber *object1 = [fibbonacciArray objectAtIndex:(i-1)];
            NSNumber *object2 = [fibbonacciArray objectAtIndex:(i-2)];
            NSDecimalNumber *decimalObject1 = [NSDecimalNumber decimalNumberWithDecimal:object1.decimalValue];
            NSDecimalNumber *decimalObject2 = [NSDecimalNumber decimalNumberWithDecimal:object2.decimalValue];
            
            NSNumber *sum = [decimalObject1 decimalNumberByAdding:decimalObject2];
            NSNumber *objectToInsert = sum;
            [fibbonacciArray addObject:objectToInsert];
        }
    }

    NSNumber *multiplication = [NSNumber new];
    NSNumber *lastMultiplication = [NSNumber new];
    NSNumber *objectN = [NSNumber new];
    NSNumber *objectN1 = [NSNumber new];
    NSNumber *decimalNumber = [NSDecimalNumber decimalNumberWithDecimal:number.decimalValue];
    

    for (int i = 0; i < fibbonacciArray.count-1; i ++) {
        objectN = [fibbonacciArray objectAtIndex:i];
        objectN1 = [fibbonacciArray objectAtIndex:(i + 1)];
        NSDecimalNumber *decimalObject1 = [NSDecimalNumber decimalNumberWithDecimal:objectN.decimalValue];
        NSDecimalNumber *decimalObject2 = [NSDecimalNumber decimalNumberWithDecimal:objectN1.decimalValue];
        multiplication = [decimalObject1 decimalNumberByMultiplyingBy:decimalObject2];
        
        if ([multiplication compare:decimalNumber] == NSOrderedSame) {
            [resultArray addObject:objectN];
            [resultArray addObject:objectN1];
            [resultArray addObject:[NSNumber numberWithInt:1]];
            return resultArray;
//            break;
        } else if ([multiplication compare:decimalNumber] == NSOrderedAscending) {
            
            [checkLastItem addObject:[fibbonacciArray objectAtIndex:i+1]];
            [checkLastItem addObject:[fibbonacciArray objectAtIndex:(i+2)]];
            lastMultiplication = multiplication;
        }
    }
//
    if ([lastMultiplication compare:decimalNumber] == NSOrderedAscending) {
        NSNumber *lastObject = [checkLastItem lastObject];
        NSUInteger indexOfLastObject = [checkLastItem count];
        NSNumber *previousLastObject = [checkLastItem objectAtIndex:(indexOfLastObject - 2)];

        [resultArray addObject:previousLastObject];
        [resultArray addObject:lastObject];
        
        [resultArray addObject:[NSNumber numberWithInt:0]];
    }
    return resultArray;
}
@end
