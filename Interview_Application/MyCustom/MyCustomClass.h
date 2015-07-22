
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MyProtocals.h"
#import "MyWebServiceHelper.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"

#define IS_IOS8 [[[UIDevice currentDevice] systemVersion] floatValue]>=8

@interface MyCustomClass : NSObject
{
   }


#pragma mark - WebService Helper Method List
//////////////////////////////////////////////////////////////////
///////44. JSON Data In Dictionary                      //////////
//////////////////////////////////////////////////////////////////
+(NSMutableDictionary*)dictionaryFromJSON :(NSData *)response;

//////////////////////////////////////////////////////////////////
///////45.Save Data in Array after getting JSON response     /////
//////////////////////////////////////////////////////////////////
+(NSMutableArray*)jsonArray :(NSData*)response;


#pragma mark - Progress View Method List
//////////////////////////////////////////////////////////////////
///////46.Progress View with showing message                 /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressViewWithShowingMessage :(NSString *)stringMessage;

//////////////////////////////////////////////////////////////////
///////47.Progress View withDismiss error message            /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressMessageDismissWithError :(NSString *)stringMessage timeDalay :(float ) timeDalay;

//////////////////////////////////////////////////////////////////
///////48. Progress View dismiss with successfully message   /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressMessageDismissWithSuccess :(NSString *)stringMessage timeDalay :(float ) timeDalay;

//////////////////////////////////////////////////////////////////
///////49. Progress View Immediate Dismiss                   /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressMessageWithImmediateDismiss;

//////////////////////////////////////////////////////////////////
///////50. show with progress view                           /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressMessageWithProgressView:(NSString *)stringMessage;

//////////////////////////////////////////////////////////////////
///////51. show with progress view with subtitle             /////
//////////////////////////////////////////////////////////////////
+(void)SVProgressMessageShowWithSubtitle:(NSString *)title subtitle:(NSString *)subtitle;



@end