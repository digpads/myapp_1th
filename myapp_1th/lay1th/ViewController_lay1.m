//
//  ViewController_lay1.m
//  myapp_1th
//
//  Created by 何明礼 on 2018/2/5.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "ViewController_lay1.h"
#import "Masonry.h"
#import "AFNetworking.h"


@interface ViewController_lay1 ()
    @property (nonatomic, strong) UIButton *btn1;
@end

@implementation ViewController_lay1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"push";
    self.view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:self.btn1];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(120);
    }];
    
    [self requestURL];
    [self postrequestURL];
}

- (void)postrequestURL {
    [[AFHTTPSessionManager manager] POST:@"http://pub.hunliji.com/topic/wedding_card/API" parameters:@{@"groom":@"1", @"bride":@"2"} constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success——gets");
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failed");
        
    }];
}

- (void)requestURL {
    // type=area&sort=3&city_id=78
    [[AFHTTPSessionManager manager] GET:@"http://pub.hunliji.com/ds/topic?" parameters:@{@"type":@"area", @"sort":@3, @"city_id":@78} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success_GET");
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSArray *list = dic[@"data"][@"list"];
        NSNumber *a = dic[@"data"][@"page_count"];
        NSLog(@"%@",list[0][@"area_name"]);
        for (NSDictionary *tempDic in list) {
            NSLog(@"%@",tempDic[@"title"]);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failed");
    }];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn1 setTitle:@"push" forState:UIControlStateNormal];
        _btn1.backgroundColor = [UIColor magentaColor];
        [_btn1 addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
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
