import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voidrealm/models/appbar_model.dart';

class ProgressIndicator1 extends StatelessWidget {
  final appbarModel = List<AppbarModel>.generate(
    20,
        (i) => AppbarModel(
            'AppbarModel $i',
            'A description of what needs to be done for AppbarModel $i'
        ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      new Text(
        // '$appbarModel terisi\n',
        '20% terisi\n',
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey
        ),
      ),
      new LinearProgressIndicator(
        key: ((){///NG FOR KEY WITH LISTVIEW BUILDER
          ListView.builder(
            itemCount: appbarModel.length,
            itemBuilder: (context, index) {
              return Text(appbarModel[index].persenTerisi);
              // return ListTile(
              //   title: Text(appbarModel[index].persenTerisi),
              // );
            },
          );
          print('appbarModel = '+appbarModel.length.toString());///NG BS
        }()),
        backgroundColor: Colors.red[200],
        valueColor: new AlwaysStoppedAnimation<Color>(
          Colors.grey[300],
        ),
        value: 100,
      ),
    ],
    crossAxisAlignment: CrossAxisAlignment.start,);
    /*return Container(
      child: LinearProgressIndicator(
        backgroundColor: Colors.red[200],
        value: 100,
      ),
    );*/
  }
}