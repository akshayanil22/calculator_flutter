import 'package:flutter/material.dart';

import 'custom_button.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              Text('59+45',style: TextStyle(fontSize: 32,color: Colors.white60),),
                Text('104',style: TextStyle(fontSize: 58,color: Colors.white),)
            ],),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade600,
              borderRadius: BorderRadius.only(bottomLeft: const Radius.circular(10),bottomRight: Radius.circular(10))
            ),
          ),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(text: '7',),
              CustomButton(text: '8',),
              CustomButton(text: '9',),
              CustomButton(text: 'x',),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(text: '4',),
              CustomButton(text: '5',),
              CustomButton(text: '6',),
              CustomButton(text: '-',),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(text: '1',),
              CustomButton(text: '2',),
              CustomButton(text: '3',),
              CustomButton(text: '+',),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(text: 'Ac',),
              CustomButton(text: '0',),
              CustomButton(text: '=',),
              CustomButton(text: '/',),
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}


