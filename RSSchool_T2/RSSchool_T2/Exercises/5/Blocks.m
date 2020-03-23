#import "Blocks.h"

@interface Blocks ()

@property (nonatomic,copy) NSMutableArray *array2;
//@property (nonatomic) NSString *class1;
//@property (nonatomic) int *class2;
//@property (nonatomic) NSDate *class3;
@property (nonatomic,copy) NSMutableString *resultString;



@end


@implementation Blocks



- (BlockA)blockA {
    self.blockA = ^(NSArray *array){
        
        NSMutableArray *inputArray = [NSMutableArray array];
        if (array.count != 0){
            for (int i = 0; i<array.count;i++)  {
                id object = [array objectAtIndex:i];
                [inputArray addObject:object];
            }
            _array2 = inputArray;
        }
    };
    return _blockA;
}

- (BlockB)blockB {
    self.blockB = ^(Class class){
        NSMutableArray *inputArray = _array2;
        NSMutableArray *resultArray = [NSMutableArray array];
        NSMutableString *resultString = [NSMutableString string];
        
        for (int i=0 ; i<inputArray.count; i++ ) {
            id object = [inputArray objectAtIndex:i];
            if ([object isKindOfClass:class]) {
                [resultArray addObject:object];
            }
        }
        
        if ([resultArray.firstObject isKindOfClass:[NSString class]]) {
            for (int i =0; i< resultArray.count; i++) {
                id object = [resultArray objectAtIndex:i];
                [resultString appendString:object];
                
            }
            self.blockC(resultString);
        } else if ([resultArray.firstObject isKindOfClass:[NSDate class]]) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"dd.MM.yyyy"];
                NSArray *sortedArray = [resultArray sortedArrayUsingComparator:^NSComparisonResult(NSDate *obj1, NSDate *obj2) {
                    return [obj1 compare: obj2];
                }];
            
            resultString = [[formatter stringFromDate:sortedArray.lastObject]mutableCopy];
            self.blockC(resultString);
        } else {
            NSNumber *mySum = [resultArray valueForKeyPath: @"@sum.self"];
            self.blockC(mySum);
        }
    };
    return _blockB;
}
@end

