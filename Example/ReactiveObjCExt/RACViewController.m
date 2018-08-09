//
//  RACViewController.m
//  ReactiveObjCExt
//
//  Created by sylvanasx on 08/10/2018.
//  Copyright (c) 2018 sylvanasx. All rights reserved.
//

#import "RACViewController.h"
#import "RACSignal+RACExtensions.h"

@interface RACViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) RACSignal *s1;
@property (strong, nonatomic) RACSignal *s2;
@end

@implementation RACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.s1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [subscriber sendNext:@"@1"];
            sleep(1);
            [subscriber sendNext:@"@2"];
            sleep(1);
            [subscriber sendNext:@"@3"];
            sleep(1);
            [subscriber sendNext:@"@4"];
            sleep(1);
            [subscriber sendNext:@"@5"];
            sleep(1);
            [subscriber sendNext:@"@6"];
            sleep(1);
            [subscriber sendCompleted];
        });
        
      
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    
    self.s2 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [subscriber sendNext:@"@@1"];
            sleep(1);
            [subscriber sendNext:@"@@2"];
            sleep(1);
            [subscriber sendNext:@"@@3"];
            sleep(1);
            [subscriber sendNext:@"@@4"];
            sleep(1);
            [subscriber sendNext:@"@@5"];
            sleep(1);
            [subscriber sendNext:@"@@6"];
            sleep(1);
            [subscriber sendCompleted];
        });
       
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    
    static int i = 0;
    [[self.textField.rac_textSignal flattenMapLatest:^__kindof RACSignal * _Nullable(NSString * _Nullable value) {
        i++;
        if (2 == i) {
            return self.s1;
        } else if (3 == i) {
            return self.s2;
        } else {
            return [RACSignal empty];
        }
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
