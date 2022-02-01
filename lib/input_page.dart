import 'constants.dart';
import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

enum Gender{
  male,
  female
}
int height=180;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
 Color maleCardColour=kInActiveCardColour;
 Color femaleCardColour=kInActiveCardColour;
void updateColour(Gender selectedgender){

  selectedgender == Gender.male ? maleCardColour=kActiveCardColour : maleCardColour=kInActiveCardColour;
  selectedgender == Gender.female ? femaleCardColour=kActiveCardColour : femaleCardColour=kInActiveCardColour;
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
                    onTap: (){
                      print('Male is pressed');
                    setState(() {
                      updateColour(Gender.male);
                    });
                    },
                    child: Expanded(
                        child: ReUsableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                    )),
                  ),
                ),
                Expanded(child:
                GestureDetector(
                  onTap: (){
                    print('Male is pressed');
                    setState(() {
                      updateColour(Gender.female);
                    });
                  },
                  child: Expanded(
                      child: ReUsableCard(
                    colour: femaleCardColour,
                        cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
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
  Text('Height',
  style: kLabelTextStyle,
  ),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: [
      Text(height.toString(),style: kNumberTextStyle,
      ),
      Text('cm',style: kLabelTextStyle,
      ),
    ],
  ),
  Slider(value: height.toDouble(),
      min: 120.0,
    max: 220.0,
    activeColor: Color(0xFFEB1555),
    inactiveColor: Color(0xFF8D8E98),
    onChanged: (double newValue){
    setState(() {
      height=newValue.round();
    });
    print(newValue);
    },

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
                )),
                Expanded(
                    child: ReUsableCard(
                  colour: kActiveCardColour,
                )),
              ],
            )),
            Container(
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: KBottomContainerHeight,
            )
          ],
        ));
  }
}
