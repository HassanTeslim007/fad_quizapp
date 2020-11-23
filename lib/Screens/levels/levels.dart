import 'package:fad_quizapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LevelScreen extends StatefulWidget {
  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen>
    with SingleTickerProviderStateMixin {
  String subject = 'Basic Chemistry';
  var curentLevel;
  List<Level> levels = [];

  Animation<double> _animation;
  AnimationController _controller;
  ColorTween color = ColorTween(begin: Colors.red, end: Colors.green);
  ScrollController controller = ScrollController();

  @override
  void initState() {
// _controller=
    _controller = AnimationController(
      vsync: this,
      upperBound: 100,
      lowerBound: 0,
      duration: Duration(seconds: 10),
      // value: _animation.value,
    );
    // _controller.forward();
    // _animation = _controller.value;
    for (int i = 1; i < 21; i++) {
      levels.add(Level(i));
      i == 1 ? levels[i - 1].currentLevel = 16 : null;
      i == 1 ? levels[i - 1].percent = 85 : null;
      i == 2 ? levels[i - 1].currentLevel = 6 : null;
      i == 2 ? levels[i - 1].percent = 15 : null;
      i <= 2 ? levels[i - 1].isUnlocked = true : null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          height: device.size.height -
              device.viewPadding.top -
              device.viewPadding.bottom,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            left: 20,
                            child: InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/arow back.svg',
                                height: 18,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 70,
                            left: 40,
                            child: Text(
                              subject,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 110,
                            left: 40,
                            child: Container(
                              width: 250,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit donec consectetur semper',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 40,
                            top: 50,
                            child: SvgPicture.asset(
                                'assets/icons/heating-a-flask-with-testing-liquid-on-fire-flames.svg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(flex: 6),
                ],
              ),
              SingleChildScrollView(
                controller: controller,
                child: Container(
                  height: device.size.height -
                      device.viewPadding.top -
                      device.viewPadding.bottom,
                  child: Column(
                    children: [
                      Spacer(flex: 2),
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(40),
                                child: Text(
                                  '${levels.length} Levels',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: ListView.builder(
                                  controller: controller,
                                  itemCount: levels.length,
                                  itemBuilder: (__, index) {
                                    Level level = levels[index];
                                    return buildLevels(level);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildLevels(Level level) {
    return InkWell(
      onTap: level.isUnlocked ? () {} : null,
      child: Container(
        margin: EdgeInsets.fromLTRB(40, 0, 40, 30),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Level ${level.level}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: level.isUnlocked ? Colors.black : Colors.grey[300],
                  ),
                ),
                Spacer(),
                Text(
                  '${level.currentLevel} of total ${level.noOfLevels}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: level.isUnlocked ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
            CircularPercentIndicator(
              // value: level.isUnlocked ? 80 / 100 : 0,
              radius: 50,
              lineWidth: 4,
              animation: true,
              animationDuration: 3000,
              progressColor: colorbuilder(level.percent),
              percent: level.isUnlocked ? level.percent / 100 : 0,
              center: level.isUnlocked
                  ? Text('${level.percent.floor()}%')
                  : Icon(
                      Icons.lock,
                      size: 17,
                    ),
              backgroundColor: Colors.grey[300],
              circularStrokeCap: CircularStrokeCap.round,
              // valueColor: color.animate(_animation),
            ),
          ],
        ),
      ),
    );
  }

  Color colorbuilder(double value) {
    if (value < 20) return Colors.red;
    if (value > 20 && value < 40) return Colors.orange;
    if (value > 40 && value < 60) return Colors.yellow;
    if (value > 60 && value < 80)
      return Colors.lime;
    // if (value > 80)
    else
      return Colors.green;
  }
}

class Level {
  int level;
  bool _isUnlocked = false;
  int _currentlevel = 0;
  int noOfLevels = 20;
  double percent;
  Level(this.level, [this.percent = 50]);

  set isUnlocked(bool value) => _isUnlocked = value;
  bool get isUnlocked => _isUnlocked;

  set currentLevel(int value) => _currentlevel = value;
  int get currentLevel => _currentlevel;
}
