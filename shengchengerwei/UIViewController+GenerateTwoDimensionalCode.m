//
//  UIViewController+GenerateTwoDimensionalCode.m
//  shengchengerwei
//
//  Created by IOS-开发机 on 16/7/15.
//  Copyright © 2016年 IOS-开发机. All rights reserved.
//

#import "UIViewController+GenerateTwoDimensionalCode.h"

@implementation UIViewController (GenerateTwoDimensionalCode)

- (UIImage *)creatQrCodeAction:(NSString *)content withSize:(CGFloat) size{
    ///生成二维码,原生态生成二维码需要导入CoreImage.framework
    //二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //恢复滤镜的默认属性
    [filter setDefaults];
    //*****************************************************************//
    //如果是从外界传递来的字符串这里将外界传递来的字符串转换为data即可.
    //*****************************************************************//
    
    //字符串转换为data
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    //通过KVO设置滤镜inputmessage数据
    [filter setValue:data forKey:@"inputMessage"];
    //获得滤镜输出的图像
    CIImage *outPutImage = [filter outputImage];
    //将CIImage转换成UImage并展示
    
    
    CGRect extent = CGRectIntegral(outPutImage.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:outPutImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}
@end
