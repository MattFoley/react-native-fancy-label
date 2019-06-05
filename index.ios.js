/*
 * @providesModule FancyLabel
 * @flow
 */

import React from 'react';
import _ from 'lodash';
import PropTypes from 'prop-types';
import {
  ColorPropType,
  processColor,
  requireNativeComponent,
  StyleSheet,
  Text,
  ViewPropTypes,
} from 'react-native';

const PointPropType = require('react-native/Libraries/StyleSheet/PointPropType');
const StyleSheetValidation = require('react-native/Libraries/StyleSheet/StyleSheetValidation')
const ViewStylePropTypes = require('react-native/Libraries/DeprecatedPropTypes/DeprecatedViewStylePropTypes.js');
const StyleSheetPropType = require('react-native/Libraries/DeprecatedPropTypes/DeprecatedStyleSheetPropType.js')

StyleSheetValidation.addValidStylePropTypes(ViewStylePropTypes);

const FancyLabelOwnPropTypes = {
  fadeTruncatingMode: PropTypes.oneOf(
    [ 'None', 'Tail', 'Head', 'HeadAndTail']
  ),
  textInsets: PropTypes.object,
  automaticallyAdjustTextInsets: PropTypes.bool,
  letterSpacing: PropTypes.number,
  baselineAdjustment: PropTypes.oneOf(
    [ 'AlignBaselines', 'AlignCenters', 'None']
  ),
  minimumScaleFactor: PropTypes.number,
  textAlign: PropTypes.oneOf(
    ['auto', 'left', 'right', 'center', 'justify']
  ),
  strokeSize: PropTypes.number,
  strokeColor: ColorPropType,
  strokePosition: PropTypes.oneOf(
    ["Outside", "Center", "Inside"]
  ),

  textShadowOffset: PointPropType,
  textShadowBlur: PropTypes.number,
  textShadowColor: ColorPropType,

  innerTextShadowOffset: PointPropType,
  innerTextShadowBlur: PropTypes.number,
  innerTextShadowColor: ColorPropType,

  gradientStartPoint: PointPropType,
  gradientEndPoint: PointPropType,

  gradientColors: PropTypes.arrayOf(ColorPropType),

  fontFamily: PropTypes.string,
  fontSize: PropTypes.number,
  color: ColorPropType,
  adjustsFontSizeToFit: PropTypes.bool,
  text: PropTypes.string,
};

const FancyLabelPropTypes = Object.assign(
  Object.create(ViewStylePropTypes),
  FancyLabelOwnPropTypes
);

class FancyLabel extends React.Component {
  static propTypes = {
    ...ViewPropTypes,
    adjustsFontSizeToFit: PropTypes.bool,
    style: StyleSheetPropType(FancyLabelPropTypes)
  };

  render(): React.Element {
    const styleProps = StyleSheet.flatten(this.props.style) || {};
    const viewProps = {
      ...this.props,
      style: {
        ..._.omit(styleProps, _.keys(FancyLabelOwnPropTypes))
      }
    };

    const labelProps = _.pick(styleProps, _.keys(FancyLabelOwnPropTypes));
    const textProps = _.pick(styleProps, ['fontSize', 'fontFamily', 'letterSpacing']);

    if (processColor) {
      const colorPropKeys = ["gradientColors", "strokeColor", "textShadowColor", "innerTextShadowColor", "color"];
      const colorPropValues = _.pick(styleProps, colorPropKeys);

      _.assign(labelProps, _.mapValues(colorPropValues, (c: *): boolean => {
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

const RNFancyLabel = requireNativeComponent('MFLReactFancyLabel', FancyLabel, {
  nativeOnly : _.mapValues(FancyLabelOwnPropTypes, (o:*):boolean => true)
});

StyleSheetValidation.addValidStylePropTypes(FancyLabelPropTypes);

export default FancyLabel;
