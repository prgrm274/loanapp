import 'package:flutter/material.dart';
import 'package:voidrealm/appbars/j_login040_appbar.dart';
import 'package:voidrealm/appbars/j_login040_body.dart';
import 'package:voidrealm/appbars/appbar_progress.dart';
import 'package:voidrealm/appbars/custombar.dart';
import 'package:voidrealm/apps/home/home.dart';
import 'package:voidrealm/apps/permissions/permission_request.dart';
import 'package:voidrealm/apps/registrasi/reg050.dart';
import 'package:voidrealm/apps/splash.dart';
import 'package:voidrealm/autocompletes/autocomplete1.dart';
import 'package:voidrealm/autocompletes/j_autocomplete1.dart';
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
import 'sliders/slider7/slider7.dart';
import 'file:///D:/JUNED/PROJECTS/Flutter_Voidrealm/voidrealm/lib/sliders/not/jslider_widget2.dart';
import 'file:///D:/JUNED/PROJECTS/Flutter_Voidrealm/voidrealm/lib/sliders/not/slider1.dart';
import 'package:voidrealm/sliders/slider_widget_round_thumb.dart';
import 'package:voidrealm/sliders/slider_current_custom_thumb_circle.dart';
import 'package:voidrealm/sliders/slider_widget.dart';
import 'package:voidrealm/sliders/slider6.dart';
import 'package:voidrealm/sqflites/homepage.dart';

import 'dropdownbuttons/j_dropdown1.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {///STATEFUL WONT CHANGE

  _Statenya createState() => new _Statenya();
}

class _Statenya extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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

        // appBar: new Appbar040(),
        appBar: new AppbarProgress(),

        /// 040 BODY
        // body: Appbar040Body(),

        /// 050
        body: Reg050(),

        // body: Numpad1(),
        // body: WidgetCustomKeyboard(),
        // body: JCustomNumpad(),

        /// SLIDERS
        // body: Slider6(),
        // body: Slider7(),
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
        // body: new Autocomplete1(),

        /// SQFLITE
        // body: new Sqflite1(),

        /// SPLASH
        // body: Splash(),

        /// PERMISSION REQUEST
        // body: PermissionRequest(),

        /// HOME / PINJAMAN
        // body: Home(),

        /// DRAWER
        // drawer: Drawer1(),
        drawer: Drawer2(),
      ),
    );
  }
}