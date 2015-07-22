//
//  ViewController.h
//  Interview_Application
//
//  Created by Swathi Rathan on 7/20/15.
//  Copyright (c) 2015 Swathi Rathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyWebServiceHelper.h"
#import "MyCustomClass.h"


@interface ViewController : UIViewController<WebServiceResponseProtocal,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    MyWebServiceHelper *helper;
    UICollectionView *_collectionView;
   
}

@property (strong, nonatomic) NSMutableArray *responseArray;

- (void)showAllPressed;
- (void)getallDataRequest;

@end

