import 'constants.dart';
import 'results_page.dart';
import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

enum Gender { male, female }
int height = 180;
int weight = 60;
int age=19;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInActiveCardColour;
  Color femaleCardColour = kInActiveCardColour;
  void updateColour(Gender selectedgender) {
    selectedgender == Gender.male
        ? maleCardColour = kActiveCardColour
        : maleCardColour = kInActiveCardColour;
    selectedgender == Gender.female
        ? femaleCardColour = kActiveCardColour
        : femaleCardColour = kInActiveCardColour;
    // if(selectedgender==Gender.male){
    //   if(maleCardColour==inActiveCardColour){
    //     maleCardColour=activeCardColour;
    //   }
    //   else{
    //     maleCardColour=inActiveCardColour;
    //   }
    // }
    // else{
    //   if(femaleCardColour==inActiveCardColour){
    //     femaleCardColour=activeCardColour;
    //   }
    //   else{
    //     femaleCardColour=inActiveCardColour;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATORR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Male is pressed');
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: Expanded(
                        child: ReUsableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Male is pressed');
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: Expanded(
                        child: ReUsableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    )),
                  ),
                ),
              ],
            )),
            Expanded(
                child: ReUsableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                        print(newValue);
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReUsableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                            ),
                            SizedBox(

                              width: 20.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ]),
                )),
                Expanded(
                    child: ReUsableCard(
                  colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Age',
                          style: kLabelTextStyle,
                          ),
                          Text(age.toString(),
                          style: kNumberTextStyle,

                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.plus, onPressed:(){
                                setState(() {
                                  age++;
                                });
                              }),
                              SizedBox(
                                width:20.0,
                              ),
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                setState(() {
                                  age--;
                                });
                              })
                            ],
                          )
                        ],
                      ) ,
                )),
              ],
            )),
            GestureDetector(
              
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)
                {
                  return ResultsPage();
                }
                ));
              },
              child: Container(
                
                child: Center(
                  child: Text('Calculate',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700
                  ),
                  ),
                ),
                color: kBottomContainerColour,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: KBottomContainerHeight,
              ),
            )
          ],
        ));
  }
}
class RoundIconButton extends StatelessWidget {
final IconData icon;
final Function onPressed;

 RoundIconButton({@required this.icon,@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
constraints: BoxConstraints.tightFor(
  width: 56.0,
  height: 56.0
),
      elevation: 6.0,
      onPressed:onPressed,
    );
  }
}
