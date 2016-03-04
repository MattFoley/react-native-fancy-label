/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var FancyLabel = require('react-native-fancy-label');

var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

var ReactNativeFancyLabelExample = React.createClass({
  render: function() {

    var useAllProps = {
      fadeTruncatingMode: "None",
      textInsets: {top:0, left:0, bottom:0, right:0},
      automaticallyAdjustTextInsets: false,
      letterSpacing: 2,
      adjustsFontSizeToFitWidth: true,
      baselineAdjustment: "AlignCenters",
      minimumScaleFactor: .5,
      textAlign:"center",

      strokeSize: 2,
      strokeColor: '#003355',
      strokePosition: "Outside",

      innerTextShadowOffset: {x:-1, y:-1},
      innerTextShadowBlur: 1,
      innerTextShadowColor: 'rgba(0, 0, 0, .4)',

      textShadowOffset: {x:0, y:2},
      textShadowBlur: 0,
      textShadowColor: '#000088',
      gradientStartPoint: {x:0.0, y:0.0},
      gradientEndPoint: {x:.0, y:0.5},
      gradientColors: ["#6ac141", "#35a1a2", "#a12cd2"],

      fontFamily: "HelveticaNeue-CondensedBlack",
      fontSize: 48,
    };

    return (
      <View style={styles.container}>
        <FancyLabel key={1} numberOfLines={2} style={styles.allStyles}>
          {"Skillz Skillz Skillz"}
        </FancyLabel>
        <FancyLabel key={2} style={styles.gradientStyle}>{"Skillz"}</FancyLabel>
        <FancyLabel key={3} style={[styles.gradientSmallStyle, {width:30}]}>{"Skillz!"}</FancyLabel>

        {/*

        <Text numberOfLines={2} style={styles.textAllStyles}>
        {"Skillz Skillz Skillz"}
        </Text>
        <Text style={styles.textStyle}>{"Skillz"}</Text>
        <Text style={styles.textSmallStyle}>{"Skillz"}</Text>
        */}
      </View>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
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
  allStyles : {
    fadeTruncatingMode: "None",
    textInsets: {top:0, left:0, bottom:0, right:0},
    automaticallyAdjustTextInsets: false,
    letterSpacing: 2,
    adjustsFontSizeToFitWidth: true,
    baselineAdjustment: "AlignCenters",
    minimumScaleFactor: .5,
    textAlign:"center",

    strokeSize: 2,
    strokeColor: '#003355',
    strokePosition: "Outside",

    innerTextShadowOffset: {x:-1, y:-1},
    innerTextShadowBlur: 1,
    innerTextShadowColor: 'rgba(0, 0, 0, .4)',

    textShadowOffset: {x:0, y:2},
    textShadowBlur: 0,
    textShadowColor: '#000088',
    gradientStartPoint: {x:0.0, y:0.0},
    gradientEndPoint: {x:.0, y:0.5},
    gradientColors: ["#6ac141", "#35a1a2", "#a12cd2"],

    fontFamily: "HelveticaNeue-CondensedBlack",
    fontSize: 48,
  },
  gradientStyle : {
    gradientColors: ["red", "orange", "yellow"],
    adjustsFontSizeToFitWidth : false,
    fontFamily: "HelveticaNeue-CondensedBlack",
    strokeSize: 1,
    strokeColor: "gray",
    fontSize: 132,
    flex: 1,
  },
  textAllStyles : {
    fontFamily: "HelveticaNeue-CondensedBlack",
    fontSize: 48,

  },
  gradientSmallStyle : {
    flex: 1,
    gradientColors: ["red", "orange", "yellow"],
    adjustsFontSizeToFitWidth : true,
    fontFamily: "HelveticaNeue-CondensedBlack",
    strokeSize: 1,
    width: 150,
    strokeColor: "gray",
    fontSize: 132,

  },
  textStyle : {
    adjustsFontSizeToFitWidth : false,
    fontFamily: "HelveticaNeue-CondensedBlack",
    fontSize: 132,
    flex: 1,
  },
  textSmallStyle : {
    adjustsFontSizeToFitWidth : false,
    fontFamily: "HelveticaNeue-CondensedBlack",
    strokeSize: 1,
    strokeColor: "gray",
    fontSize: 132,
    flex: 1,
  },

});

AppRegistry.registerComponent('ReactNativeFancyLabelExample', () => ReactNativeFancyLabelExample);
