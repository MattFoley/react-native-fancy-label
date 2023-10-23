/*
 * @providesModule FancyLabel
 * @flow
 */

import React from 'react';
import { ColorValue, HostComponent, ProcessedColorValue, View, ViewProps } from 'react-native';

import _ from 'lodash';
import {
  processColor,
  requireNativeComponent,
  StyleSheet,
  Text,
} from 'react-native';

type TruncateMode = 'None' | 'Tail' | 'Head' | 'HeadAndTail';
type BaselineAdjustment = 'AlignBaselines' | 'AlignCenters' | 'None';
type TextAlign = 'auto' | 'left' | 'right' | 'center' | 'justify';
type StrokePosition = "Outside" | "Center" | "Inside";

type IFancyLabelOnly = {
  fadeTruncatingMode ?: TruncateMode;
  textInsets?: any;
  automaticallyAdjustTextInsets?: boolean;
  letterSpacing?: number;
  baselineAdjustment?: BaselineAdjustment;
  minimumScaleFactor?: number;
  textAlign?: TextAlign;
  strokeSize?: number;
  strokeColor?: ColorValue;
  strokePosition?: StrokePosition

  textShadowOffset?: any;
  textShadowBlur?: number;
  textShadowColor?: ColorValue;

  innerTextShadowOffset?: object;
  innerTextShadowBlur?: number;
  innerTextShadowColor?: ColorValue;

  gradientStartPoint?: object;
  gradientEndPoint?: object;

  gradientColors?: Array<ColorValue>;

  fontFamily?: string;
  fontSize?: number;
  color?: ColorValue;
  adjustsFontSizeToFit?: boolean;
  text?: string;
};

const propsForNative = [
  "fadeTruncatingMode",
  "textInset",
  "automaticallyAdjustTextInsets",
  "letterSpacing",
  "baselineAdjustment",
  "minimumScaleFactor",
  "textAlign",
  "strokeSize",
  "strokeColor",
  "strokePosition",
  "textShadowOffset",
  "textShadowBlur",
  "textShadowColor",
  "innerTextShadowOffset",
  "innerTextShadowBlur",
  "innerTextShadowColor",
  "gradientStartPoint",
  "gradientEndPoint",
  "gradientColors",
  "fontFamily",
  "fontSize",
  "color",
  "adjustsFontSizeToFit",
  "text",
]

type IFancyLabel = ViewProps & IFancyLabelOnly;

const RNFancyLabel: HostComponent<IFancyLabel> = requireNativeComponent('MFLReactFancyLabel');

class FancyLabel extends React.Component<IFancyLabel> {
  render(): React.ReactNode {
    const styleProps = StyleSheet.flatten(this.props.style) || {};
    const viewProps = {
      ...this.props,
      style: {
        ..._.omit(styleProps, propsForNative)
      }
    };
    const labelProps = _.pick(styleProps, propsForNative);
    const textProps = _.pick(styleProps, ['fontSize', 'fontFamily', 'letterSpacing']);

    if (processColor) {
      const colorPropKeys = ["gradientColors", "strokeColor", "textShadowColor", "innerTextShadowColor", "color"];
      const colorPropValues = _.pick(styleProps, colorPropKeys);

      _.assign(labelProps, _.mapValues(colorPropValues, (c: *): ProcessedColorValue | null | undefined | (ProcessedColorValue | null | undefined)[] => {
        if (Array.isArray(c)) {
          return c.map(processColor);
        } else {
          return processColor(c);
        }
      }));
    }

    return (
      <RNFancyLabel {..._.merge(viewProps, labelProps, {adjustsFontSizeToFit: true})} text={this.props.children}>
        <Text style={[textProps, {marginHorizontal: 2}]} allowFontScaling={false}>
          {this.props.children}
        </Text>
      </RNFancyLabel>
    );
  }
}

export default FancyLabel;
