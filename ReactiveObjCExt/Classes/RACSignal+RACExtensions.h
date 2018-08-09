//
//  RACSignal+RACExtensions.h
//  Pods-ReactiveObjCExt_Example
//
//  Created by sy on 2018/8/10.
//

#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface RACSignal<__covariant ValueType> (RACExtensions)

- (RACSignal *)flattenMapLatest:(__kindof RACSignal * _Nullable (^)(ValueType _Nullable value))block RAC_WARN_UNUSED_RESULT;

@end

NS_ASSUME_NONNULL_END
