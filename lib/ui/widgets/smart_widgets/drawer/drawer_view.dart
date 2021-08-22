import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:swachh_companion/AppTheme/AppStateNotifier.dart';
import 'package:swachh_companion/ui/shared/app_config.dart';
import 'package:swachh_companion/ui/views/swatch_bharat/swachh_bharat_view.dart';
import 'package:swachh_companion/ui/views/volunteer/ngo_drive_creation/ngo_drive_creation_form_page.dart';
import 'package:swachh_companion/ui/views/volunteer/user_volunteer/user_volunteer_form_page.dart';
import 'package:swachh_companion/ui/widgets/dumb_widgets/drawer_header.dart';
import 'package:swachh_companion/ui/widgets/smart_widgets/drawer/drawer_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    var subtitle1 =
        Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 16);

    return ViewModelBuilder<DrawerViewModel>.reactive(
      onModelReady: (model) async {},
      builder: (context, model, child) => Container(
        width: App(context).appScreenWidthWithOutSafeArea(0.78),
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeaderView(),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: <Widget>[
                    // ListTile(
                    //   leading: Icon(
                    //     Icons.brightness_4,
                    //     color: AppStateNotifier.isDarkModeOn
                    //         ? Colors.white
                    //         : Colors.grey[700],
                    //   ),
                    //   title: GestureDetector(
                    //     child: Text(
                    //       "SWITCH THEME",
                    //       style: subtitle1,
                    //     ),
                    //   ),
                    //   onTap: () {},
                    // ),
                    ListTile(
                        leading: Icon(
                          Icons.clean_hands,
                          color: AppStateNotifier.isDarkModeOn
                              ? Colors.white
                              : Colors.grey[700],
                        ),
                        title: Text(
                          "Swachh Bharat Mission",
                          style: subtitle1,
                        ),
                        onTap: () async {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => SwachBharatInfoView(),
                          //   ),
                          // );
                          launch(
                              "https://swachhbharatmission.gov.in/sbmcms/index.htm");
                        }),
                    ListTile(
                        leading: Icon(
                          Icons.person,
                          color: AppStateNotifier.isDarkModeOn
                              ? Colors.white
                              : Colors.grey[700],
                        ),
                        title: Text(
                          "I Want to Volunteer",
                          style: subtitle1,
                        ),
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserVolunteerForm(),
                            ),
                          );
                        }),
                    ListTile(
                        leading: Icon(
                          Icons.group,
                          color: AppStateNotifier.isDarkModeOn
                              ? Colors.white
                              : Colors.grey[700],
                        ),
                        title: Text(
                          "NGO's/Govt Organization",
                          style: subtitle1,
                        ),
                        subtitle:
                            Text("I'm looking to create a swachh bharat drive"),
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NGORegistrationForm(),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 200,
                    ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/volunteeropportunities.png",
                          height: App(context).appHeight(0.14),
                          width: App(context).appWidth(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => DrawerViewModel(),
    );
  }
}
