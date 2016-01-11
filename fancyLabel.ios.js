
/*
 * @providesModule FancyLabel
 */

'use strict';

var React = require('react-native');
var RNFancyLabelConstants = React.NativeModules.MFLReactFancyLabel;
var { requireNativeComponent, processColor, View } = React;

class FancyLabel extends React.Component {
  render() {
    if (processColor) {
      console.log('ProcessColor RN');
      var { gradientColors, gradientStartColor, gradientEndColor,
            innerShadowColor, shadowColor, strokeColor,
            textColor, ...otherProps } = this.props;
      return (
          <RNFancyLabel {...otherProps}
                        gradientColors={gradientColors.map(processColor)}
                        gradientStartColor={processColor(gradientStartColor)}
                        gradientEndColor={processColor(gradientEndColor)}
                        innerShadowColor={processColor(innerShadowColor)}
                        shadowColor={processColor(shadowColor)}
                        textColor={processColor(textColor)}
                        strokeColor={processColor(strokeColor)}/>
      )
    } else {
      console.log('Legacy RN');
      return <RNFancyLabel {...this.props}/>;
    }
  }
}

FancyLabel.propTypes = {
  fadeTruncatingMode: React.PropTypes.any,
  textInsets: React.PropTypes.object,
  automaticallyAdjustTextInsets: React.PropTypes.bool,
  letterSpacing: React.PropTypes.number,
  baselineAdjustment: React.PropTypes.number,
  minimumScaleFactor: React.PropTypes.number,
  textAlignment: React.PropTypes.number,

  strokeSize: React.PropTypes.number,
  strokeColor: React.PropTypes.any,
  strokePosition: React.PropTypes.number,

  innerShadowOffset: React.PropTypes.object,
  innerShadowBlur: React.PropTypes.number,
  innerShadowColor: React.PropTypes.any,

  shadowOffset: React.PropTypes.object,
  shadowBlur: React.PropTypes.number,
  shadowColor: React.PropTypes.any,

  gradientStartPoint: React.PropTypes.object,
  gradientEndPoint: React.PropTypes.object,
  gradientStartColor: React.PropTypes.any,
  gradientEndColor: React.PropTypes.any,
  gradientColors: React.PropTypes.array,

  fontFace: React.PropTypes.string,
  fontSize: React.PropTypes.number,
  textColor: React.PropTypes.any,
  text: React.PropTypes.string,
  adjustsFontSizeToFitWidth: React.PropTypes.bool
}

var RNFancyLabel = React.requireNativeComponent('MFLReactFancyLabel', FancyLabel);

FancyLabel.StrokePosition = RNFancyLabelConstants.StrokePosition;
FancyLabel.FadeMode = RNFancyLabelConstants.FadeMode;
FancyLabel.TextAlignment = RNFancyLabelConstants.TextAlignment;
FancyLabel.BaselineAdjustment = RNFancyLabelConstants.BaselineAdjustment;

module.exports = FancyLabel;
