    //
//  TestViewController.m
//  fStats
//
//  Created by Shawn Veader on 9/18/10.
//  Copyright 2010 V8 Labs, LLC. All rights reserved.
//

#import "TestViewController.h"


@implementation TestViewController

#pragma mark - iVars
int indexCount;

#pragma mark - Init/Dealloc
- (id)init {
	self = [super init];
	if (self) {
		self.titleArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"%3", @"%4", @"%5", @"%6", nil];
		indexCount = 0;
	}
	return self;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View Management Methods
- (void)viewDidLoad {
	[super viewDidLoad];

	self.view.backgroundColor = [UIColor blackColor];
	CGFloat margin = 40.0f;
	CGFloat width = (self.view.bounds.size.width - (margin * 2.0f));
	CGFloat pickerHeight = 40.0f;
	CGFloat x = margin;
	CGFloat y = 150.0f;
	CGFloat spacing = 25.0f;
	CGRect tmpFrame = CGRectMake(x, y, 2 * width, pickerHeight);

//	CGFloat width = 200.0f;
//	CGFloat x = (self.view.frame.size.width - width) / 2.0f;
//	CGRect tmpFrame = CGRectMake(x, 150.0f, width, 40.0f);

	self.pickerView = [[V8HorizontalPickerView alloc] initWithFrame:tmpFrame];
	self.pickerView.backgroundColor   = [UIColor darkGrayColor];
	self.pickerView.selectedTextColor = [UIColor blackColor];
	self.pickerView.textColor   = [UIColor grayColor];
	self.pickerView.delegate    = self;
	self.pickerView.dataSource  = self;
	self.pickerView.elementFont = [UIFont boldSystemFontOfSize:14.0f];
	self.pickerView.selectionPoint = CGPointMake(60, 0);
    
    self.pickerView.viewUnderLabel = [[UIView alloc] initWithFrame:CGRectZero];
    self.pickerView.viewUnderLabel.backgroundColor = [UIColor clearColor];
    self.pickerView.viewUnderLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    self.pickerView.viewUnderLabel.layer.borderWidth = 1;
    
    self.pickerView.selectedViewUnderLabel = [[UIView alloc] initWithFrame:CGRectZero];
    self.pickerView.selectedViewUnderLabel.backgroundColor = [UIColor whiteColor];
    
    self.pickerView.borderRadius = 20;
    self.pickerView.elementPadding = 0;
    
	[self.view addSubview:self.pickerView];
}

- (void)viewDidUnload {
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	self.pickerView = nil;
	self.nextButton = nil;
	self.infoLabel  = nil;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.pickerView scrollToElement:0 animated:NO];
}


#pragma mark - Button Tap Handlers
- (void)nextButtonTapped:(id)sender {
	[self.pickerView scrollToElement:indexCount animated:NO];
	indexCount += 1;
	if ([self.titleArray count] <= indexCount) {
		indexCount = 0;
	}
	[self.nextButton setTitle:[NSString stringWithFormat:@"Center Element %d", indexCount]
					 forState:UIControlStateNormal];
}

- (void)reloadButtonTapped:(id)sender {
	// change our title array so we can see a change
	if ([self.titleArray count] > 1) {
		[self.titleArray removeLastObject];
	}

	[self.pickerView reloadData];
}

#pragma mark - HorizontalPickerView DataSource Methods
- (NSInteger)numberOfElementsInHorizontalPickerView:(V8HorizontalPickerView *)picker {
	return [self.titleArray count];
}

#pragma mark - HorizontalPickerView Delegate Methods
- (NSString *)horizontalPickerView:(V8HorizontalPickerView *)picker titleForElementAtIndex:(NSInteger)index {
	return [self.titleArray objectAtIndex:index];
}

- (NSInteger) horizontalPickerView:(V8HorizontalPickerView *)picker widthForElementAtIndex:(NSInteger)index {
	CGSize constrainedSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
	NSString *text = [self.titleArray objectAtIndex:index];
	CGSize textSize = [text sizeWithFont:[UIFont boldSystemFontOfSize:18.0f]
					   constrainedToSize:constrainedSize
						   lineBreakMode:UILineBreakModeWordWrap];
	return 60; // 20px padding on each side
}

- (void)horizontalPickerView:(V8HorizontalPickerView *)picker didSelectElementAtIndex:(NSInteger)index {
	self.infoLabel.text = [NSString stringWithFormat:@"Selected index %d", index];
}

@end
