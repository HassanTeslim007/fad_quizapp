import 'package:fad_quizapp/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String subject = 'Basic Chemistry';
  int numberOfQuestions = 20;
  int questionNumber = 06;
  String question = 'What is the formula of water?';
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: kPrimaryColor,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: kPrimaryLightColor,
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: InkWell(
                          child: Icon(Icons.arrow_back),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Center(
                        child: Text(
                          subject,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Text(
                  '$questionNumber/$numberOfQuestions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OptionBox(
                        selectedIndex: selectedIndex,
                        option: 'H2O',
                        optionTag: 'A',
                        optionIndex: 0,
                        onTap: () => setState(() => selectedIndex = 0),
                      ),
                      OptionBox(
                        selectedIndex: selectedIndex,
                        option: '2HO',
                        optionTag: 'B',
                        optionIndex: 1,
                        onTap: () => setState(() => selectedIndex = 1),
                      ),
                      OptionBox(
                        selectedIndex: selectedIndex,
                        option: 'H2',
                        optionTag: 'C',
                        optionIndex: 2,
                        onTap: () => setState(() => selectedIndex = 2),
                      ),
                      OptionBox(
                        selectedIndex: selectedIndex,
                        option: 'OH2',
                        optionTag: 'D',
                        optionIndex: 3,
                        onTap: () => setState(() => selectedIndex = 3),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.black26,
                                    offset: Offset(-2, 5),
                                  ),
                                ],
                              ),
                              child: Icon(Icons.arrow_back),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Colors.black26,
                                    offset: Offset(-2, 5),
                                  ),
                                ],
                              ),
                              child: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionBox extends StatelessWidget {
  final String option;
  final String optionTag;
  final int optionIndex;
  final Function onTap;
  OptionBox({
    Key key,
    @required this.selectedIndex,
    @required this.option,
    @required this.optionTag,
    @required this.optionIndex,
    @required this.onTap,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:
              selectedIndex == optionIndex ? kPrimaryColor : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: selectedIndex == optionIndex
                  ? kPrimaryLightColor
                  : Colors.grey,
              child: Text(
                optionTag,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: selectedIndex == optionIndex
                      ? kPrimaryColor
                      : kPrimaryLightColor,
                  fontSize: 10,
                ),
              ),
            ),
            Spacer(),
            Text(
              option,
              style: TextStyle(
                color: selectedIndex == optionIndex
                    ? kPrimaryLightColor
                    : Colors.black,
              ),
            ),
            Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
