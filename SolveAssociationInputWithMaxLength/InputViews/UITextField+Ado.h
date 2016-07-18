//
//  UITextField+Ado.h
//  SolveAssociationInputWithMaxLength
//
//  Created by 杜维欣 on 16/7/15.
//  Copyright © 2016年 Nododo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Ado)

@property (nonatomic,assign)NSInteger ado_maxInputLength;//default is NSIntegerMax

@property (nonatomic,assign)BOOL ado_canPaste; //default is YES

@end
