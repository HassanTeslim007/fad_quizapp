import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class MyNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onTap;

  MyNavBar({
    this.currentIndex = 0,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(0);
              },
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/icon - home.svg',
                  height: 22,
                  color: currentIndex == 0 ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(1);
              },
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/categories.svg',
                  height: 22,
                  color: currentIndex == 1 ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(2);
              },
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/challenge.svg',
                  height: 22,
                  color: currentIndex == 2 ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onTap(3);
              },
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  height: 22,
                  color: currentIndex == 3 ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
