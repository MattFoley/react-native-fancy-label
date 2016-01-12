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

RCT_EXPORT_VIEW_PROPERTY(innerShadowOffset, CGSize);
RCT_EXPORT_VIEW_PROPERTY(innerShadowBlur, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(innerShadowColor, UIColor);

RCT_EXPORT_VIEW_PROPERTY(shadowBlur, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(shadowColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(shadowOffset, CGSize);

RCT_EXPORT_VIEW_PROPERTY(adjustsFontSizeToFitWidth, BOOL);
RCT_EXPORT_VIEW_PROPERTY(baselineAdjustment, UIBaselineAdjustment);
RCT_EXPORT_VIEW_PROPERTY(minimumScaleFactor, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(textAlignment, NSTextAlignment);

RCT_EXPORT_VIEW_PROPERTY(gradientStartPoint, CGPoint);
RCT_EXPORT_VIEW_PROPERTY(gradientEndPoint, CGPoint);
RCT_EXPORT_VIEW_PROPERTY(gradientStartColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(gradientEndColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(gradientColors, NSArray);

RCT_EXPORT_VIEW_PROPERTY(fontFace, NSString);
RCT_EXPORT_VIEW_PROPERTY(fontSize, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(textColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(text, NSString);

@end
