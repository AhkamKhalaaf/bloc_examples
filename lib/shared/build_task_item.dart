import 'package:flutter/material.dart';

class BuildTaskItem extends StatelessWidget {
  const BuildTaskItem({Key? key,required this.model}) : super(key: key);
  final Map model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          const CircleAvatar(
          minRadius: 30.0,
          backgroundColor: Colors.blue,
        ),
        const SizedBox(width: 10.0,),
        Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'tilte task',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'time task',
              style:
              TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
            )
          ],
        ))
      ],
    );
  }
}
