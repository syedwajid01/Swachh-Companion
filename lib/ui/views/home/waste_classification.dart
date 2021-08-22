import 'package:flutter/material.dart';

class WasteClassification extends StatefulWidget {
  const WasteClassification({Key key}) : super(key: key);

  @override
  _WasteClassificationState createState() => _WasteClassificationState();
}

class _WasteClassificationState extends State<WasteClassification> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotatedBox(
        quarterTurns: 1,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/classification.jpeg"),
            ),
          ),
        ),
      ),
    );
  }
}
