import 'package:flutter/material.dart';
import 'package:voidrealm/sliders/dfix/jconst_circle_diameter.dart';
import 'package:voidrealm/sliders/dfix/jface.dart';
import 'package:voidrealm/sliders/dfix/jhead.dart';
import 'package:voidrealm/sliders/dfix/jindicator.dart';
import 'package:voidrealm/sliders/dfix/jmeasure_line.dart';
import 'package:voidrealm/sliders/dfix/jpainter.dart';
import 'package:voidrealm/sliders/dfix/jconst_padding.dart';

class Slider7 extends StatefulWidget {
  Slider7({Key key}) : super(key: key);

  @override
  _Slider7State createState() => _Slider7State();
}

class _Slider7State extends State<Slider7> with SingleTickerProviderStateMixin{
  double initialReviewValue = 2;
  // double initialReviewValue = 2;

  /// KALO UBAH NILAI HARUS HOT RESTART BARU TAMBAH TITIKNYA
  final List<String> pinjaman = [
    '500K',
    '1M',
    '1.5M',
    '2M',
    '3M',
    // '6M',
    // '10M'
  ];

  Animation<double> _animation;
  AnimationController _controller;
  Tween<double> _tween;
  double _innerWidth;
  double _animationValue;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      value: initialReviewValue,
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _tween = Tween(end: initialReviewValue);
    _animation = _tween.animate(
      CurvedAnimation(
        curve: Curves.easeIn,
        parent: _controller,
      ),
    )..addListener(() {
      setState(() {
        _animationValue = _animation.value;
      });
    });
    _animationValue = initialReviewValue;
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  _afterLayout(_) {
    setState(() {
      _innerWidth = MediaQuery.of(context).size.width - 2 * paddingSize;
    });
  }

  void handleTap(int state) {
    _controller.duration = Duration(milliseconds: 400);

    _tween.begin = _tween.end;
    _tween.end = state.toDouble();
    _controller.reset();
    _controller.forward();
  }

  _onDrag(details) {
    var newAnimatedValue = _calcAnimatedValueFormDragX(
      details.globalPosition.dx,
    );
    if (newAnimatedValue > 0 && newAnimatedValue < pinjaman.length - 1) {
      setState(() {
        _animationValue = newAnimatedValue;
        },
      );
    }
  }

  _calcAnimatedValueFormDragX(x) {
    return (x - circleDiameter / 2 - paddingSize * 2) /
        _innerWidth * pinjaman.length;
  }

  _onDragEnd(_) {
    _controller.duration = Duration(milliseconds: 100);
    _tween.begin = _animationValue;
    _tween.end = _animationValue.round().toDouble();
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(/// kalo ga dikasih Material jadi hitam
      child: Center(
        child: _innerWidth == null
            ? Container()
            : Container(
          padding: EdgeInsets.symmetric(horizontal: paddingSize),
          height: 200,
          child: Stack(children: <Widget>[
            Container(/// NG ADD
              margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
              child: Text(
                ((){
                  for (int i=0; i<pinjaman.length; i++){
                    return pinjaman[i];
                  };;;;;;
                }()),
                // pinjaman[2],// set to 1.5M

                key: ((){
                  print('key');
                }()),

                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18
                ),
              ),

              key: ((){
              }()),// NG NULIS GINI, GA ERROR
            ),

            SliderGaris(
              statesnya: pinjaman,
              handleTapnya: handleTap,
              nilaiAnimasi: _animationValue,
              lebar: _innerWidth,
            ),
            MyIndicator(
              animationValue: _animationValue,
              width: _innerWidth,
              onDrag: _onDrag,
              onDragEnd: _onDragEnd,
            ),
            Text(_animationValue.round().toString()),
          ]),
        ),
      ),
    );
  }
}