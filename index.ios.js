
/*
 * @providesModule FancyLabel
 * @flow
 */

'use strict';

var React = require('react');
var ReactPropTypes = require('react/lib/ReactPropTypes');
var StyleSheetPropType = require('react-native/Libraries/StyleSheet/StyleSheetPropType');
var ColorPropType = require('react-native/Libraries/StyleSheet/ColorPropType');
var ViewStylePropTypes = require('react-native/Libraries/Components/View/ViewStylePropTypes');
var StyleSheetValidation = require('react-native/Libraries/StyleSheet/StyleSheetValidation')
var PointPropType = require('react-native/Libraries/StyleSheet/PointPropType');

var _ = require('lodash');

import {
  requireNativeComponent,
  processColor,
  View,
  Text,
  StyleSheet,
} from 'react-native';

var FancyLabelOwnPropTypes = {
  fadeTruncatingMode: ReactPropTypes.oneOf(
    [ 'None', 'Tail', 'Head', 'HeadAndTail']
  ),
  textInsets: ReactPropTypes.object,
  automaticallyAdjustTextInsets: ReactPropTypes.bool,
  letterSpacing: ReactPropTypes.number,
  baselineAdjustment: ReactPropTypes.oneOf(
    [ 'AlignBaselines', 'AlignCenters', 'None']
  ),
  minimumScaleFactor: ReactPropTypes.number,
  textAlign: ReactPropTypes.oneOf(
    ['auto', 'left', 'right', 'center', 'justify']
  ),
  strokeSize: ReactPropTypes.number,
  strokeColor: ColorPropType,
  strokePosition: ReactPropTypes.oneOf(
    ["Outside", "Center", "Inside"]
  ),

  textShadowOffset: PointPropType,
  textShadowBlur: ReactPropTypes.number,
  textShadowColor: ColorPropType,

  innerTextShadowOffset: PointPropType,
  innerTextShadowBlur: ReactPropTypes.number,
  innerTextShadowColor: ColorPropType,

  gradientStartPoint: PointPropType,
  gradientEndPoint: PointPropType,

  gradientColors: ReactPropTypes.arrayOf(ColorPropType),

  fontFamily: ReactPropTypes.string,
  fontSize: ReactPropTypes.number,
  color: ColorPropType,
  adjustsFontSizeToFitWidth: ReactPropTypes.bool,
  text: ReactPropTypes.string,
};

var FancyLabelPropTypes = Object.assign(
  Object.create(ViewStylePropTypes), FancyLabelOwnPropTypes);

class FancyLabel extends React.Component {
  static propTypes = {
      ...View.propTypes,
      style: StyleSheetPropType(FancyLabelPropTypes)
  };

  render() {
    let styleProps = StyleSheet.flatten(this.props.style) || {};
    var viewProps = {
      ...this.props,
      style: {
        ..._.omit(styleProps, _.keys(FancyLabelOwnPropTypes))
      }
    };

    var labelProps = _.pick(styleProps, _.keys(FancyLabelOwnPropTypes));
    var textProps = _.pick(styleProps, ['fontSize', 'fontFamily', 'letterSpacing']);

    if (processColor) {
      const colorPropKeys = ["gradientColors", "strokeColor", "textShadowColor", "innerTextShadowColor", "color"];
      let colorPropValues = _.pick(styleProps, colorPropKeys);

      _.assign(labelProps, _.mapValues(colorPropValues, (c) => {
        if (Array.isArray(c)) {
          return c.map(processColor);
        } else {
          return processColor(c);
        }
      }));
    }

    return (
      <RNFancyLabel  {..._.merge(viewProps, labelProps, {adjustsFontSizeToFitWidth: false})} text={this.props.children}>
        <Text style={[textProps, {marginHorizontal: 2}]}>
          {this.props.children}
        </Text>
      </RNFancyLabel>
    );
  }
}

var RNFancyLabel = requireNativeComponent('MFLReactFancyLabel', FancyLabel, {
  nativeOnly : _.mapValues(FancyLabelOwnPropTypes, (o) => true)
});

StyleSheetValidation.addValidStylePropTypes(FancyLabelPropTypes);

module.exports = FancyLabel;
