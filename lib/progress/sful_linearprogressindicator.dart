import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:voidrealm/models/appbar_model.dart';

class LPI extends StatefulWidget {

  LPI({
    Key key,

    ///NG
    @required
    double progres,
    String namaLengkap = '',
    String tanggalLahir,
    String tempatLahir,
    double jenisKelamin,
    double jumlahAnak,
    String namaIbu,
    double pendidikanTerakhir,
    String email
  }) : super(key: key);

  @override
  _LPIState createState() =>
      _LPIState();
}

class _LPIState
    extends State<LPI> with SingleTickerProviderStateMixin{
  double progress;

  void _pressed(double p){
    print('nilai $p');
  }

  final appbarModel = List<AppbarModel>.generate(
    20,
        (i) => AppbarModel(
        'AppbarModel $i',
        'A description of what needs to be done for AppbarModel $i'
    ),
  );

  AnimationController controller;
  Animation<double> animation;
  double beginAnim = 0.0;
  double endAnim = 1.0;
  bool isButtonpressed = false;

  @override
  void initState() {
    super.initState();

    /// INISIALISASI DISINI MAKA SAAT BUTTON DIKLIK
    /// NULL TERISI AKAN BERTAMBAH MENJADI 1 TERISI, 2 TERISI
    progress = 0;

    controller = AnimationController(
      /// DURATION ITU KECEPATAN ANIMASI SLIDER
      duration: const Duration(seconds: 2),
      vsync: this);
    animation = Tween(begin: progress, end: progress).animate(controller)
    // animation = Tween(begin: beginAnim, end: endAnim).animate(controller)
    // animation = Tween(begin: 0, end: progress == 0 ? 1 : progress).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
          // progress = 2;/// NG
          // progress += 1;/// NG

          controller.forward();///NG

          // if (isButtonpressed) {
          //   // progress += 1;/// NG
          //   controller.forward();///NG
          // }
        });
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          children: <Widget>[
            Container(height: 200),
            Text('$progress terisi',
                style: TextStyle(
                fontSize: 12)),
            RaisedButton(onPressed: (){
              progress += 1;
              _pressed(progress);
            }),
            Container(height: 200),
            LinearProgressIndicator(
              /// NG
              // semanticsValue: ((){
              //   'Semantics value '+appbarModel.length.toString();
              // }()),
              /// NG
              // semanticsLabel: ((){
              //   'Semantics label '+appbarModel.length.toString();
              // }()),
              semanticsValue: progress.toString(),
              semanticsLabel: progress.toString(),
              backgroundColor: Colors.cyanAccent,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
              // value: list[2].toDouble(),
              // value: animation.value,
              value: progress,
            ),
          ]
      ),
    );
  }
}