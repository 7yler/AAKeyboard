//
//  AAKPreviewController.m
//  AAKeyboardApp
//
//  Created by sonson on 2014/10/30.
//  Copyright (c) 2014年 sonson. All rights reserved.
//

#import "AAKPreviewController.h"

#import "AAKTextView.h"
#import "NSParagraphStyle+keyboard.h"
#import "AAKASCIIArt.h"

@interface AAKPreviewController () {
}

@end

@implementation AAKPreviewController

- (IBAction)close:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	CGFloat fontSize = 15;
	
	NSParagraphStyle *paragraphStyle = [NSParagraphStyle defaultParagraphStyleWithFontSize:fontSize];
	NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraphStyle, NSFontAttributeName:[UIFont fontWithName:@"Mona" size:fontSize]};
	NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:_art.asciiArt attributes:attributes];
	
	_textView.attributedString = string;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
