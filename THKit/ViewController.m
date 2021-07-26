//
//  ViewController.m
//  THKit
//
//  Created by Terence Yang on 2021/7/26.
//

#import "ViewController.h"
#import "UIImage+Color.h"
#import "UIColor+Hex.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    btn.center = self.view.center;
    
    NSArray *gradientColorArr = @[[UIColor colorWithHex:@"#FFFFFF"], [UIColor colorWithHex:@"#FFCFD7"]];
    
    NSArray *borderColorArr = @[[UIColor colorWithHex:@"#FFC0CA"], [UIColor colorWithHex:@"#FF96A6"]];
    
    CGFloat locations1[] = {0.0, 1.0};
    
    UIImage *bgImg = [UIImage creatBgImgWithBgWidth:100 height:100 shadowColor:[[UIColor yellowColor] colorWithAlphaComponent:0.2] shadowWidth:1 shadowColorOffset:CGSizeMake(4, 4) shadowBlur:6 cornerRadio:6 gradientColors:gradientColorArr gradientLocations:locations1 gradientBorderColors:borderColorArr gradientBorderColorsLocations:locations1];
    
    [btn setTitle:@"Gradint" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:30];
    [btn setBackgroundImage:bgImg forState:UIControlStateNormal];
    [self.view addSubview:btn];
}


@end
