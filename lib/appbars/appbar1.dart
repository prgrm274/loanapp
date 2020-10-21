import 'package:flutter/material.dart';
import 'package:voidrealm/appbars/progress/progress_indicator1.dart';

class Appbar1 extends StatefulWidget implements PreferredSizeWidget {

  Appbar1({Key key})
      : preferredSize = Size.fromHeight(60.0),
  // : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  // Size get preferredSize => preferredSize;

  ///default is 56.0

  @override
  _Appbar1State createState() => _Appbar1State();
}

class _Appbar1State extends State<Appbar1> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: setAppbar(),
      body: new Container(),
    );
  }

  Widget setAppbar() {
    return new AppBar(
        //backgroundColor: Colors.blue,
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
          //Custom leading icon, such as back icon or other icon
          color: Colors.transparent,
          child: new InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            splashColor: Colors.red,
            // splashColor: UniQueryColors.colorGradientEnd.withOpacity(.5),
            child: new Container(
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: Icon(Icons.arrow_back)
                // child: UtilCommonWidget.addImage(Constant.iconBack, 19.0, 10.0))
                ),
          ),
        )
    );
  }
}
