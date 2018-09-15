//
//  RACSignal+RACExtensions.m
//  Pods-ReactiveObjCExt_Example
//
//  Created by sy on 2018/8/10.
//

#import "RACSignal+RACExtensions.h"

@implementation RACSignal (RACExtensions)

- (RACSignal *)flattenMapLatest:(__kindof RACSignal * _Nullable (^)(id _Nullable))block {
    return [[self
                map:^id _Nullable(id  _Nullable value) {
                    return block(value);
                }]
                switchToLatest];
}

- (RACSignal<RACTuple *> *)withLatestFrom:(RACSignal *)from {
    return [RACSignal zip:@[[self sample:from], from]];
}

@end
