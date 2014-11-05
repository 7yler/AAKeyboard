//
//  AAKEditViewController.h
//  AAKeyboardApp
//
//  Created by sonson on 2014/10/22.
//  Copyright (c) 2014年 sonson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AAKASCIIArt;
@class AAKASCIIArtGroup;

@interface AAKEditViewController : UIViewController {
	IBOutlet UISlider		*_fontSizeSlider;
	IBOutlet UITableView	*_groupTableView;
}
@property (nonatomic, strong) AAKASCIIArtGroup *group;
@property (nonatomic, strong) AAKASCIIArt *art;
@property (nonatomic, strong) IBOutlet UITextView *AATextView;
- (IBAction)didChangeSlider:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
@end
