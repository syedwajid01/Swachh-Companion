import 'package:flutter/material.dart';
import 'package:swachh_companion/ui/shared/shared_styles.dart';

class UserVolunteerMainPage extends StatefulWidget {
  const UserVolunteerMainPage({Key key}) : super(key: key);

  @override
  _UserVolunteerMainPageState createState() => _UserVolunteerMainPageState();
}

class _UserVolunteerMainPageState extends State<UserVolunteerMainPage> {
  @override
  Widget build(BuildContext context) {
    double hp = MediaQuery.of(context).size.height;
    double wp = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("All Drives"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   height: hp * 0.2,
            //   width: wp * 0.8,
            //   alignment: Alignment.center,
            //   decoration: mdecoration,
            // )
          ],
        ),
      ),
    );
  }
}
