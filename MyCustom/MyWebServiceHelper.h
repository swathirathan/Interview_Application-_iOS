

#import <Foundation/Foundation.h>
#import "MyProtocals.h"
#import "MyCustomClass.h"


#define BaseURL @"https://api.instagram.com/v1/tags/selfie/media/recent?access_token=1498229576.5207b6b.5b3a5178c94643ec9b9f3fe9d52edd83"

@interface MyWebServiceHelper : NSObject
{
    NSString *apiName;
}
@property (nonatomic,strong) id <WebServiceResponseProtocal> webApiDelegate;



-(void)getData:(NSString *)urlString;





@end
