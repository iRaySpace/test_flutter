import 'package:flutter/material.dart';
import 'ghflutter.dart';
import 'strings.dart';

void main() => runApp(GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      home: GHFlutter(),
    );   
  }
}

// class HomeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold (
//       body: Center(
//         child: Text('Test me'),
//       ),
//     );
//   }
// }
