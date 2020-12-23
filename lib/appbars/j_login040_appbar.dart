import 'package:flutter/material.dart';
import 'package:voidrealm/appbars/j_login040_body.dart';
// import 'package:voidrealm/appbars/progress/sles_progress_indicator1.dart';
import 'package:voidrealm/appbars/title040.dart';
import 'file:///D:/JUNED/PROJECTS/Flutter_Voidrealm/voidrealm/lib/apps/registrasi/reg040a_sudah_peminjam.dart';

class Login040Appbar extends StatefulWidget implements PreferredSizeWidget {

  Login040Appbar({Key key}): preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;
  // Size get preferredSize => preferredSize;

  @override
  _Login040AppbarState createState() => _Login040AppbarState();
}

class _Login040AppbarState extends State<Login040Appbar> {
  @override
  Widget build(BuildContext context) {
    var appbar = setAppbar();

    return new Scaffold(
      appBar: setAppbar(),
      // body: Login040Body(),
    );
  }

  Widget setAppbar() {
    return new AppBar(
        backgroundColor: Colors.cyan,
        //automaticallyImplyLeading: true
        elevation: 0.0,
        // for elevation
        titleSpacing: 0.0,
        // if you want remove title spacing with back button
        title: new Title040(),
        // title: Text('Custom Appbar'),
        // title:  UtilCommonWidget.addTextMedium('About US', Colors.white, 20.0, 1),
        // actions: <Widget>[
        //   new Container(
        //       padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
        //       child: Icon(Icons.message)
        //   ),
        //   // addAppBarActionWidgetProfile(icon, 30.0, 30.0, 15.0) // add your custom action widget
        // ],
        //Action icon search as search icon, notification icon
        leading: new Material(
          //Custom leading icon, such as back icon or other icon
          color: Colors.transparent,
          child: new InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            splashColor: Colors.red,
            // splashColor: UniQueryColors.colorGradientEnd.withOpacity(.5),
            child: new Container(
              color: Colors.cyan,
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: Image(image: AssetImage('lib/assets/chat_bubble_cyan.png'),)
                // child: Icon(Icons.arrow_back)
                // child: UtilCommonWidget.addImage(Constant.iconBack, 19.0, 10.0))
            ),
          ),
        )
    );
  }
}
