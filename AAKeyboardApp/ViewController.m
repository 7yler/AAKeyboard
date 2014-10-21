//
//  ViewController.m
//  AAKeyboardApp
//
//  Created by sonson on 2014/10/06.
//  Copyright (c) 2014年 sonson. All rights reserved.
//

#import "ViewController.h"
#import "DummyKeyboardViewController.h"

@interface ViewController () {
	IBOutlet UITextView *_textView;
}
@end

@implementation ViewController

- (IBAction)changed:(id)sender {
	UISlider *slider = sender;
	CGFloat fontSize = slider.value;
	_textView.font = [UIFont fontWithName:@"Mona" size:fontSize];
}

- (IBAction)clear:(id)sender {
	_textView.text = @"";
}

- (UITraitCollection *)overrideTraitCollectionForChildViewController:(UIViewController *)childViewController {
	return self.traitCollection;
}

- (void)keyboardDidChangeFrameNotification:(NSNotification*)notification {
	NSValue *value = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
	CGRect rect = [value CGRectValue];
	NSLog(@"%f,%f,%f,%f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChangeFrameNotification:) name:UIKeyboardDidChangeFrameNotification object:nil];
	
	
	DummyKeyboardViewController *controller = [[DummyKeyboardViewController alloc] init];
	[self addChildViewController:controller];
	[self.view addSubview:controller.view];
}

@end
