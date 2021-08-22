import 'package:flutter/material.dart';
import 'package:swachh_companion/ui/views/volunteer/textFormField.dart';

class NGODriveCreationMainPage extends StatefulWidget {
  const NGODriveCreationMainPage({Key key}) : super(key: key);

  @override
  _NGODriveCreationMainPageState createState() =>
      _NGODriveCreationMainPageState();
}

class _NGODriveCreationMainPageState extends State<NGODriveCreationMainPage> {
  TextEditingController driveName = TextEditingController();
  TextEditingController driveDate = TextEditingController();
  TextEditingController localityName = TextEditingController();
  TextEditingController cityName = TextEditingController();
  TextEditingController stateName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create drive"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormFieldView(
                heading: 'Drive Name',
                hintText: 'Enter Drive Name',
                controller: driveName,
                validator: (value) {
                  if (value.length < 6) return 'Min length-6';
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormFieldView(
                heading: 'Drive Date',
                hintText: 'Enter Drive Date',
                controller: driveDate,
                validator: (value) {},
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormFieldView(
                heading: 'Locality Name',
                hintText: 'Enter Locality Name',
                controller: localityName,
                validator: (value) {},
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormFieldView(
                heading: 'City Name',
                isLargeTextField: true,
                hintText: 'Enter City Name',
                controller: cityName,
                validator: (value) {},
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormFieldView(
                heading: 'State Name',
                isLargeTextField: true,
                hintText: 'Enter State Name',
                controller: stateName,
                validator: (value) {},
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Submit",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
