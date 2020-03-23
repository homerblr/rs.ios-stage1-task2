#import "NSString+Transform.h"


@interface Element : NSObject

@property(nonatomic, assign) NSString *element;
@property(nonatomic) int count;

- (id)initWithString:(NSString *)element andCount:(int)count;
@end


@implementation Element

- (id)initWithString:(NSString *)element andCount:(int)count
{
    self = [super init];
    if (self) {
        _element = element;
        _count = count;
    }
    return self;
}

@end


@implementation NSString (Transform)


-(NSString*)transform {
    
    NSSet *alphabet = [[NSSet alloc]initWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z", nil];
    NSArray *vowels = @[@"a",@"e",@"i",@"o",@"u",@"y"];
    NSArray *consonants = @[@"b",@"c",@"d",@"f",@"g",@"h",@"j",@"k",@"l",@"m",@"n",@"p",@"q",@"r",@"s",@"t",@"v",@"w",@"x",@"z"];
    //    NSArray *extraSymbols = @[@".",@",",@" ",@"-",@"!",@"'",@"?"];
    
    NSMutableSet *isItAPangram = [NSMutableSet set];
    NSMutableArray *resultArray = [NSMutableArray array];
    NSString *result = [NSString string];
    
    for (int i=0;i<self.length;i++) {
        NSString *inputString = [self lowercaseString];
        NSString *symbol = [inputString substringWithRange:NSMakeRange(i, 1)];
        if ([alphabet containsObject:symbol]) {
            [isItAPangram addObject:symbol];
        }
    }
    
    if ([isItAPangram isEqualToSet:alphabet]) {
        NSMutableArray *elementsArray = [[self componentsSeparatedByString:@" "]mutableCopy];
        if ([elementsArray containsObject:@""]) {
            [elementsArray removeObject:@""];
        }
        for (NSMutableString *elementInArray in elementsArray) {
            NSMutableString *elementToInsert = [NSMutableString stringWithString:elementInArray];
            int count = 0;
            for (int i=0;i<elementInArray.length;i++) {
                //                options:NSCaseInsensitiveSearch] == NSOrderedSame)
                NSString *symbol = [elementInArray substringWithRange:NSMakeRange(i, 1)];
                for (NSString *vowel in vowels) {
                    if ([vowel compare:symbol options:NSCaseInsensitiveSearch] == NSOrderedSame) {
                        count += 1;
                        NSString *uppercaseSymbol = [symbol uppercaseString];
                        [elementToInsert replaceCharactersInRange:NSMakeRange(i, 1) withString:uppercaseSymbol];
                    }
                }
            }
            NSString *firstSymbol = [NSString stringWithFormat:@"%d",count];
            NSString *newElement = [firstSymbol stringByAppendingString:elementToInsert];
            
            Element *element = [[Element alloc] initWithString:newElement andCount:count];
            [resultArray addObject:element];
        }
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"count" ascending:YES];
        
        NSArray *sortedArray = [resultArray sortedArrayUsingDescriptors:@[sortDescriptor]];
        result = [[sortedArray valueForKey:@"element"] componentsJoinedByString:@" "];
    } else {
        
        NSMutableArray *elementsArray = [[self componentsSeparatedByString:@" "]mutableCopy];
        if ([elementsArray containsObject:@""]) {
            [elementsArray removeObject:@""];
        }
        for (NSMutableString *elementInArray in elementsArray) {
            NSMutableString *elementToInsert = [NSMutableString stringWithString:elementInArray];
            int count = 0;
            for (int i=0;i<elementInArray.length;i++) {
                NSString *symbol = [elementInArray substringWithRange:NSMakeRange(i, 1)];
                for (NSString *consonant in consonants) {
                    if ([consonant compare:symbol options:NSCaseInsensitiveSearch] == NSOrderedSame) {
                        count += 1;
                        NSString *uppercaseSymbol = [symbol uppercaseString];
                        [elementToInsert replaceCharactersInRange:NSMakeRange(i, 1) withString:uppercaseSymbol];
                    }
                }
            }
            NSString *firstSymbol = [NSString stringWithFormat:@"%d",count];
            NSString *newElement = [firstSymbol stringByAppendingString:elementToInsert];
            
            Element *element = [[Element alloc] initWithString:newElement andCount:count];
            [resultArray addObject:element];
        }
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"count" ascending:YES];
        
        NSArray *sortedArray = [resultArray sortedArrayUsingDescriptors:@[sortDescriptor]];
        result = [[sortedArray valueForKey:@"element"] componentsJoinedByString:@" "];
    }
    return result;
}

@end
