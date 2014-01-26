//
//  ViewController.m
//  COCustomDrawTest
//
//  Created by carlos on 14-1-26.
//  Copyright (c) 2014年 carlosk. All rights reserved.
//

#import "ViewController.h"
#import "COStickerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    UIImageView *imageView1 = [[UIImageView alloc]
                               initWithImage:[UIImage imageNamed:@"sampleImage1"]];
    
    UIImageView *imageView2 = [[UIImageView alloc]
                               initWithImage:[UIImage imageNamed:@"sampleImage2"]];
    imageView2.backgroundColor = [UIColor clearColor];
    CGRect gripFrame1 = CGRectMake(50, 50, 140, 140);
    
    UIView* contentView = [[UIView alloc] initWithFrame:gripFrame1];
    [contentView setBackgroundColor:[UIColor blackColor]];
    [contentView addSubview:imageView1];
    [contentView addSubview:imageView2];
    
    COStickerView *userResizableView1 = [[COStickerView alloc] initWithFrame:gripFrame1];
    userResizableView1.tag = 0;
//    userResizableView1.delegate = self;
    userResizableView1.contentView = contentView;//contentView;
    userResizableView1.preventsPositionOutsideSuperview = NO;
    [userResizableView1 showEditingHandles];
    [self.view addSubview:userResizableView1];
    
    CGRect gripFrame2 = CGRectMake(50, 200, 180, 140);
    UITextView *textView = [[UITextView alloc] initWithFrame:gripFrame2];
    textView.text = @"大家好，我是消息";
    COStickerView *userResizableView2 = [[COStickerView alloc] initWithFrame:gripFrame2];
    userResizableView2.tag = 1;
//    userResizableView2.delegate = self;
    userResizableView2.contentView = textView;
    userResizableView2.preventsPositionOutsideSuperview = NO;
    userResizableView2.preventsCustomButton = NO;
    [userResizableView2 setButton:COStickerView_BUTTON_CUSTOM
                            image:[UIImage imageNamed:@"Write"]];
    userResizableView2.preventsResizing = YES;
    [userResizableView2 showEditingHandles];
    [self.view addSubview:userResizableView2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
