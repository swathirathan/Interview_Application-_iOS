

#import "MyCustomClass.h"

@implementation MyCustomClass


+(NSMutableDictionary*)dictionaryFromJSON :(NSData *)response
{
    NSError *jsonError=nil;
    //NSMutableDictionary *parsedJSON = [[NSMutableDictionary alloc] init] ;
    NSMutableDictionary *parsedJSON = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonError];
    
    if (jsonError!=nil)
    {
        [parsedJSON removeAllObjects];
        [parsedJSON setValue:jsonError forKey:@"JSONERROR"];
    }
    return parsedJSON;
}

+(NSMutableArray*)jsonArray :(NSData*)response
{
    NSError *jsonError=nil;
    //NSMutableArray *parsedJSON = [[NSMutableArray alloc] init] ;
    NSMutableArray *parsedJSON = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonError];
    if (jsonError!=nil)
    {
        [parsedJSON removeAllObjects];
        [parsedJSON setValue:jsonError forKey:@"JSONERROR"];
    }
    return parsedJSON;
}


#pragma mark - Progress View Method List

+(void)SVProgressViewWithShowingMessage :(NSString *)stringMessage
{
    [SVProgressHUD showWithStatus:stringMessage maskType:SVProgressHUDMaskTypeGradient];
}

+(void)SVProgressMessageDismissWithError :(NSString *)stringMessage timeDalay :(float ) timeDalay
{
    [SVProgressHUD dismissWithError:stringMessage afterDelay:timeDalay];
}

+(void)SVProgressMessageDismissWithSuccess :(NSString *)stringMessage timeDalay :(float ) timeDalay
{
    [SVProgressHUD dismissWithSuccess:stringMessage afterDelay:timeDalay];
}

+(void)SVProgressMessageWithImmediateDismiss
{
    [SVProgressHUD dismiss];
}

+(void)SVProgressMessageWithProgressView: (NSString *)stringMessage
{
    [SVProgressHUD showWithStatus:@"Alert !" maskType:SVProgressHUDMaskTypeBlack indicatorType:SVProgressHUDIndicatorTypeProgressBar networkIndicator:YES];
}

+(void)SVProgressMessageShowWithSubtitle:(NSString *)title subtitle:(NSString *)subtitle
{
    [SVProgressHUD showWithStatus:title subtitle:subtitle maskType:SVProgressHUDMaskTypeBlack indicatorType:SVProgressHUDIndicatorTypeSpinner];
}


@end
