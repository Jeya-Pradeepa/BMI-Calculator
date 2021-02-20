import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_container.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.resultText, @required this.bmi, @required this.interpretationText});

  final String resultText;
  final String bmi;
  final String interpretationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'YOUR RESULT',
                style: kResultTitleStyle,
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: kInactiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText,
                        style: kResultPageStyle,
                      ),
                      Text(
                        bmi,
                        style: kBMIStyle,
                      ),
                      Text(
                        interpretationText,
                        textAlign: TextAlign.center,
                        style: kResultBodyStyle,
                      )
                    ],
                  ),),
            ),
            BottomContainer(
              text: 'RE-CALCULATE BMI',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
