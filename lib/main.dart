import 'package:flutter/material.dart';
import 'package:voidrealm/appbars/appbar1.dart';
import 'package:voidrealm/cameras/camera1.dart';
import 'package:voidrealm/cameras/camera2.dart';
import 'package:voidrealm/cameras/camera3_official.dart';
import 'package:voidrealm/cameras/camera4.dart';
import 'package:voidrealm/dialog_for_dropdown/dialog1.dart';
import 'package:voidrealm/drawers/drawer1.dart';
import 'package:voidrealm/drawers/drawer2.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1.dart';
import 'package:voidrealm/images/j_image1.dart';
import 'package:voidrealm/login.dart';
import 'package:voidrealm/numpads/custom_numpad2.dart';
import 'package:voidrealm/numpads/custom_numpad3.dart';
import 'package:voidrealm/settings.dart';
import 'package:voidrealm/numpads/numpad1.dart';
import 'package:voidrealm/sliders/jslider_widget2.dart';
import 'package:voidrealm/sliders/slider1.dart';
import 'package:voidrealm/sliders/slider2roundthumb.dart';
import 'package:voidrealm/sliders/slider3customthumbcircle.dart';
import 'package:voidrealm/sliders/jslider_widget.dart';

import 'dropdownbuttons/j_dropdown1.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {///STATEFUL WONT CHANGE

  _Statenya createState() => new _Statenya();
}

class _Statenya extends State<MyApp> {
  String _title = 'Please login';
  Widget _screen;
  login _login;
  settings _settings;
  bool _authenticated;

  Numpad1 _numpad1;

  SliderWidget _sliderWidget;
  SliderWidget2 _sliderWidget2;

  _Statenya() {
    _login = new login(onSubmit: (){
      onSubmit();
    });
    _settings = new settings();
    _screen = _login;
    _authenticated = false;
    print('constructor _Statenya');
  }

  void _showSliderWidget1(){
    print('Slider Widget 1');
    _screen = _sliderWidget;
  }

  void _showSliderWidget2(){
    print('Slider Widget 2');
    _screen = _sliderWidget2;
  }

  void onSubmit() {
    print('Login with: '+_login.username+ ' ' +_login.password);
    if (_login.username == 'user' && _login.password == 'pass') {
      _setAuthenticated(true);
    }
  }

  void _goHome() {
    print('go home $_authenticated');
    setState(() {
      if (_authenticated == true) {
        _screen = _settings;

      } else {
        _screen = _login;

      }
    });
  }

  void _logout() {
    print('logout');
    _setAuthenticated(false);
  }

  void _setAuthenticated(bool auth) {
    setState(() {
      if (auth == true) {
        _screen = _settings;
        _title = 'Welcome';
        _authenticated = true;
      } else {
        _screen = _login;
        _title = 'Please login!';
        _authenticated = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login',
      home: new Scaffold(
        /*appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.home),
                onPressed: _goHome),
            new IconButton(
                icon: new Icon(Icons.exit_to_app),
                onPressed: _logout),
            new IconButton(
                icon: new Icon(Icons.slideshow),
                onPressed: _showSliderWidget1),
            new IconButton(
                icon: new Icon(Icons.slideshow_outlined),
                onPressed: _showSliderWidget2),
          ],
        ),*/

        appBar: new Appbar1(),

        // body: Numpad1(),
        // body: WidgetCustomKeyboard(),
        // body: JCustomNumpad(),
        // body: Slider1(),
        // body: SliderWidget(),
        // body: SliderWidget2(),

        /// IMAGE CONTAINER
        // body: Image1(),

        /// DROPDOWN LIST
        // body: Dropdown1(),

        /// CUSTOM APPBAR, GA BISA
        // body: Appbar1(),

        /// COBA CUSTOM DIALOG FOR KOTA DROPDOWN
        // body: Dialog1(),

        /// CAMERA
        // body: CameraScreen(), /// camera4 bisa
        // body: CameraApp(),///CameraExampleHome  /// camera3_official
        // body: TakePictureScreen(),
        // body: Camera1(),

        /// AUTOCOMPLETE TEXT
        body: new MyApp(),

        /// DRAWER
        // drawer: Drawer1(),
        drawer: Drawer2(),
      ),
    );
  }
}