//


#import "MyWebServiceHelper.h"

@implementation MyWebServiceHelper
@synthesize webApiDelegate;



-(void )synchronousApiRequestByGetWithDataTypeInResponse:(NSString *)urlString
{
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    //[request setValue:authValue forHTTPHeaderField:@"Authorization"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setHTTPMethod:@"GET"];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if (error)
         {
             [webApiDelegate webApiResponseError:error];
         }
         else
         {
             [self webapiResponseResultHandling:data];
         }
     }];
}



#pragma mark - Response Result Handling Method list
-(void)webapiResponseResultHandling:(NSData *)data
{
    [webApiDelegate webApiResponseData:data apiName:apiName];
}

-(void)getData:(NSString *)urlString
{
    apiName=@"ALL_Data";
    urlString=BaseURL;
     [self synchronousApiRequestByGetWithDataTypeInResponse:urlString];
}



@end
