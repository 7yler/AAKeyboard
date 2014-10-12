//
//  AAKContentCell.h
//  AAKeyboardApp
//
//  Created by sonson on 2014/10/09.
//  Copyright (c) 2014年 sonson. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AAKTextView.h"

@interface AAKContentCell : UICollectionViewCell
@property (nonatomic, readonly) UILabel *label;
@property (nonatomic, readonly) AAKTextView *textView;
@end
