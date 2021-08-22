import 'package:flutter/material.dart';
import 'package:swachh_companion/ui/shared/app_config.dart';

class DrawerHeaderView extends StatelessWidget {
  final bool isPremiumUser;
  const DrawerHeaderView({Key key, this.isPremiumUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: App(context).appHeight(0.25),
      child: DrawerHeader(
        margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.teal.shade300,
              Colors.teal.shade400,
            ],
            end: Alignment.bottomRight,
            stops: [0, 1],
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              //color: Colors.yellow,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Swacch Companion',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/logo.jpeg",
                  height: App(context).appHeight(0.14),
                  width: App(context).appWidth(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
