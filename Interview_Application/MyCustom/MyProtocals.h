
#import <Foundation/Foundation.h>

@protocol WebServiceResponseProtocal <NSObject>

@optional
-(void)webApiResponseData:(NSData *)responseDictionary apiName:(NSString *)apiName;
-(void)webApiResponseError:(NSError *)errorDictionary;
@end



@interface MyProtocals : NSObject

@end
