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
@property (nonatomic) UILabel *label;
@property (nonatomic) THLabel *thLabel;

@property (nonatomic) UIView *observedView;

@end

@implementation MFLReactFancyLabel

RCT_EXPORT_MODULE();

- (id)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        _eventDispatcher = eventDispatcher;
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

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    NSString *string = [change[@"new"] performSelector:@selector(string)];
    
    if (string) {
        [self.label setText:string];
    }
}

- (void)layoutSubviews
{
    [self.label setFrame:self.bounds];
    if (_thLabel) {
        _thLabel.frame = CGRectInset(_thLabel.frame, -2, -2);
    }
    [self.observedView removeFromSuperview];
    [self.label setNeedsDisplay];
    [self.label setNeedsLayout];
}

- (UILabel*)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:self.label];
    }
    return _label;
}

- (THLabel*)thLabel
{
    if (!_thLabel) {
        _thLabel = [[THLabel alloc] initWithFrame:self.bounds];
        if (_label) {
            _thLabel.text = _label.text;
            _thLabel.textColor = _label.textColor;
            _thLabel.font = _label.font;
            _thLabel.textAlignment = _label.textAlignment;
            _thLabel.shadowOffset = _label.shadowOffset;
            _thLabel.shadowColor = _label.shadowColor;
            _thLabel.baselineAdjustment = _label.baselineAdjustment;
            _thLabel.adjustsFontSizeToFitWidth = _label.adjustsFontSizeToFitWidth;
            _thLabel.minimumScaleFactor = _label.minimumScaleFactor;
            
            [_label removeFromSuperview];
        }
        _label = _thLabel;

        [self addSubview:_thLabel];
    }
    return _thLabel;
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

- (void)setTextAlign:(NSTextAlignment)alignment
{
    self.label.textAlignment = alignment;
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

#pragma mark - THLabel Properties

- (void)setGradientColors:(NSArray<UIColor*> *)gradientColors
{
    self.thLabel.gradientColors = gradientColors;
    [self.thLabel setNeedsDisplay];
}

- (void)setGradientEndColor:(UIColor *)gradientEndColor
{
    self.thLabel.gradientEndColor = gradientEndColor;
    [self.thLabel setNeedsDisplay];
}

- (void)setGradientStartColor:(UIColor *)gradientStartColor
{
    self.thLabel.gradientStartColor = gradientStartColor;
    [self.thLabel setNeedsDisplay];
}

- (void)setGradientEndPoint:(CGPoint)gradientEndPoint
{
    self.thLabel.gradientEndPoint = gradientEndPoint;
    [self.thLabel setNeedsDisplay];
}

- (void)setGradientStartPoint:(CGPoint)gradientStartPoint
{
    self.thLabel.gradientStartPoint = gradientStartPoint;
    [self.thLabel setNeedsDisplay];
}

- (void)setTextShadowBlur:(CGFloat)shadowBlur
{
    self.thLabel.shadowBlur = shadowBlur;
    [self.thLabel setNeedsDisplay];
}

- (void)setInnerTextShadowOffset:(CGSize)innerShadowOffset
{
    self.thLabel.innerShadowOffset = innerShadowOffset;
    [self.thLabel setNeedsDisplay];
}

- (void)setInnerTextShadowColor:(UIColor *)innerShadowColor
{
    self.thLabel.innerShadowColor = innerShadowColor;
    [self.thLabel setNeedsDisplay];
}

- (void)setInnerTextShadowBlur:(CGFloat)innerShadowBlur
{
    self.thLabel.innerShadowBlur = innerShadowBlur;
    [self.thLabel setNeedsDisplay];
}

- (void)setStrokePosition:(THLabelStrokePosition)strokePosition
{
    self.thLabel.strokePosition = strokePosition;
    [self.thLabel setNeedsDisplay];
}

- (void)setStrokeColor:(UIColor *)strokeColor
{
    self.thLabel.strokeColor = strokeColor;
    [self.thLabel setNeedsDisplay];
}

- (void)setStrokeSize:(CGFloat)strokeSize
{
    self.thLabel.strokeSize = strokeSize;
    [self.thLabel setNeedsDisplay];
}

- (void)setLetterSpacing:(CGFloat)letterSpacing
{
    self.thLabel.letterSpacing = letterSpacing;
    [self.thLabel setNeedsDisplay];
}

- (void)setAutomaticallyAdjustTextInsets:(BOOL)automaticallyAdjustTextInsets
{
    self.thLabel.letterSpacing = automaticallyAdjustTextInsets;
    [self.thLabel setNeedsDisplay];
}

- (void)setTextInsets:(UIEdgeInsets)textInsets
{
    self.thLabel.textInsets = textInsets;
    [self.thLabel setNeedsDisplay];
}

- (void)setFadeTruncatingMode:(THLabelFadeTruncatingMode)fadeTruncatingMode
{
    self.thLabel.fadeTruncatingMode = fadeTruncatingMode;
    [self.thLabel setNeedsDisplay];
}

#pragma mark Enum Export
@end
