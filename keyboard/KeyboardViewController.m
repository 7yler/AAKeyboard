//
//  KeyboardViewController.m
//  keyboard
//
//  Created by sonson on 2014/10/06.
//  Copyright (c) 2014年 sonson. All rights reserved.
//

#import "KeyboardViewController.h"

#import "AAKKeyboardView.h"
#import "AAKHelper.h"

@interface KeyboardViewController () <AAKKeyboardViewDelegate> {
	AAKKeyboardView *_keyboardView;
	NSLayoutConstraint *_heightConstraint;
}
@end

@implementation KeyboardViewController

- (void)dealloc {
	DNSLogMethod
}

- (void)keyboardViewDidPushEarthButton:(AAKKeyboardView*)keyboardView {
	[self advanceToNextInputMode];
}

- (void)keyboardViewDidPushDeleteButton:(AAKKeyboardView*)keyboardView {
	[self.textDocumentProxy deleteBackward];
}

- (void)keyboardView:(AAKKeyboardView*)keyboardView willInsertString:(NSString*)string {
}

- (UITraitCollection *)overrideTraitCollectionForChildViewController:(UIViewController *)childViewController {
	return self.traitCollection;
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	
	CGRect screenBounds = [[UIScreen mainScreen] bounds];
	CGFloat screenWidth = CGRectGetWidth(screenBounds);
	CGFloat screenHeight = CGRectGetHeight(screenBounds);
	
	if (_heightConstraint)
		[self.view removeConstraint:_heightConstraint];
	
	if (screenWidth < screenHeight) {
		_heightConstraint = [NSLayoutConstraint constraintWithItem:self.view
														 attribute:NSLayoutAttributeHeight
														 relatedBy:NSLayoutRelationEqual
															toItem:nil
														 attribute:NSLayoutAttributeNotAnAttribute
														multiplier:0.0
														  constant:216];
		[self.view addConstraint:_heightConstraint];
	}
	else {
		_heightConstraint = [NSLayoutConstraint constraintWithItem:self.view
														 attribute:NSLayoutAttributeHeight
														 relatedBy:NSLayoutRelationEqual
															toItem:nil
														 attribute:NSLayoutAttributeNotAnAttribute
														multiplier:0.0
														  constant:162];
		[self.view addConstraint:_heightConstraint];
	}
	
	[_keyboardView load];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self.view.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.view
																	attribute:NSLayoutAttributeLeading
																	relatedBy:NSLayoutRelationEqual
																	   toItem:self.view.superview
																	attribute:NSLayoutAttributeLeading
																   multiplier:1.0
																	 constant:0.0]];
	
	[self.view.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.view
																	attribute:NSLayoutAttributeTrailing
																	relatedBy:NSLayoutRelationEqual
																	   toItem:self.view.superview
																	attribute:NSLayoutAttributeTrailing
																   multiplier:1.0
																	 constant:0.0]];
	
	if (_heightConstraint)
		[self.view removeConstraint:_heightConstraint];
	
	CGFloat height = CGRectGetHeight(self.view.bounds);
	_heightConstraint = [NSLayoutConstraint constraintWithItem:self.view
													 attribute:NSLayoutAttributeHeight
													 relatedBy:NSLayoutRelationEqual
														toItem:nil
													 attribute:NSLayoutAttributeNotAnAttribute
													multiplier:0.0
													  constant:height];
	[self.view addConstraint:_heightConstraint];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	 self.view.translatesAutoresizingMaskIntoConstraints = NO;
	
	_keyboardView = [[AAKKeyboardView alloc] initWithFrame:self.view.bounds];
	_keyboardView.translatesAutoresizingMaskIntoConstraints = NO;
	_keyboardView.delegate = self;
	[self.view addSubview:_keyboardView];
	
	NSDictionary *views = NSDictionaryOfVariableBindings(_keyboardView);
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_keyboardView]-0-|"
																	  options:0 metrics:0 views:views]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_keyboardView]-0-|"
																	  options:0 metrics:0 views:views]];
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
}

@end
