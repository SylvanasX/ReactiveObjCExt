//
//  NSURLSession+RACExtensions.m
//  Pods-ReactiveObjCExt_Example
//
//  Created by ptyuan on 2018/8/10.
//

#import "NSURLSession+RACExtensions.h"

@implementation NSURLSession (RACExtensions)

- (RACSignal<RACTwoTuple<NSURLResponse *, NSData *> *> *)rac_responseSignalWithRequest:(NSURLRequest *)request {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSURLSessionDataTask *task = [self dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                [subscriber sendError:error];
            } else {
                RACTwoTuple *tuple = [RACTwoTuple pack:response :data];
                [subscriber sendNext:tuple];
                [subscriber sendCompleted];
            }
        }];
        [task resume];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

@end
