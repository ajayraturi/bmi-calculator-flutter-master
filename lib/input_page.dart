import 'package:flutter/material.dart';
const bottomContainerHeight =80.0;
const activeCardColour =0xFF1D1E33;
const bottomContainerColour= Color(0xFFEB1555);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
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

class ReUsableCard extends StatelessWidget {
  ReUsableCard({@required this.colour});
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
    );
  }
}
