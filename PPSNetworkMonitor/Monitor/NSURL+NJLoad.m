//
//  NSURL+NJLoad.m
//  PPSNetworkMonitor
//
//  Created by touchWorld on 2025/7/5.
//  Copyright © 2025 ppsheep. All rights reserved.
//

#import "NSURL+NJLoad.h"
#import "PPSURLProtocol.h"

@implementation NSURL (NJLoad)

+ (void)load {
    NSLog(@"cxzcxz:load success");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [PPSURLProtocol start];
    });
    
}

@end
