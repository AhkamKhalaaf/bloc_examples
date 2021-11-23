import 'package:bloc_examples/shared/build_task_item.dart';
import 'package:bloc_examples/shared/constants/constants.dart';
import 'package:flutter/material.dart';
class NewTasks extends StatelessWidget {
  const NewTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsetsDirectional.only(start: 10.0,top: 10.0),
    child: ListView.separated(itemBuilder: (context,index){
      return   BuildTaskItem(model: items[index],);
    }, separatorBuilder: (context, index) => const Divider(
      color: Colors.black12,
    ), itemCount: items.length),);
  }
}
