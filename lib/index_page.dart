import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'bottom_container.dart';
import 'calculate_result.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  Icon selectedIcon;
  int currentHeightValue = 160;
  int currentWeightValue = 60;
  int currentAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      },);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        currentHeightValue.toString(),
                        style: kNumberTextStyle,
                      ),
                      SizedBox(
                        width: kSizedBoxWidth,
                      ),
                      Text(
                        'CM',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kSliderThumbColor,
                      overlayColor: kSliderOverLayColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: kSliderThumbRadius,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: kSliderOverlayRadius,
                      ),
                      activeTrackColor: kSliderActiveColor,
                      inactiveTrackColor: kSliderInactiveColor,
                    ),
                    child: Slider(
                      value: currentHeightValue.toDouble(),
                      min: kSliderMinimum.toDouble(),
                      max: kSliderMaximum.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          currentHeightValue = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          currentWeightValue.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  currentWeightValue -= 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: kSizedBoxWidth,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  currentWeightValue += 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          currentAge.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  currentAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: kSizedBoxWidth,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  currentAge++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomContainer(
            text: 'CALCULATE BMI',
            onPress: () {
              CalculateBrain calculate = CalculateBrain(height: currentHeightValue, weight: currentWeightValue);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    resultText: calculate.getResult(),
                    bmi: calculate.calculateBMI(),
                    interpretationText: calculate.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
