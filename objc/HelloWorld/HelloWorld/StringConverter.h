
NS_ROOT_CLASS
@interface StringConverter

+ (NSNumber*)ConvertStringToNumber:(NSString*)string;

@end


@implementation StringConverter

+ (NSNumber*)ConvertStringToNumber:(NSString*)string
{
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber* result = [formatter numberFromString:string];
    return result;
}

@end