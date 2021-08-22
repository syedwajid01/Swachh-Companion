import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swachh_companion/ui/views/volunteer/textFormField.dart';
import 'package:swachh_companion/ui/views/volunteer/user_volunteer/user_volunteer_view.dart';

class UserVolunteerForm extends StatefulWidget {
  const UserVolunteerForm({Key key}) : super(key: key);

  @override
  _UserVolunteerFormState createState() => _UserVolunteerFormState();
}

class _UserVolunteerFormState extends State<UserVolunteerForm> {
  TextEditingController userName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController EmailId = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply for Volunteer"),
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
                  heading: 'User Name',
                  hintText: 'Enter User Name',
                  controller: userName,
                  validator: (value) {
                    if (value.length < 6) return 'Min length-6';
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormFieldView(
                  textInputType: TextInputType.number,
                  heading: 'Mobile Number',
                  hintText: 'Enter Mobile Number',
                  controller: mobileNumber,
                  validator: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormFieldView(
                  heading: 'Email id',
                  hintText: 'Enter Email Id',
                  controller: EmailId,
                  validator: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormFieldView(
                  heading: 'Address',
                  isLargeTextField: true,
                  hintText: 'Enter your address',
                  controller: address,
                  validator: (value) {},
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Fluttertoast.showToast(msg: "Application submitted");
                  Future.delayed(Duration(seconds: 1)).then(
                    (value) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserVolunteerMainPage(),
                      ),
                    ),
                  );
                },
                child: Text(
                  "Apply",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
