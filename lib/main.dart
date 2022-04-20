import 'package:flutter/material.dart';

import 'custom_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstNumber = 0;

  int secondNumber = 0;

  String history = '';

  String display = '';

  String result = '';

  String operand = '';

  void btnOnClick(String btnValue) {
    print(btnValue);
    if (btnValue == 'Ac') {
      setState(() {
        display = '';
        firstNumber = 0;
        secondNumber = 0;
        history = '';
        result = '';
        operand = '';
      });
    } else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == 'x' ||
        btnValue == '/') {
      setState(() {
        firstNumber = int.parse(display);
        result = '';
        display = display + btnValue;
        operand = btnValue;
      });
    } else if (btnValue == '=') {
      secondNumber = int.parse(display);
      if (operand == '+') {
        setState(() {
          display = (firstNumber + secondNumber).toString();
          history = firstNumber.toString() + operand + secondNumber.toString();
        });
      }
      if (operand == '-') {
        setState(() {
          display = (firstNumber - secondNumber).toString();
          history = firstNumber.toString() + operand + secondNumber.toString();
        });
      }
      if (operand == 'x') {
        setState(() {
          display = (firstNumber * secondNumber).toString();
          history = firstNumber.toString() + operand + secondNumber.toString();
        });
      }
      if (operand == '/') {
        setState(() {
          if (secondNumber != 0) {
            display = (firstNumber / secondNumber).round().toString();
            history =
                firstNumber.toString() + operand + secondNumber.toString();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Can\'t divisible by Zero')));
          }
        });
      }
      operand = '=';
    } else {
      setState(() {
        if (operand != '=') {
          result = result + btnValue;
          display = result;
        }
      });
    }
  }

  Widget CustomButtonRow(List values){
    return Column(
      children: [SizedBox(
        height: 10,
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(text: values[0], onPress: btnOnClick),
            CustomButton(text: values[1], onPress: btnOnClick),
            CustomButton(text: values[2], onPress: btnOnClick),
            CustomButton(text: values[3], onPress: btnOnClick),
          ],
        ),],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    history,
                    style: TextStyle(fontSize: 32, color: Colors.white60),
                  ),
                  Text(
                    display,
                    style: TextStyle(fontSize: 58, color: Colors.white),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade600,
                  borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(10),
                      bottomRight: Radius.circular(10))),
            ),
          ),
          CustomButtonRow(['7','8','9','x']),
          CustomButtonRow(['4','5','6','-']),
          CustomButtonRow(['1','2','3','+']),
          CustomButtonRow(['Ac','0','=','/']),
        ],
      ),
    );
  }
}


