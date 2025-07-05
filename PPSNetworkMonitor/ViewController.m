//
//  ViewController.m
//  PPSNetworkMonitor
//
//  Created by ppsheep on 2017/4/8.
//  Copyright © 2017年 ppsheep. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self startRequest];
}


- (void)startRequest {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"https://api.github.com/search/users?q=language:objective-c&sort=followers&order=desc"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSError *serializationlError;
            id jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:&serializationlError];
            if (serializationlError) {
                NSLog(@"unserialization error:%@", error.localizedDescription);
            } else {
                NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObj options:NSJSONWritingPrettyPrinted error:nil];
                NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
                NSLog(@"接受到的数据:%@", jsonString);
            }
        }
        NSLog(@"请求完成");
    }];
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
