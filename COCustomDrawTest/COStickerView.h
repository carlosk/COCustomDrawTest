//
//  COStickerView.h
//  COCustomDrawTest
//
//  Created by carlos on 14-1-26.
//  Copyright (c) 2014年 carlosk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "COGripViewBorderView.h"

typedef enum {
    COStickerView_BUTTON_NULL,
    COStickerView_BUTTON_DEL,
    COStickerView_BUTTON_RESIZE,
    COStickerView_BUTTON_CUSTOM,
    COStickerView_BUTTON_MAX
} COStickerView_BUTTONS;

@protocol COStickerViewDelegate;

@interface COStickerView : UIView
{
    COGripViewBorderView *borderView;
}

@property (assign, nonatomic) UIView *contentView;
@property (nonatomic) BOOL preventsPositionOutsideSuperview; //default = YES
@property (nonatomic) BOOL preventsResizing; //default = NO
@property (nonatomic) BOOL preventsDeleting; //default = NO
@property (nonatomic) BOOL preventsCustomButton; //default = YES
@property (nonatomic) CGFloat minWidth;
@property (nonatomic) CGFloat minHeight;

@property (strong, nonatomic) id <COStickerViewDelegate> delegate;

- (void)hideDelHandle;
- (void)showDelHandle;
- (void)hideEditingHandles;
- (void)showEditingHandles;
- (void)showCustmomHandle;
- (void)hideCustomHandle;
- (void)setButton:(COStickerView_BUTTONS)type image:(UIImage*)image;

@end

@protocol COStickerViewDelegate <NSObject>
@required
@optional
- (void)stickerViewDidBeginEditing:(COStickerView *)sticker;
- (void)stickerViewDidEndEditing:(COStickerView *)sticker;
- (void)stickerViewDidCancelEditing:(COStickerView *)sticker;
- (void)stickerViewDidClose:(COStickerView *)sticker;
#ifdef COStickerView_LONGPRESS
- (void)stickerViewDidLongPressed:(COStickerView *)sticker;
#endif
- (void)stickerViewDidCustomButtonTap:(COStickerView *)sticker;
@end


