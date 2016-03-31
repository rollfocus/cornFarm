//
//  LLSearchView.m
//  shiwulian
//
//  Created by lin zoup on 3/23/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#import "LLSearchView.h"
#import "LLDefine.h"
#import "ext.h"

@interface LLSearchView () <UITextFieldDelegate> {
    UITextField *inputView;
}

@end

@implementation LLSearchView

-(instancetype)init {
    if (self = [super init]) {
        //搜索框
        CGFloat searchWidth = 240.0 * LL_Scale_iPhone5s_320;
        CGFloat searchHeight = 25.0;
        CGFloat searchTop = (LL_Nag_Height - searchHeight) / 2;
        self.frame = CGRectMake(0, searchTop, searchWidth, searchHeight);
        self.backgroundColor = LL_Light_White;
        self.layer.cornerRadius = 2.0;
        
        inputView = [[UITextField alloc] init];
        inputView.frame = CGRectMake(4, 0, searchWidth-28.0, searchHeight);
        [inputView scaleHeight:0.7];
        inputView.font = [UIFont systemFontOfSize:12.0];
        inputView.tintColor = inputView.textColor;//光标颜色
        inputView.delegate = self;
        
        UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]];
        CGFloat iconSize = 16.0;
        iconView.frame = CGRectMake([self frameWidth] -iconSize - 4, ([self frameHeight]-iconSize)/2,
                                    iconSize, iconSize);
        iconView.userInteractionEnabled = YES;
        
        [self addSubview:inputView];
        [self addSubview:iconView];
        
        [iconView onTap:@selector(gotoSearch) target:self];
    }
    return self;
}

-(void)gotoSearch {
    [self endEditing:YES];
}


-(void)setPlaceText:(NSString *)placeText {
    inputView.placeholder = placeText;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.text = @"";
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [textField resignFirstResponder];
    [textField endEditing:YES];
    
    return YES;
}

@end
