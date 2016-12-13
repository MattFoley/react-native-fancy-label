//
//  MFLReactFancyLabelManager.m
//  ReactNativeFancyLabel
//
//  Created by TJ Fallon on 1/11/16.
//  Copyright © 2016 Skillz. All rights reserved.
//

#import "MFLReactFancyLabelManager.h"
#import "MFLReactFancyLabel.h"
#import "RCTBridge.h"
#import "THLabel.h"

@implementation RCTConvert(MFLReactFancyLabelManager)

RCT_ENUM_CONVERTER(UIBaselineAdjustment, (@{
    @"AlignBaselines" : @(UIBaselineAdjustmentAlignBaselines),
    @"AlignCenters" : @(UIBaselineAdjustmentAlignCenters),
    @"None" : @(UIBaselineAdjustmentNone)
}), UIBaselineAdjustmentAlignCenters, integerValue)

RCT_ENUM_CONVERTER(THLabelFadeTruncatingMode, (@{
    @"None": @(0),
    @"Tail": @(1),
    @"Head": @(2),
    @"HeadAndTail": @(3),
}), 0, unsignedIntegerValue)

RCT_ENUM_CONVERTER(THLabelStrokePosition, (  @{
    @"Outside" : @(THLabelStrokePositionOutside),
    @"Center" : @(THLabelStrokePositionCenter),
    @"Inside" : @(THLabelStrokePositionInside)
}
), THLabelStrokePositionCenter, integerValue)

@end

@interface MFLReactFancyLabelManager () <RCTBridgeModule>

@end

@implementation MFLReactFancyLabelManager

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

- (UIView *)view
{
  return [[MFLReactFancyLabel alloc] initWithEventDispatcher:self.bridge.eventDispatcher];
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_VIEW_PROPERTY(fadeTruncatingMode, THLabelFadeTruncatingMode);
RCT_EXPORT_VIEW_PROPERTY(textInsets, UIEdgeInsets);
RCT_EXPORT_VIEW_PROPERTY(automaticallyAdjustTextInsets, BOOL);

RCT_EXPORT_VIEW_PROPERTY(letterSpacing, CGFloat);

RCT_EXPORT_VIEW_PROPERTY(strokeSize, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(strokeColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(strokePosition, THLabelStrokePosition);

RCT_EXPORT_VIEW_PROPERTY(innerTextShadowOffset, CGSize);
RCT_EXPORT_VIEW_PROPERTY(innerTextShadowBlur, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(innerTextShadowColor, UIColor);

RCT_EXPORT_VIEW_PROPERTY(textShadowBlur, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(textShadowColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(textShadowOffset, CGSize);

RCT_EXPORT_VIEW_PROPERTY(adjustsFontSizeToFitWidth, BOOL);
RCT_EXPORT_VIEW_PROPERTY(baselineAdjustment, UIBaselineAdjustment);
RCT_EXPORT_VIEW_PROPERTY(minimumScaleFactor, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(textAlign, NSTextAlignment);

RCT_EXPORT_VIEW_PROPERTY(gradientColors, NSArray<UIColor*>);
RCT_EXPORT_VIEW_PROPERTY(gradientStartPoint, CGPoint);
RCT_EXPORT_VIEW_PROPERTY(gradientEndPoint, CGPoint);

RCT_EXPORT_VIEW_PROPERTY(fontFamily, NSString);
RCT_EXPORT_VIEW_PROPERTY(fontSize, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(color, UIColor);
RCT_EXPORT_VIEW_PROPERTY(text, NSString);


@end
