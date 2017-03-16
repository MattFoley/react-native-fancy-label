/*
 * @providesModule FancyLabel
 * @flow
 */

import React from 'react';
import _ from 'lodash';

import {
  requireNativeComponent,
  processColor,
  View,
  Text,
  StyleSheet,
} from 'react-native';

const StyleSheetPropType = require('react-native/Libraries/StyleSheet/StyleSheetPropType');
const ColorPropType = require('react-native/Libraries/StyleSheet/ColorPropType');
const ViewStylePropTypes = require('react-native/Libraries/Components/View/ViewStylePropTypes');
const StyleSheetValidation = require('react-native/Libraries/StyleSheet/StyleSheetValidation')
const PointPropType = require('react-native/Libraries/StyleSheet/PointPropType');

const FancyLabelOwnPropTypes = {
  fadeTruncatingMode: React.PropTypes.oneOf(
    [ 'None', 'Tail', 'Head', 'HeadAndTail']
  ),
  textInsets: React.PropTypes.object,
  automaticallyAdjustTextInsets: React.PropTypes.bool,
  letterSpacing: React.PropTypes.number,
  baselineAdjustment: React.PropTypes.oneOf(
    [ 'AlignBaselines', 'AlignCenters', 'None']
  ),
  minimumScaleFactor: React.PropTypes.number,
  textAlign: React.PropTypes.oneOf(
    ['auto', 'left', 'right', 'center', 'justify']
  ),
  strokeSize: React.PropTypes.number,
  strokeColor: ColorPropType,
  strokePosition: React.PropTypes.oneOf(
    ["Outside", "Center", "Inside"]
  ),

  textShadowOffset: PointPropType,
  textShadowBlur: React.PropTypes.number,
  textShadowColor: ColorPropType,

  innerTextShadowOffset: PointPropType,
  innerTextShadowBlur: React.PropTypes.number,
  innerTextShadowColor: ColorPropType,

  gradientStartPoint: PointPropType,
  gradientEndPoint: PointPropType,

  gradientColors: React.PropTypes.arrayOf(ColorPropType),

  fontFamily: React.PropTypes.string,
  fontSize: React.PropTypes.number,
  color: ColorPropType,
  adjustsFontSizeToFit: React.PropTypes.bool,
  text: React.PropTypes.string,
};

const FancyLabelPropTypes = Object.assign(
  Object.create(ViewStylePropTypes),
  FancyLabelOwnPropTypes
);

class FancyLabel extends React.Component {
  static propTypes = {
    ...View.propTypes,
    adjustsFontSizeToFit: React.PropTypes.bool,
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
        <Text style={[textProps, {marginHorizontal: 2}]}>
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
