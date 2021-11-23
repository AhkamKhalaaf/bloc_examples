import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTaskItem(Map model)=>Row(
  children: [
      CircleAvatar(
      minRadius: 30.0,
      backgroundColor: Colors.blue,child: Text('${model['date']}',style: TextStyle(color: Colors.white),),
    ),
    const SizedBox(width: 10.0,),
    Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:   [
            Text(
              '${model['title']}',
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              '${model['date']}',
              style:
              TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
            )
          ],
        ))
  ],
);