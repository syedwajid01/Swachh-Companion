import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:swachh_companion/ui/views/swatch_bharat/swachh_bharat_viewmodel.dart';

class SwachBharatInfoView extends StatefulWidget {
  const SwachBharatInfoView({Key key}) : super(key: key);
  @override
  _SwachBharatInfoViewState createState() => _SwachBharatInfoViewState();
}

class _SwachBharatInfoViewState extends State<SwachBharatInfoView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SwachBharatInfoViewModel>.reactive(
      viewModelBuilder: () => SwachBharatInfoViewModel(),
      builder: (
        BuildContext context,
        SwachBharatInfoViewModel model,
        Widget child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Swachh Bharat"),
          ),
          body: Center(
            child: Text(
              'SwachBharatInfoView',
            ),
          ),
        );
      },
    );
  }
}
