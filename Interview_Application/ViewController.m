//
//  ViewController.m
//  Interview_Application
//
//  Created by Swathi Rathan on 7/20/15.
//  Copyright (c) 2015 Swathi Rathan. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize responseArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.responseArray = [[NSMutableArray alloc]init];
    helper =[[MyWebServiceHelper alloc] init];
    helper.webApiDelegate=self;
    
   [self getallDataRequest];
    
}

-(void)getallDataRequest
{
    [MyCustomClass SVProgressViewWithShowingMessage:@"All Data..."];
    [helper getData:@""];
}

- (void)showAllPressed
{
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:_collectionView];
     [_collectionView reloadData];
    
}

#pragma mark - Api Response
-(void)webApiResponseData:(NSData *)responseDictionary apiName:(NSString *)apiName
{
    NSMutableDictionary *dataDic=[[NSMutableDictionary alloc] init];
    dataDic=[MyCustomClass dictionaryFromJSON:responseDictionary];
     NSMutableDictionary *dataRes =[[NSMutableDictionary alloc] init];
    
    dataRes =[dataDic objectForKey:@"data"];
     if (dataDic.count>1)
    {
        
            dispatch_async(dispatch_get_main_queue(), ^{
              
                
                for(int i = 0; i<15;i++)
                {
                    
                    NSString *imageURL = [[[[[dataDic objectForKey:@"data"] objectAtIndex:i]  objectForKey:@"images"] objectForKey:@"low_resolution"] objectForKey:@"url"];
                    
                    [self.responseArray addObject:imageURL];
                    NSLog(@"self.response Array %@",self.responseArray);
                    
                      }
              
            });
           
        
    }
   
    [self showAllPressed];
   
    [_collectionView reloadData];
    
    
}

-(void)webApiResponseError:(NSError *)errorDictionary
{
    [MyCustomClass SVProgressMessageDismissWithError:@"Some error." timeDalay:1.0];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   
    return [self.responseArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
 
  #define IMAGE_VIEW_TAG 99
   UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    
    NSString *urlStr =[NSString stringWithFormat:@"%@", [self.responseArray objectAtIndex:indexPath.row]];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    cell.backgroundView = [[UIImageView alloc]initWithImage:image];
   [MyCustomClass SVProgressMessageDismissWithSuccess:@"Success" timeDalay:1.0];
    
        return cell;
    
   }
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSString *urlStr =[NSString stringWithFormat:@"%@", [self.responseArray objectAtIndex:indexPath.row]];
    DetailsViewController *controller  = [storyboard instantiateViewControllerWithIdentifier:@"DetailsViewControllerID"];
    controller.strURL = urlStr;
    [self.navigationController pushViewController:controller animated:YES];
    
 
    
    controller = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


