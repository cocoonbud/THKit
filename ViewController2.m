//
//  ViewController2.m
//  THKit
//
//  Created by Terence Yang on 2021/7/31.
//

#import "ViewController2.h"
#import "UIViewController+BackAction.h"
#import "UIViewController+BackButtonHandler.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(BOOL)navigationShouldPopOnBackButton 
{
    if (YES) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"" message:@"绑定尚未完成，确认退出？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [view show];
        return NO;
    }else{
        return YES;
    }
}

- (void)btnClicked {
    [self.navigationController popViewControllerAnimated:YES];
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


