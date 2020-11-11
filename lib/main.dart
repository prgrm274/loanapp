import 'package:flutter/material.dart';
import 'package:voidrealm/appbars/j_login040_appbar.dart';
import 'package:voidrealm/appbars/j_login040_body.dart';
import 'package:voidrealm/appbars/appbar050.dart';
import 'package:voidrealm/appbars/custombar.dart';
import 'package:voidrealm/apps/home/home.dart';
import 'package:voidrealm/apps/permissions/permission_request.dart';
import 'package:voidrealm/apps/registrasi/reg050.dart';
import 'package:voidrealm/apps/registrasi/reg060.dart';
import 'package:voidrealm/apps/registrasi/reg070.dart';
import 'package:voidrealm/apps/registrasi/reg080.dart';
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
import 'package:voidrealm/gradients/gradient2.dart';
import 'package:voidrealm/images/j_image1.dart';
import 'package:voidrealm/login.dart';
import 'package:voidrealm/numpads/custom_numpad2.dart';
import 'package:voidrealm/numpads/custom_numpad3.dart';
import 'package:voidrealm/settings.dart';
import 'package:voidrealm/numpads/numpad1.dart';
import 'package:voidrealm/sliders/dfix/jslider7.dart';
import 'package:voidrealm/sliders/jslider_widget2.dart';
import 'package:voidrealm/sliders/slider1.dart';
import 'package:voidrealm/sliders/slider2roundthumb.dart';
import 'package:voidrealm/sliders/slider3customthumbcircle.dart';
import 'package:voidrealm/sliders/jslider_widget.dart';
import 'package:voidrealm/sliders/slider6.dart';
import 'package:voidrealm/sqflites/homepage.dart';
import 'package:voidrealm/visibilities/coba_visibility.dart';

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
        // appBar: Login040Appbar(),
        appBar: Appbar050(),
        // appBar: new Appbar040(),
        // appBar: new Appbar050(),

        /// 040 BODY
        // body: Login040Body(),

        /// 050
        // body: Reg050(),

        /// 060
        body: Reg060(),

        /// 070
        // body: Reg070(),

        /// 080
        // body: Reg080(),


        // body: PermissionRequest(),

        /// VISIBILITY
        // body: ControlleApp(),

        /// GRADIENTS
        // body: Gradient2(),

        // body: Numpad1(),
        // body: WidgetCustomKeyboard(),
        // body: JCustomNumpad(),

        /// SLIDERS
        // body: Slider6(),/// emoji
        // body: Slider7(),/// CUSTOM SLIDER
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