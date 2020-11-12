import 'package:flutter/material.dart';
import 'package:voidrealm/models/appbar_model.dart';

class SfulLinearprogressindicator extends StatefulWidget {

  SfulLinearprogressindicator({
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
  _SfulLinearprogressindicatorState createState() =>
      _SfulLinearprogressindicatorState();
}

class _SfulLinearprogressindicatorState
    extends State<SfulLinearprogressindicator> with SingleTickerProviderStateMixin{

  final appbarModel = List<AppbarModel>.generate(
    20,
        (i) => AppbarModel(
        'AppbarModel $i',
        'A description of what needs to be done for AppbarModel $i'
    ),
  );
  var list = List<double>();///NG

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    list.add(1);
    list.add(2);
    list.add(3);
    list.add(4);
    list.add(5);

    controller = AnimationController(
      /// DURATION ITU KECEPATAN ANIMASI SLIDER
      duration: const Duration(milliseconds: 500),
      vsync: this
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
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
    return LinearProgressIndicator(
      /// NG
      // semanticsValue: ((){
      //   'Semantics value '+appbarModel.length.toString();
      // }()),
      /// NG
      // semanticsLabel: ((){
      //   'Semantics label '+appbarModel.length.toString();
      // }()),
      backgroundColor: Colors.cyanAccent,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
      value: list[2].toDouble(),
      // value: animation.value,
      // value: _progres,
    );
  }
}