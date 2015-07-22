//
//  DetailsViewController.m
//  Interview_Application
//
//  Copyright (c) 2015 Swathi Rathan. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imgView;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSString *urlStr =[NSString stringWithFormat:@"%@", self.strURL];
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        self.imgView.image = image;
    });
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
