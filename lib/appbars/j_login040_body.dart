import 'package:flutter/material.dart';
// import 'package:voidrealm/appbars/progress/sles_progress_indicator1.dart';
import 'package:voidrealm/appbars/title040.dart';
import 'package:voidrealm/apps/registrasi/reg040a_sudah_peminjam.dart';

class Login040Body extends StatefulWidget implements PreferredSizeWidget {

  Login040Body({Key key})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;

  // Size get preferredSize => preferredSize;

  @override
  _Login040BodyState createState() => _Login040BodyState();
}

class _Login040BodyState extends State<Login040Body> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Container(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 1,
                  // height: constraints.maxHeight * 2,
                  // height: constraints.maxHeight,
                  // height: constraints.maxHeight / 2,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  // width: MediaQuery.of(context).size.width / 2,
                  color: Colors.red,

                  /// NOMOR HAPE, PASSWORD, BUTTON MASUK DAN NUMPAD
                  child: Login040(),
                );
              },
            ),
          ),
        )
    );
  }
}
