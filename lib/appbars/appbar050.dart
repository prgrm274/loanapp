import 'package:flutter/material.dart';
import 'package:voidrealm/appbars/progress/progress_indicator1.dart';

class Appbar050 extends StatefulWidget implements PreferredSizeWidget {

  Appbar050({Key key})
      : preferredSize = Size.fromHeight(60.0),
  // : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  // Size get preferredSize => preferredSize;

  ///default is 56.0

  @override
  _Appbar050State createState() => _Appbar050State();
}

class _Appbar050State extends State<Appbar050> {
  @override
  Widget build(BuildContext context) {
    /// ga bisa digabung dengan di file appbar050scaffold yg appbarnya di scaffold
    return AppBar(
        backgroundColor: Colors.cyanAccent,
        //automaticallyImplyLeading: true
        elevation: 0.0,
        // for elevation
        titleSpacing: 0.0,
        // if you want remove title spacing with back button
        title: new ProgressIndicator1(),
        // title: Text('Custom Appbar'),
        // title:  UtilCommonWidget.addTextMedium('About US', Colors.white, 20.0, 1),
        actions: <Widget>[
          new Container(
              padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
              child: Icon(Icons.message)
          ),
          // addAppBarActionWidgetProfile(icon, 30.0, 30.0, 15.0) // add your custom action widget
        ],
        //Action icon search as search icon, notification icon
        leading: new Material(
          /// Custom leading icon, such as back navigation icon or other
          /// warna kotaknya navigation icon
          color: Colors.white24,
          child: new InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            splashColor: Colors.red,
            // splashColor: UniQueryColors.colorGradientEnd.withOpacity(.5),
            child: new Container(
              /// kotaknya navigation icon
              // color: Colors.red,
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: Icon(Icons.arrow_back_rounded)
              // child: UtilCommonWidget.addImage(Constant.iconBack, 19.0, 10.0))
            ),
          ),
        )
    );
  }
}
