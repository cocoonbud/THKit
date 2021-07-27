//
//  TMBgImgGeneratorVC.m
//  THKit
//
//  Created by Terence Yang on 2021/7/27.
//

#import "TMBgImgGeneratorVC.h"
#import "UIImage+Color.h"
#import "UIColor+Hex.h"

@interface TMBgImgGeneratorVC ()

@end

@implementation TMBgImgGeneratorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"bg img generation by color";
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    imgView.center = self.view.center;
    [self.view addSubview:imgView];
    
    NSArray *gradientColorArr = @[[UIColor colorWithHex:@"#FFFFFF"], [UIColor colorWithHex:@"#FFCFD7"]];
    
    NSArray *borderColorArr = @[[UIColor colorWithHex:@"#FFC0CA"], [UIColor colorWithHex:@"#FF96A6"]];
    
    CGFloat locations[] = {0.0, 1.0};
    
    UIImage *bgImg = [UIImage creatBgImgWithBgWidth:100 height:100 shadowColor:[[UIColor yellowColor] colorWithAlphaComponent:0.2] shadowWidth:1 shadowColorOffset:CGSizeMake(4, 4) shadowBlur:6 cornerRadio:6 gradientColors:gradientColorArr gradientLocations:locations gradientBorderColors:borderColorArr gradientBorderColorsLocations:locations];
    
    [imgView setImage:bgImg];
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
