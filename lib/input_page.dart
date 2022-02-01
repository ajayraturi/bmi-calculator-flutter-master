import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = 0xFF1D1E33;
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATORR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReUsableCard(
                  colour: Color(activeCardColour),
                  cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                )),
                Expanded(
                    child: ReUsableCard(
                  colour: Color(activeCardColour),
                      cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                )),
              ],
            )),
            Expanded(
                child: ReUsableCard(
              colour: Color(activeCardColour),
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReUsableCard(
                  colour: Color(activeCardColour),
                )),
                Expanded(
                    child: ReUsableCard(
                  colour: Color(activeCardColour),
                )),
              ],
            )),
            Container(
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
