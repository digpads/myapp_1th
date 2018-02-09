//
//  ViewController.m
//  myapp_1th
//
//  Created by 何明礼 on 2018/2/3.
//  Copyright © 2018年 何明礼. All rights reserved.
//

#import "ViewController_lay1.h"
#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
    @property (nonatomic, strong) UIButton *btn1;
    @property (nonatomic, strong) UIButton *testbtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  
    
    UIView *red1 = [[UIView alloc] init];
    red1.backgroundColor = [UIColor redColor];
    [self.view addSubview:red1];
    
    [red1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view).offset(20);
        make.left.mas_equalTo(self.view).offset(0);
        make.height.mas_equalTo(self.view).multipliedBy(0.1);
        make.width.mas_equalTo(self.view).multipliedBy(0.1);
        
    }];
    
    UIView *gray1 = [[UIView alloc] init];
    gray1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:gray1];

    [gray1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.mas_equalTo(red1);
        make.left.mas_equalTo(red1.mas_right).multipliedBy(2);
        make.top.equalTo(red1.mas_top);
    }];
    
    
    UIView *red2 = [[UIView alloc] init];
    red2.backgroundColor = [UIColor redColor];
    [self.view addSubview:red2];
    
    [red2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.and.width.mas_equalTo(red1);
        make.left.mas_equalTo(red1.mas_right).multipliedBy(2);
        make.top.equalTo(red1.mas_top);
    }];
    
    
    UIView *btn1th = [[UIView alloc] init];
    btn1th.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn1th];

    [btn1th mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-30);
        make.height.mas_equalTo(60);
    } ];

    
    
    UIView *btn2th = [[UIView alloc] init];
    btn2th.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn2th];

    [btn2th mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(btn1th.mas_height);
        make.width.mas_equalTo(btn1th.mas_width);
        make.bottom.mas_equalTo(btn1th.mas_bottom);
        make.left.mas_equalTo(btn1th.mas_right);
    } ];

    
    
    UIView *btn3th = [[UIView alloc] init];
    btn3th.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn3th];

    [btn3th mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(btn1th.mas_height);
        make.width.mas_equalTo(btn1th.mas_width);
        make.bottom.mas_equalTo(btn1th.mas_bottom);
        make.left.mas_equalTo(btn2th.mas_right);
        make.right.mas_equalTo(self.view);
    } ];
    
    [self plug];
    
    [self.view addSubview:self.testbtn];
    [self.testbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.left.mas_equalTo(red2).with.offset(0);
    }];
    
}

- (void)plug {
    [self.view addSubview:self.btn1];
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(120);
    }];
}



- (void)presentClick {
    ViewController_lay1 *vc = [ViewController_lay1 new];
    [self presentViewController:vc animated:YES completion:nil];
    //[self.navigationController pushViewController:vc animated:YES];
}

- (void)testout {
    NSLog(@"success_btn");
}

- (UIButton *)testbtn {
    if (!_testbtn) {
        _testbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_testbtn setTitle:@"字" forState:UIControlStateNormal];
        _testbtn.backgroundColor = [UIColor grayColor];
        [_testbtn addTarget:self action:@selector(testout) forControlEvents:UIControlEventTouchUpInside];
    }
    return _testbtn;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn1 setTitle:@"按钮名字" forState:UIControlStateNormal];
        _btn1.backgroundColor = [UIColor magentaColor];
        [_btn1 addTarget:self action:@selector(presentClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end







