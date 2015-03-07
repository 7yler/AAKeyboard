//
//  AAKNotifyView.h
//  AAKeyboardApp
//
//  Created by sonson on 2014/11/11.
//  Copyright (c) 2014年 sonson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAKNotifyView : UIView
- (instancetype)initWithMarginSize:(CGSize)marginSize keyboardAppearance:(UIKeyboardAppearance)keyboardAppearance;
- (void)setText:(NSString*)text;
@end
