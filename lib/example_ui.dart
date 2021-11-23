import 'package:flutter/material.dart';

import 'next_page_ui.dart';
import 'values.dart';
class ExampleUi extends StatelessWidget {
  const ExampleUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title: const Text('items'),) ,
    body: ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black,
      ),
      itemCount: 20,
      itemBuilder: (context, index) => GestureDetector(onTap: (){
        showLogoutDialog(context: context,function: (){
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NextPageUi()),
          ).then((value) {
            print('${value},,,,,,,,,,,value');
          });
              //NextPageUi
        },title:'go to next page',widget: const Icon(Icons.watch_later_outlined) );
      },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("Index $index")),
        ),
      ),
    ));
  }
}
