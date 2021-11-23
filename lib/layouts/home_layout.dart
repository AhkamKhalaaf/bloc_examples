
import 'package:bloc_examples/Modules/archived_tasks/archived_taks.dart';
import 'package:bloc_examples/Modules/done_tasks/done_tasks.dart';
import 'package:bloc_examples/Modules/new_tasks/new_tasks.dart';
import 'package:bloc_examples/controllers/app_config.dart';
import 'package:bloc_examples/shared/constants/constants.dart';
import 'package:bloc_examples/shared/text_form_filed_ui.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  var textTitle = TextEditingController();
  var textTime = TextEditingController();
  var textDate = TextEditingController();

  bool isBottomSheetShown = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  List<Widget> screens = [
    const NewTasks(),
    const DoneTasks(),
    const ArchivedTasks()
  ];
  late Database database;

  Future getName() async {
    print('future method');
  }
  Future< List<Map>>getAllData(datab )async
  {
   return await datab.rawQuery('SELECT * FROM tasks');
   }
  createDataBase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (Database database, int version) {
      print('databse is created');
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT,time TEXT, status TEXT)')
          .then((value) {})
          .catchError((error) {
        print('errorr ${error.toString()}');
      });
    }, onOpen: (dataBaseOpened) {
      print('databse is opend');
      getAllData(dataBaseOpened).then((value){
        items=value;
        print('${items},,,ddadad');
      });

        });
  }

  insertTable({required String title,required String time,required String date}) async {
    database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (title,date,time,status) VALUES ("$title","$time","$date","new")')
          .then((value) {
        print('${value} is inserted successfully');
        textTitle.text='';
        textDate.text='';
        textTime.text='';
        Navigator.pop(context);
        isBottomSheetShown = false;

      }).catchError((error) {
        print('${error} this error in creating row');
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('to do'),
      ),
      body: ConditionalBuilder(fallback: (BuildContext context) {
        return const Center(child:  CircularProgressIndicator(),);
      },
      condition: items.isNotEmpty,
      builder: (BuildContext context) { return screens[currentIndex]; },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle), label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archived')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (isBottomSheetShown) {

            insertTable(title: textTitle.text.toString(),date:textDate.text.toString(),time: textTime.text.toString() );
          } else {
            scaffoldKey.currentState!.showBottomSheet((context) {
              return Container(
                 color: Colors.grey.withOpacity(0.125),
                child: Padding(padding: EdgeInsets.all(20.0),
                  child: Column(mainAxisSize: MainAxisSize.min,
                    children: [
                      textFormUi(enabled: true,function: (){},
                        security: false,
                        errorText: 'enter task title',
                        textInputType: TextInputType.text,
                        hintText: 'task title',
                        textEditingController: textTitle,

                        //assets/phone.png
                        rightIcon: Icon(
                          Icons.edit,
                          color: appConfig.colorMain,
                        ),
                        leftIcon: const SizedBox(
                          width: 0.0,
                        ),
                      ),
                     const SizedBox(height: 20.0,),
                      textFormUi(enabled: true,
                        security: false,
                        errorText: 'enter task time',
                        textInputType: TextInputType.text,
                        hintText: 'task time',
                        textEditingController: textTime,
                        function: ()async{
                      //  print('helllelle');
                             showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                               textTime.text=value!.format(context).toString();
                             });
                        },
                        //assets/phone.png
                        rightIcon: Icon(
                          Icons.watch_later_outlined,
                          color: appConfig.colorMain,
                        ),
                        leftIcon: const SizedBox(
                          width: 0.0,
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      textFormUi(enabled: true,
                        security: false,
                        errorText: 'enter task date',
                        textInputType: TextInputType.text,
                        hintText: 'task date',
                        textEditingController: textDate,
                        function: ()async{
                          //  print('helllelle');
                          showDatePicker(context: context, initialDate: DateTime.now(), 
                              firstDate: DateTime.now(), lastDate: DateTime(2025,1,1)).then((value) {
                           textDate.text=DateFormat.yMd().format(value!).toString();

                          });
                        },
                        //assets/phone.png
                        rightIcon: Icon(
                          Icons.watch_later_outlined,
                          color: appConfig.colorMain,
                        ),
                        leftIcon: const SizedBox(
                          width: 0.0,
                        ),
                      ),

                    ],
                  ),
                ),
              );
            });
            isBottomSheetShown = true;
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
