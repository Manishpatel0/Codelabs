import 'package:apps/constants/app_constants.dart';
import 'package:apps/widgets/left_bar.dart';
import 'package:apps/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	TextEditingController _heightController = TextEditingController();
	TextEditingController _weightController = TextEditingController();
	double _bmiResult = 0;
	String _textResult = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manish Patel Caluclator",
          style: TextStyle(color: accebtHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                  	controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accebtHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                  	controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accebtHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
            	onTap: (){
            		double _h = double.parse(_heightController.text);
            		double _w = double.parse(_weightController.text);
            		setState(() {
            		            		  _bmiResult = _w/(_h * _h);
            		            		  if(_bmiResult > 25) {
            		            		  	_textResult = "You\'re over Weight";
            		            		  } else if (_bmiResult >= 18.5 && _bmiResult <= 25){
            		            		  	_textResult = "You have normal weight";
            		            		  } else {
            		            		  	_textResult = "You\'re over weight";
            		            		  }
            		            		});
            		},
              child: Container(
                child: Text(
                  "Caluclator",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accebtHexColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: accebtHexColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
            	visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accebtHexColor),
                ),
              ),
            ),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40,),
            SizedBox(height: 20,),
            LeftBar(barWidth: 70,),
            SizedBox(height: 20,),
            LeftBar(barWidth: 40,),

            SizedBox(height: 20,),
            RightBar(barWidth: 40,),
            SizedBox(height: 40,),
            RightBar(barWidth: 40,),
          ],
        ),
      ),
    );
  }
}
