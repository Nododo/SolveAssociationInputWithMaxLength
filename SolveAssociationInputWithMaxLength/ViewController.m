//
//  ViewController.m
//  SolveAssociationInputWithMaxLength
//
//  Created by 杜维欣 on 16/7/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+Ado.h"
#import "UITextField+Ado.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *field;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.field.ado_maxInputLength = 20;
    self.field.ado_canPaste = NO;
    self.textView.ado_maxInputLength = 30;
    self.textView.ado_canPaste = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
