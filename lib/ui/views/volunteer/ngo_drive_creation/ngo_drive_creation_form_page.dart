import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swachh_companion/ui/views/volunteer/ngo_drive_creation/ngo_drive_creation_mainpage.dart';
import 'package:swachh_companion/ui/views/volunteer/textFormField.dart';

class NGORegistrationForm extends StatefulWidget {
  const NGORegistrationForm({Key key}) : super(key: key);

  @override
  _NGORegistrationFormState createState() => _NGORegistrationFormState();
}

class _NGORegistrationFormState extends State<NGORegistrationForm> {
  TextEditingController uid = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController ngoName = TextEditingController();
  TextEditingController registrationNo = TextEditingController();
  TextEditingController cityName = TextEditingController();
  TextEditingController stateName = TextEditingController();

  //Registration certificate aur pan-card
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register for a drive"),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormFieldView(
                  heading: 'NGO/Org UID',
                  hintText: 'Enter Unique Id',
                  controller: uid,
                  validator: (value) {
                    if (value.length < 6) return 'Min length-6';
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormFieldView(
                  heading: 'NGO Type',
                  hintText: 'Enter NGO Type',
                  controller: type,
                  validator: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormFieldView(
                  heading: 'NGO Name',
                  hintText: 'Enter Name of NGO',
                  controller: ngoName,
                  validator: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormFieldView(
                  heading: 'Registration Number',
                  isLargeTextField: true,
                  hintText: 'Enter NGO Registration Number',
                  controller: registrationNo,
                  validator: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormFieldView(
                  heading: 'City Name',
                  isLargeTextField: true,
                  hintText: 'Enter NGO City Name',
                  controller: cityName,
                  validator: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormFieldView(
                  heading: 'State Name',
                  isLargeTextField: true,
                  hintText: 'Enter NGO State Name',
                  controller: stateName,
                  validator: (value) {},
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "Application submitted");
                  Future.delayed(Duration(seconds: 1)).then(
                    (value) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NGODriveCreationMainPage(),
                      ),
                    ),
                  );
                },
                child: Text(
                  "Register",
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
      ),
    );
  }
}
