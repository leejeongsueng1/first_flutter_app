import 'package:flutter/material.dart';

import 'data/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos =[
    Todo(
      title: "패스트 캠퍼스 강의 듣기",
      memo: "앱개발 입문 강의 듣기",
      color: Colors.redAccent.value,
      done:0,
      category: "공부",
      date: 20240123
    ),
    Todo(
        title: "패스트 캠퍼스 강의 듣기",
        memo: "앱개발 입문 강의 듣기",
        color: Colors.blue.value,
        done:0,
        category: "공부",
        date: 20240123
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child:AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx){
          if(idx == 0){
            return Container(
              child: Text("오늘 하루", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            );
          } else if(idx == 1){
            return Container(
              child: Column(
                children: List.generate(todos.length, (_idx) {
                  Todo t = todos[_idx];
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(t.color!),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(t.title!, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                          Text(t.done == 0 ? "미완료" : "완료", style: TextStyle(color: Colors.white,),),
                        ],
                      ),
                       Container(height: 8,),
                       Text(t.memo!, style: TextStyle(color: Colors.white,),),
                    ],),
                  );
                }),
              ),
            );
          }
        },
        itemCount: 4,
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: "오늘"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined),label:"기록"),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz),label:"더보기"),
        ],
      ),

    );
  }
}
