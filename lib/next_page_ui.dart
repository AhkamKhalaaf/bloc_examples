

import 'package:flutter/material.dart';

class NextPageUi extends StatefulWidget {
  const NextPageUi({Key? key}) : super(key: key);

  @override
  State<NextPageUi> createState() => _NextPageUiState();
}

class _NextPageUiState extends State<NextPageUi> {
  var textTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      Navigator.pop(context,textTitle.text.toString());
      return true;
    },
      child: Scaffold(
        appBar: AppBar(
          title:const Text('form ui'),
        ),
        body: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: textTitle,
                  decoration:const InputDecoration(label:  Text('enter name')),
                ),
                MaterialButton(color: Colors.red,onPressed: (){
                  Navigator.pop(context,textTitle.text.toString());
                 },child: const Text('save'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
