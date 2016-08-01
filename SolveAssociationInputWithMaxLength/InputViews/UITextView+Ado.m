//
//  UITextView+Ado.m
//  SolveAssociationInputWithMaxLength
//
//  Created by 杜维欣 on 16/7/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

#import "UITextView+Ado.h"
#import <objc/runtime.h>

@implementation UITextView (Ado)

- (NSInteger)ado_maxInputLength {
    NSInteger maxLength = [objc_getAssociatedObject(self, _cmd) integerValue];
    return maxLength == 0 ? NSIntegerMax : maxLength;
}

- (void)setAdo_maxInputLength:(NSInteger)ado_maxInputLength {
    objc_setAssociatedObject(self, @selector(ado_maxInputLength), @(ado_maxInputLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewCheckInputLength:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)textViewCheckInputLength:(UITextView *)textView {
    if (self.markedTextRange != nil) return;
    if (self.text.length > self.ado_maxInputLength) self.text = [self.text substringToIndex:self.ado_maxInputLength];
}

- (BOOL)ado_canPaste {
    id canPaste = objc_getAssociatedObject(self, _cmd);
    if (!canPaste) objc_setAssociatedObject(self, @selector(ado_canPaste), @(YES), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setAdo_canPaste:(BOOL)ado_canPaste {
    objc_setAssociatedObject(self, @selector(ado_canPaste), @(ado_canPaste), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (self.ado_canPaste) return [super canPerformAction:action withSender:sender];
    SEL paste = @selector(paste:);
    if (paste == action)  return NO;
    return [super canPerformAction:action withSender:sender];
}

//- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
@end
