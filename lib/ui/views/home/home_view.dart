import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:swachh_companion/ui/views/home/waste_classification.dart';
import 'package:swachh_companion/ui/widgets/smart_widgets/drawer/drawer_view.dart';
import 'home_viewmodel.dart';

// UI CODE ONLY

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double hp = MediaQuery.of(context).size.height;
    double wp = MediaQuery.of(context).size.width;
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => {model.initState()},
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          drawer: DrawerView(),
          appBar: AppBar(
            textTheme: Theme.of(context).appBarTheme.textTheme,
            title: Text(
              "Swachh Companion",
            ),
            backgroundColor: Theme.of(context).appBarTheme.color,
          ),
          body: !model.istfInit
              ? CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Swachh Companion for a Clean India",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.green),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      "assets/blue-trans.png",
                                      height: hp * 0.2,
                                      width: wp * 0.3,
                                    ),
                                  ),
                                  Text(
                                    "Non Biodegradable",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontSize: 13),
                                  ),
                                  Text("Recyclable")
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Image.asset(
                                    "assets/green-trans.png",
                                    height: hp * 0.2,
                                    width: wp * 0.3,
                                  ),
                                ),
                                Text("Biodegradable"),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    child: Image.asset(
                                      "assets/red-trans.png",
                                      height: hp * 0.2,
                                      width: wp * 0.3,
                                    ),
                                  ),
                                  Text(
                                    "Non-Biodegradable",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontSize: 13),
                                  ),
                                  Text("Hard to Recycle")
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => WasteClassification()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Classify Waste",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple,
                                      ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.purple, size: 15),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: !model.imageSelected
                              ? Container(
                                  // width: 300,
                                  child: Column(
                                    children: <Widget>[
                                      // Image.asset('assets/logo.jpeg'),
                                      // SizedBox(height: 40),
                                    ],
                                  ),
                                )
                              : Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 250,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Image.file(
                                          model.image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      model.output != null
                                          ? Column(
                                              children: [
                                                Text(
                                                  '${model.output[0]['label']}'
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                if (model.wasteToBinMapper[model
                                                        .output[0]['label']] ==
                                                    "green")
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: hp * 0.2,
                                                        width: wp * 0.5,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            20,
                                                          ),
                                                          child: Image.asset(
                                                            "assets/green-trans.png",
                                                          ),
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: Colors.green,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: 10,
                                                            horizontal: 20,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          showInfo(
                                                            context,
                                                            color: Colors
                                                                .lightGreen,
                                                            content:
                                                                "Biodegradable waste is any product that can be easily broken down naturally by water, oxygen, the sun's rays, radiation, or microorganisms. In the process, organic forms of matter are broken down into simpler units. The matter is decomposed and will eventually return to the soil. In this way, the soil is nourished.",
                                                            title:
                                                                "Biodegradable",
                                                          );
                                                        },
                                                        child: Text(
                                                            "Biodegradable"),
                                                      )
                                                    ],
                                                  ),
                                                if (model.wasteToBinMapper[model
                                                        .output[0]['label']] ==
                                                    "red")
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: hp * 0.2,
                                                        width: wp * 0.5,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            20,
                                                          ),
                                                          child: Image.asset(
                                                            "assets/red-trans.png",
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary: Colors.red,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 10,
                                                              horizontal: 10,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            showInfo(
                                                              context,
                                                              color: Colors
                                                                  .redAccent,
                                                              content:
                                                                  "Non-biodegradable cannot be easily handled. Non-biodegradable wastes are those who cannot be decomposed or dissolved by natural agents. They remain on earth for thousands of years without any degradation.Non-biodegradable wastes that cannot be recycled are known as “Non-recyclable waste”.",
                                                              title:
                                                                  "Non Biodegradable \n (Hard to Recycle)",
                                                            );
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  "Non Biodegradable/"),
                                                              Text(
                                                                  "Hard to Recycle"),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                if (model.wasteToBinMapper[model
                                                        .output[0]['label']] ==
                                                    "blue")
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: hp * 0.2,
                                                        width: wp * 0.5,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            20,
                                                          ),
                                                          child: Image.asset(
                                                            "assets/blue-trans.png",
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            primary:
                                                                Colors.blue,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 10,
                                                              horizontal: 10,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            showInfo(
                                                              context,
                                                              color: Colors
                                                                  .lightBlue,
                                                              content:
                                                                  "Non-biodegradable cannot be easily handled. Non-biodegradable wastes are those who cannot be decomposed or dissolved by natural agents. They remain on earth for thousands of years without any degradation.Non-biodegradable wastes that can be recycled are known as “Recyclable waste”",
                                                              title:
                                                                  "Non Biodegradable \n (Recyclable)",
                                                            );
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  "Non Biodegradable/"),
                                                              Text(
                                                                  "Recyclable"),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                              ],
                                            )
                                          : Container(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: model.pickImage,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 17),
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera_alt_rounded,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Take A Photo',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: model.pickGalleryImage,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 17),
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Browse',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

showInfo(BuildContext context,
    {String title, String content, Color color}) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: color,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 25, color: Colors.black),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Center(
                    child: Text(
                      content,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      });
}
