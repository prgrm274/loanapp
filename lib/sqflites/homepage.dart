import 'package:flutter/material.dart';
import 'package:voidrealm/sqflites/db_helper.dart';
import 'package:voidrealm/sqflites/employee.dart';
import 'package:voidrealm/sqflites/employee_list.dart';

/**
 * * https://github.com/rajajawahar/FlutterDatabaseSQFLite/blob/master/lib/main.dart
 */

/// main.dart
class Sqflite1 extends StatefulWidget {
  Sqflite1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Sqflite1State createState() => new _Sqflite1State();
}

class _Sqflite1State extends State<Sqflite1> {

  Employee employee = new Employee("", "", "", "");

  String firstname;
  String lastname;
  String emailId;
  String mobileno;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
          title: new Text('Saving Employee'),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.view_list),
              tooltip: 'Next choice',
              onPressed: () {
                navigateToEmployeeList();
              },
            ),
          ]
      ),
      body: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: [
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(labelText: 'First Name'),
                validator: (val) =>
                val.length == 0 ?"Enter FirstName" : null,
                onSaved: (val) => this.firstname = val,
              ),
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(labelText: 'Last Name'),
                validator: (val) =>
                val.length ==0 ? 'Enter LastName' : null,
                onSaved: (val) => this.lastname = val,
              ),
              new TextFormField(
                keyboardType: TextInputType.phone,
                decoration: new InputDecoration(labelText: 'Mobile No'),
                validator: (val) =>
                val.length ==0 ? 'Enter Mobile No' : null,
                onSaved: (val) => this.mobileno = val,
              ),
              new TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(labelText: 'Email Id'),
                validator: (val) =>
                val.length ==0 ? 'Enter Email Id' : null,
                onSaved: (val) => this.emailId = val,
              ),
              new Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: new RaisedButton(
                  onPressed: _submit,
                  child: new Text('Login'),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    }else{
      return null;
    }
    var employee = Employee(firstname,lastname,mobileno,emailId);
    var dbHelper = DBHelper();
    dbHelper.saveEmployee(employee);
    _showSnackBar("Data saved successfully");
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  void navigateToEmployeeList(){
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new MyEmployeeList()),
    );
  }
}