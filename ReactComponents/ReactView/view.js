"use strict";

var React = require('react-native');

var {
    Text,
    View,
    StyleSheet,
    TouchableOpacity,
    } = React;

var styles = StyleSheet.create({
    container: {
        height: 480,
        width: 320,
        borderRadius: 3,
        borderColor: '#D3D3D3',
        borderWidth: 1,
    },

    header: {
        height: 48,
        backgroundColor: '#222F3E',
        justifyContent: 'center',
    },

    headerText: {
        color: "#FFFFFF",
        fontSize: 16,
        fontWeight: "500",
        marginLeft: 12,
    },

    contentContainer: {
        marginTop: 20,
        marginLeft: 15,
        marginRight: 15,
    },

    contentText: {
        color: '#555555',
        fontSize: 14,
    },

    dismissButton: {
        marginTop: 25,
        borderRadius: 6,
        backgroundColor: '#3085CF',
        height: 40,
        justifyContent: 'center',
    },

    dismissButtonText: {
        color: "#FFFFFF",
        textAlign: 'center',
        fontWeight: "500",
        fontSize: 16,
    }
});

var MyReactView = React.createClass({

    onPress: function () {
      React.NativeModules.ViewControllerBridge.dismissView();
    },

    render: function () {
        return (
            <View style={styles.container}>
                <View style={styles.header}>
                    <Text style={styles.headerText}>
                        Alert! Alert!
                    </Text>
                </View>
                <View style={styles.contentContainer}>
                    <Text style={styles.contentText}>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eget leo purus. Curabitur pharetra rutrum venenatis. Praesent pulvinar sapien sed turpis consequat euismod. Suspendisse sollicitudin varius nulla at lacinia.
                    </Text>
                    <View style={styles.dismissButton}>
                        <TouchableOpacity onPress={this.onPress} activeOpacity={.6}>
                            <Text style={styles.dismissButtonText}>Dismiss</Text>
                        </TouchableOpacity>
                    </View>
                </View>
            </View>
        )
    },
});

module.exports = MyReactView;