//
//  MFLReactFancyLabel.m
//  ReactNativeFancyLabel
//
//  Created by TJ Fallon on 1/11/16.
//  Copyright © 2016 Skillz. All rights reserved.
//

#import "MFLReactFancyLabel.h"
#import "THLabel.h"
#import "RCTConvert.h"

@interface MFLReactFancyLabel () <RCTBridgeModule>

@property RCTEventDispatcher *eventDispatcher;
@property THLabel *label;

@end

@implementation MFLReactFancyLabel

RCT_EXPORT_MODULE();

- (id)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
  self = [super initWithFrame:CGRectZero];
  if (self) {
    _eventDispatcher = eventDispatcher;
    [self setupLabel];
  }
  return self;
}

- (void)layoutSubviews
{
  [self.label setFrame:self.bounds];
  [self.label setNeedsDisplay];
  [self.label setNeedsLayout];
}

- (void)setFrame:(CGRect)frame
{
  [super setFrame:frame];
  [self.label setFrame:self.bounds];
}

- (void)setupLabel
{
  self.label = [[THLabel alloc] initWithFrame:self.bounds];
  [self.label setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
  [self addSubview:self.label];
}

#pragma mark Manager Setters

- (void)setText:(NSString *)text
{
  self.label.text = text;
  [self.label setNeedsDisplay];
}

- (void)setTextColor:(UIColor *)textColor
{
  self.label.textColor = textColor;
  [self.label setNeedsDisplay];
}

- (void)setFontFace:(NSString *)fontFace
{
  self.label.font = [UIFont fontWithName:fontFace size:self.label.font.pointSize];
  [self.label setNeedsDisplay];
}

- (void)setFontSize:(CGFloat)fontSize
{
  self.label.font = [UIFont fontWithName:self.label.font.fontName size:fontSize];
  [self.label setNeedsDisplay];
}

- (void)setGradientColors:(NSArray *)gradientColors
{
  NSMutableArray *colors = [NSMutableArray arrayWithCapacity:gradientColors.count];
  for (NSString *colorString in gradientColors) {
    [colors addObject:[RCTConvert UIColor:colorString]];
  }
  self.label.gradientColors = colors;
  [self.label setNeedsDisplay];
}

- (void)setGradientEndColor:(UIColor *)gradientEndColor
{
  self.label.gradientEndColor = gradientEndColor;
  [self.label setNeedsDisplay];
}

- (void)setGradientStartColor:(UIColor *)gradientStartColor
{
  self.label.gradientStartColor = gradientStartColor;
  [self.label setNeedsDisplay];
}

- (void)setGradientEndPoint:(CGPoint)gradientEndPoint
{
  self.label.gradientEndPoint = gradientEndPoint;
  [self.label setNeedsDisplay];
}

- (void)setGradientStartPoint:(CGPoint)gradientStartPoint
{
  self.label.gradientStartPoint = gradientStartPoint;
  [self.label setNeedsDisplay];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
  self.label.textAlignment = textAlignment;
  [self.label setNeedsDisplay];
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
  self.label.shadowOffset = shadowOffset;
  [self.label setNeedsDisplay];
}

- (void)setShadowColor:(UIColor *)shadowColor
{
  self.label.shadowColor = shadowColor;
  [self.label setNeedsDisplay];
}

- (void)setShadowBlur:(CGFloat)shadowBlur
{
  self.label.shadowBlur = shadowBlur;
  [self.label setNeedsDisplay];
}

- (void)setInnerShadowOffset:(CGSize)innerShadowOffset
{
  self.label.innerShadowOffset = innerShadowOffset;
  [self.label setNeedsDisplay];
}

- (void)setInnerShadowColor:(UIColor *)innerShadowColor
{
  self.label.innerShadowColor = innerShadowColor;
  [self.label setNeedsDisplay];
}

- (void)setInnerShadowBlur:(CGFloat)innerShadowBlur
{
  self.label.innerShadowBlur = innerShadowBlur;
  [self.label setNeedsDisplay];
}

- (void)setStrokePosition:(THLabelStrokePosition)strokePosition
{
  self.label.strokePosition = strokePosition;
  [self.label setNeedsDisplay];
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
  self.label.strokeColor = strokeColor;
  [self.label setNeedsDisplay];
}

- (void)setStrokeSize:(CGFloat)strokeSize
{
  self.label.strokeSize = strokeSize;
  [self.label setNeedsDisplay];
}

- (void)setLetterSpacing:(CGFloat)letterSpacing
{
  self.label.letterSpacing = letterSpacing;
  [self.label setNeedsDisplay];
}

- (void)setAutomaticallyAdjustTextInsets:(BOOL)automaticallyAdjustTextInsets
{
  self.label.letterSpacing = automaticallyAdjustTextInsets;
  [self.label setNeedsDisplay];
}

- (void)setTextInsets:(UIEdgeInsets)textInsets
{
  self.label.textInsets = textInsets;
  [self.label setNeedsDisplay];
}

- (void)setFadeTruncatingMode:(THLabelFadeTruncatingMode)fadeTruncatingMode
{
  self.label.fadeTruncatingMode = fadeTruncatingMode;
  [self.label setNeedsDisplay];
}

- (void)setBaselineAdjustment:(UIBaselineAdjustment)baselineAdjustment
{
  self.label.baselineAdjustment = baselineAdjustment;
  [self.label setNeedsDisplay];
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth
{
  self.label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
  [self.label setNeedsDisplay];
}

- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor
{
  self.label.minimumScaleFactor = minimumScaleFactor;
  [self.label setNeedsDisplay];
}

#pragma mark Enum Export

- (NSDictionary *)constantsToExport
{
  return @{@"StrokePosition" : @{ @"Outside" : @(THLabelStrokePositionOutside),
                                  @"Center" : @(THLabelStrokePositionCenter),
                                  @"Inside" : @(THLabelStrokePositionInside)
                                  },

           @"FadeMode" : @{ @"None" : @(0),
                            @"Tail" : @(1 << 0),
                            @"Head" : @(1 << 1),
                            @"HeadAndTail" : @(THLabelFadeTruncatingModeHead | THLabelFadeTruncatingModeTail)
                            },

           @"BaselineAdjustment" : @{ @"AlignBaselines" : @(UIBaselineAdjustmentAlignBaselines),
                                      @"AlignCenters" : @(UIBaselineAdjustmentAlignCenters),
                                      @"None" : @(UIBaselineAdjustmentNone)
                                      },

           @"TextAlignment" : @{ @"Left" : @(NSTextAlignmentLeft),
                                 @"Center" : @(NSTextAlignmentCenter),
                                 @"Right" : @(NSTextAlignmentRight),
                                 @"Justified" : @(NSTextAlignmentJustified),
                                 @"Natural" : @(NSTextAlignmentNatural),
                                 }
           };
}

@end

#pragma mark Enum Conversion

@implementation RCTConvert (UIBaselineAdjustment)

RCT_ENUM_CONVERTER(UIBaselineAdjustment, ( @{ @"AlignBaselines" : @(UIBaselineAdjustmentAlignBaselines),
                                              @"AlignCenters" : @(UIBaselineAdjustmentAlignCenters),
                                              @"None" : @(UIBaselineAdjustmentNone)
                                              }
                                          ), UIBaselineAdjustmentAlignCenters, integerValue)

@end

@implementation RCTConvert (THLabelStrokePosition)

RCT_ENUM_CONVERTER(THLabelStrokePosition, (  @{ @"Outside" : @(THLabelStrokePositionOutside),
                                                @"Center" : @(THLabelStrokePositionCenter),
                                                @"Inside" : @(THLabelStrokePositionInside)
                                                }
                                           ), THLabelStrokePositionCenter, integerValue)

@end

@implementation RCTConvert (THLabelFadeTruncatingMode)

RCT_ENUM_CONVERTER(THLabelFadeTruncatingMode, ( @{ @"None" : @(0),
                                                   @"Tail" : @(1 << 0),
                                                   @"Head" : @(1 << 1),
                                                   @"HeadAndTail" : @(THLabelFadeTruncatingModeHead | THLabelFadeTruncatingModeTail)
                                                   }
                                               ), THLabelStrokePositionCenter, unsignedIntegerValue)

@end
