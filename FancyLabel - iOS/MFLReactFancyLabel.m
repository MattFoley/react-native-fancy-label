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

@property (nonatomic) RCTEventDispatcher *eventDispatcher;
@property (nonatomic) THLabel *label;
@property (nonatomic) UIView *observedView;

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

- (void)dealloc
{
    self.observedView = nil;
}

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index
{
    if ([view respondsToSelector:@selector(textStorage)]) {
        self.observedView = view;
        view.hidden = YES;
    }
    [super insertSubview:view atIndex:index];
}

- (void)setObservedView:(UIView *)view
{
    if (_observedView != view) {
        [_observedView removeObserver:self forKeyPath:@"textStorage"];

        if (view) {
            [view addObserver:self
                             forKeyPath:@"textStorage"
                                options:NSKeyValueObservingOptionNew
                                context:nil];
        }
        _observedView = view;
    }
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

- (void)setColor:(UIColor *)textColor
{
  self.label.textColor = textColor;
  [self.label setNeedsDisplay];
}

- (void)setFontFamily:(NSString *)fontFace
{
  self.label.font = [UIFont fontWithName:fontFace size:self.label.font.pointSize];
  [self.label setNeedsDisplay];
}

- (void)setFontSize:(CGFloat)fontSize
{
  self.label.font = [UIFont fontWithName:self.label.font.fontName size:fontSize];
  [self.label setNeedsDisplay];
}

- (void)setGradientColors:(NSArray<UIColor*> *)gradientColors
{
    self.label.gradientColors = gradientColors;
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

- (void)setTextAlign:(NSTextAlignment)alignment
{
  self.label.textAlignment = textAlignment;
  [self.label setNeedsDisplay];
}

- (void)setTextShadowOffset:(CGSize)shadowOffset
{
  self.label.shadowOffset = shadowOffset;
  [self.label setNeedsDisplay];
}

- (void)setTextShadowColor:(UIColor *)shadowColor
{
  self.label.shadowColor = shadowColor;
  [self.label setNeedsDisplay];
}

- (void)setTextShadowBlur:(CGFloat)shadowBlur
{
  self.label.shadowBlur = shadowBlur;
  [self.label setNeedsDisplay];
}

- (void)setInnerTextShadowOffset:(CGSize)innerShadowOffset
{
  self.label.innerShadowOffset = innerShadowOffset;
  [self.label setNeedsDisplay];
}

- (void)setInnerTextShadowColor:(UIColor *)innerShadowColor
{
  self.label.innerShadowColor = innerShadowColor;
  [self.label setNeedsDisplay];
}

- (void)setInnerTextShadowBlur:(CGFloat)innerShadowBlur
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

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    UIView *textView = (UIView *) object;
    NSString *string = [change[@"new"] performSelector:@selector(string)];
    
    if (string) {
        [self.label setText:string];
    }
    textView.hidden = YES;
}


#pragma mark Enum Export
@end
