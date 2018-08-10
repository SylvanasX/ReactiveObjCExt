//
//  NSURLSession+RACExtensions.h
//  Pods-ReactiveObjCExt_Example
//
//  Created by ptyuan on 2018/8/10.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface NSURLSession (RACExtensions)

- (RACSignal<RACTwoTuple<NSURLResponse *, NSData *> *> *)rac_responseSignalWithRequest:(NSURLRequest *)request;

@end
