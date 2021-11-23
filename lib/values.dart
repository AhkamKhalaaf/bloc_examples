import 'package:flutter/material.dart';

showLogoutDialog({required BuildContext context,required String title,required Widget widget,
  required Function function}
    ) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return  Scaffold(backgroundColor: Colors.transparent,
          body: Center(
            child: Container(alignment: Alignment.center
              ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.white
              ),height: 160.0,width: 250.0,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center
                ,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  widget,
                  const SizedBox(height: 10.0,),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,children: [
                      RaisedButton(
                          color: Theme.of(context).accentColor,
                          child: const Text(
                            'yes',
                            style: TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                          onPressed: () {
                            function();
                          }),
                      RaisedButton(
                          color: Theme.of(context).accentColor,
                          child: const Text(
                            'no',
                            style: TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],)


                ],
              ),
            ),
          ),)


        ;
      });
}