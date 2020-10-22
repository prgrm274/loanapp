// import 'package:flutter/material.dart';
//
// class JTextEditingController extends StatelessWidget {
//
//   bool _isEditingText = false;
//   TextEditingController _editingController;
//   String initialText = "Initial Text";
//
//   @override
//   void initState() {
//     super.initState();
//     _editingController = TextEditingController(text: initialText);
//   }
//   @override
//   void dispose() {
//     _editingController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Custom TextEditingController"),
//       ),
//       body: Center(
//         child: _editTitleTextField(),
//       ),
//     );
//   }
//
//
//   Widget _editTitleTextField() {
//     if (_isEditingText)
//       return Center(
//         child: TextField(
//           onSubmitted: (newValue){
//             setState(() {
//               initialText = newValue;
//               _isEditingText =false;
//             });
//           },
//           autofocus: true,
//           controller: _editingController,
//         ),
//       );
//     return InkWell(
//         onTap: () {
//       setState(() {
//         _isEditingText = true;
//       });
//     },
//     child: Text(
//     initialText,
//     style: TextStyle(
//     color: Colors.black,
//     fontSize: 18.0,
//     ),
//     );
//   }
// }