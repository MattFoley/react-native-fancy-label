/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var FancyLabel = require('FancyLabel');

var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

var ReactNativeFancyLabelExample = React.createClass({
  render: function() {

    var useAllProps = {
      fadeTruncatingMode: 0,
      textInsets: {top:0, left:0, bottom:0, right:0},
      automaticallyAdjustTextInsets: false,
      letterSpacing: 2,
      adjustsFontSizeToFitWidth: true,
      baselineAdjustment: FancyLabel.BaselineAdjustment.AlignCenters,
      minimumScaleFactor: .5,
      textAlignment: FancyLabel.TextAlignment.Center,

      strokeSize: 2,
      strokeColor: '#003355',
      strokePosition: FancyLabel.StrokePosition.Outside,

      innerShadowOffset: {width:-1, height:-1},
      innerShadowBlur: 1,
      innerShadowColor: 'rgba(0, 0, 0, .4)',

      shadowOffset: {width:0, height:2},
      shadowBlur: 0,
      shadowColor: '#000088',

      gradientStartPoint: {x:0.49, y:0},
      gradientEndPoint: {x:.51, y:1.0},
      gradientColors: ["#6ac141", "#35a1a2", "#a12cd2"],

      fontFace: "HelveticaNeue-CondensedBlack",
      fontSize: 180,
      text: "Skillz Skillz Skillz",
    };

    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>
        <FancyLabel style={{width:400, height:100}}
                    {...useAllProps} />
      </View>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('ReactNativeFancyLabelExample', () => ReactNativeFancyLabelExample);
