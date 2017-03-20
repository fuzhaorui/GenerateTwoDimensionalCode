//
//  ViewController.m
//  shengchengerwei
//
//  Created by IOS-开发机 on 16/7/15.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+GenerateTwoDimensionalCode.h"

@interface ViewController ()

@property (strong ,nonatomic) IBOutlet UIImageView  *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.image = [self creatQrCodeAction:@"www.huodull.com" withSize:self.imageView.frame.size.height];
    
}

///创建二维码的过程


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
