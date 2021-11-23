
import 'package:flutter/material.dart';
class ButtonUI extends StatelessWidget {
  const ButtonUI({Key? key,  this.function}) : super(key: key);
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      function!();
    },child: Text('click'),);
  }
}
