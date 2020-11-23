import 'package:fad_quizapp/Screens/premium/premium.dart';
import 'package:fad_quizapp/components/bottomNavBar.dart';
import 'package:fad_quizapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSceen extends StatefulWidget {
  @override
  _AccountSceenState createState() => _AccountSceenState();
}

class _AccountSceenState extends State<AccountSceen> {
  String name = 'John Doe';

  String email = 'johndoe@gmail.com';

  int stars = 130;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                ),
              ),
              Spacer(flex: 7),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.maxFinite,
                  height: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.blue[800],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/star-rate.svg',
                                  height: 18,
                                ),
                                Text(
                                  '$stars stars',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                settingsButtons(
                  pic: 'assets/icons/Shape.svg',
                  text: 'Profile',
                  color: Colors.green,
                ),
                settingsButtons(
                  pic: 'assets/icons/Shape.svg',
                  text: 'Payment',
                  color: Colors.blue,
                  place: PremiumScreen(),
                ),
                settingsButtons(
                  pic: 'assets/icons/settings.svg',
                  text: 'Settings',
                  color: Colors.deepOrange,
                ),
                settingsButtons(
                  pic: 'assets/icons/Shape.svg',
                  text: 'Theme',
                  color: Colors.amber[200],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: MyNavBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }

  InkWell settingsButtons(
      {String pic, String text, Color color, Object place}) {
    return InkWell(
      onTap: () {
        place != null ?Navigator.push(context, MaterialPageRoute(builder: (context) => place)) : null;
      },
      child: Container(
        height: 70,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundColor: color,
                radius: 20,
                child: SvgPicture.asset(
                  pic,
                  height: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Spacer(flex: 3),
            Expanded(child: Icon(Icons.arrow_forward_ios, size: 15)),
          ],
        ),
      ),
    );
  }
}
