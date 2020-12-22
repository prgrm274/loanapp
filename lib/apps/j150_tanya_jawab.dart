import 'package:flutter/material.dart';
// import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:voidrealm/apps/tanyajawab/tj1.dart';

class J150TanyaJawab extends StatefulWidget {
  J150TanyaJawab({Key key}) : super(key: key);

  @override
  _J150TanyaJawabState createState() => _J150TanyaJawabState();
}

class _J150TanyaJawabState extends State<J150TanyaJawab> {

  GlobalKey _toolTip1 = GlobalKey();
  GlobalKey _toolTip2 = GlobalKey();

  /// SUPER TOOLTIP
  SuperTooltip tooltip;
  Future<bool> _willPopCallback() async {
    // If the tooltip is open we don't pop the page on a backbutton press
    // but close the ToolTip
    if (tooltip.isOpen) {
      tooltip.close();
      return false;
    }
    return true;
  }

  void onTap() {
    if (tooltip != null && tooltip.isOpen) {
      tooltip.close();
      return;
    }

    var renderBox = context.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    var targetGlobalCenter = renderBox
        .localToGlobal(renderBox.size.center(Offset.zero), ancestor: overlay);

    // We create the tooltip on the first use
    tooltip = SuperTooltip(
      popupDirection: TooltipDirection.left,
      arrowTipDistance: 15.0,
      arrowBaseWidth: 40.0,
      arrowLength: 20.0,
      borderColor: Colors.green,
      borderWidth: 5.0,
      snapsFarAwayVertically: true,
      showCloseButton: ShowCloseButton.inside,
      hasShadow: false,
      touchThrougArea: new Rect.fromLTWH(targetGlobalCenter.dx - 100,
          targetGlobalCenter.dy - 100, 200.0, 160.0),
      touchThroughAreaShape: ClipAreaShape.rectangle,
      content: new Material(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, "
                  "sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, "
                  "sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. ",
              softWrap: true,
            ),
          )),
    );

    tooltip.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints viewportConstraints) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              titleSpacing: 10.0,
              backgroundColor: Colors.cyan,
              title: Text('Tanya jawab'),
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                splashColor: Colors.red,
                child: new Container(
                    padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                    child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white
                    )
                ),
              ),
            ),
            body: Container(
              child: LayoutBuilder(
                builder: (BuildContext ctx, BoxConstraints constraints) {
                  /// ListView BISA MENYEDIAKAN SCROLL
                  /// TANPA PAKE SingleChildScrollView
                  return ListView(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            final dynamic tooltip = _toolTip1.currentState;
                            tooltip.ensureTooltipVisible();
                            print('1');
                          },
                          child: Tooltip(
                              key: _toolTip1,
                              message: 'tooltip',
                              verticalOffset: 5,
                              child: Text(
                                  'PERNYATAAN PENYANGKALAN (DISCLAIMER)',
                                  style: TextStyle(color: Colors.grey[400])
                              )
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: WillPopScope(
                          onWillPop: _willPopCallback,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TanyaJawab1()
                                  )
                              );
                            },
                            // onTap: onTap,/// v
                            child: Text('PERNYATAAN PENYANGKALAN (DISCLAIMER)'),
                          ),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     final dynamic tooltip = _toolTip2.currentState;
                        //     tooltip.ensureTooltipVisible();
                        //     print('simple tooltip 2');
                        //   },
                        //   child: SimpleTooltip(/// v
                        //     key: _toolTip2,
                        //     tooltipTap: () {
                        //       print("Tooltip tap");
                        //     },
                        //     animationDuration: Duration(seconds: 3),
                        //     show: true,
                        //     tooltipDirection: TooltipDirection.up,
                        //     child: Text(
                        //         'PERNYATAAN PENYANGKALAN (DISCLAIMER)',
                        //         style: TextStyle(color: Colors.grey[400])
                        //     ),
                        //     content: Text(
                        //         'PERNYATAAN PENYANGKALAN (DISCLAIMER)',
                        //         style: TextStyle(color: Colors.grey[400], fontSize: 12)
                        //     ),
                        //   ),
                        // ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(''),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Apa produk DanaFix?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                            'Mengenai pinjaman',
                            style: TextStyle(color: Colors.grey[400])
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Siapa yang dapat menggunakan layanan pinjaman DanaFix?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Dokumen apa saja yang perlu disiapkan?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Bagaimana mengetahui jika saya telah menerima pencairan tersebut?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Di kota mana layanan pinjaman DanaFix bisa dilakukan?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Apa yang harus saya lakukan jika belum menerima SMS konfirmasi dari DanaFix?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Mengenai menerima uang',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Kapan saya menerima pinjaman tersebut?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Dimana saya dapat menerima pencairan?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Mengenai pembayaran pinjaman',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Kapan saya harus melakukan pembayaran pinjaman?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Bagaimana melakukan pembayaran pinjaman?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Apakah mungkin melakukan pelunasan lebih awal?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Apakah mungkin melakukan pembayaran pinjaman yang telah melewati jatuh tempo dikontrak pinjaman?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Saya telah melakukan pembayaran pinjaman namun perusahaan tidak menerimanya. Apa yang harus saya lakukan?'),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}