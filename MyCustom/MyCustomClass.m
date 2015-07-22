

#import "MyCustomClass.h"

@implementation MyCustomClass

/////*******************************************************//////
/////*******************************************************//////
/////*******************************************************//////
/////*******************************************************//////

//////////////////////////////////////////////////////////////////
///////44. JSON Data In Dictionary                      //////////
//////////////////////////////////////////////////////////////////
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

//////////////////////////////////////////////////////////////////
///////45.Save Data in Array after getting JSON response     /////
//////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////
///////46.Progress View with showing message                 /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressViewWithShowingMessage :(NSString *)stringMessage
{
    [SVProgressHUD showWithStatus:stringMessage maskType:SVProgressHUDMaskTypeGradient];
}

//////////////////////////////////////////////////////////////////
///////47.Progress View withDismiss error message            /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressMessageDismissWithError :(NSString *)stringMessage timeDalay :(float ) timeDalay
{
    [SVProgressHUD dismissWithError:stringMessage afterDelay:timeDalay];
}

//////////////////////////////////////////////////////////////////
///////48. Progress View dismiss with successfully message   /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressMessageDismissWithSuccess :(NSString *)stringMessage timeDalay :(float ) timeDalay
{
    [SVProgressHUD dismissWithSuccess:stringMessage afterDelay:timeDalay];
}

//////////////////////////////////////////////////////////////////
///////49. Progress View Immediate Dismiss                   /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressMessageWithImmediateDismiss
{
    [SVProgressHUD dismiss];
}

//////////////////////////////////////////////////////////////////
///////50. show with progress view                           /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressMessageWithProgressView: (NSString *)stringMessage
{
    [SVProgressHUD showWithStatus:@"Alert !" maskType:SVProgressHUDMaskTypeBlack indicatorType:SVProgressHUDIndicatorTypeProgressBar networkIndicator:YES];
}

//////////////////////////////////////////////////////////////////
///////51. show with progress view with subtitle             /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressMessageShowWithSubtitle:(NSString *)title subtitle:(NSString *)subtitle
{
    [SVProgressHUD showWithStatus:title subtitle:subtitle maskType:SVProgressHUDMaskTypeBlack indicatorType:SVProgressHUDIndicatorTypeSpinner];
}


@end
