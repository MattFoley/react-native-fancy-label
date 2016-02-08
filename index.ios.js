
/*
 * @providesModule FancyLabel
 */

'use strict';

var React = require('react-native');
var ReactPropTypes = require('react/lib/ReactPropTypes');
var StyleSheetPropType = require('react-native/Libraries/StyleSheet/StyleSheetPropType');
var ColorPropType = require('react-native/Libraries/StyleSheet/ColorPropType');
var ViewStylePropTypes = require('react-native/Libraries/Components/View/ViewStylePropTypes');
var StyleSheetValidation = require('react-native/Libraries/StyleSheet/StyleSheetValidation')
var PointPropType = require('react-native/Libraries/StyleSheet/PointPropType');
var StyleSheetRegistry = require('react-native/Libraries/StyleSheet/StyleSheetRegistry');

var _ = require('lodash');

var { requireNativeComponent, processColor, View, Text } = React;

var FancyLabelOwnPropTypes = {
    fadeTruncatingMode: ReactPropTypes.oneOf(
      [ 'None', 'Tail', 'Head', 'HeadAndTail']),

    textInsets: ReactPropTypes.object,
    automaticallyAdjustTextInsets: ReactPropTypes.bool,
    letterSpacing: ReactPropTypes.number,
    baselineAdjustment: ReactPropTypes.oneOf(
      [ 'AlignBaselines', 'AlignCenters', 'None']),

    minimumScaleFactor: ReactPropTypes.number,
    textAlign: ReactPropTypes.oneOf(
      ['auto', 'left', 'right', 'center', 'justify']),

    strokeSize: ReactPropTypes.number,
    strokeColor: ColorPropType,
    strokePosition: ReactPropTypes.oneOf(
      ["Outside", "Center", "Inside"]),

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
    adjustsFontSizeToFitWidth: ReactPropTypes.bool
};

var FancyLabelPropTypes = Object.assign(
  Object.create(ViewStylePropTypes), FancyLabelOwnPropTypes);

class FancyLabel extends React.Component {
  static propTypes = {
      ...View.propTypes,
      style: StyleSheetPropType(FancyLabelPropTypes)
  };

  render() {
      var styleProps = typeof this.props.style == 'number' ? StyleSheetRegistry.getStyleByID(this.props.style) :
                                                             this.props.style;
      var viewProps = { ...this.props, style: {..._.omit(styleProps, ._keys(FancyLabelOwnPropTypes))}};
      var labelProps = _.pick(styleProps, _.keys(FancyLabelOwnPropTypes));
      var textProps = _.pick(styleProps, ['fontSize', 'fontFamily', 'letterSpacing']);

      if (processColor) {
        const colorPropKeys = ["gradientColors", "strokeColor", "textShadowColor", "innerTextShadowColor", "color"];
        _.assign(labelProps, _.mapValues(_.pick(styleProps, colorPropKeys), c => processColor(c)));
      }
      return (  <RNFancyLabel  {..._.merge(viewProps, labelProps)} >
                  <Text style={textProps}>{this.props.children}</Text>
                </RNFancyLabel> );
  }
}

var RNFancyLabel = React.requireNativeComponent('MFLReactFancyLabel', FancyLabel, {
  nativeOnly :  _.mapValues(FancyLabelOwnPropTypes, (o) => true)
});

StyleSheetValidation.addValidStylePropTypes(FancyLabelPropTypes);

module.exports = FancyLabel;
