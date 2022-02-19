import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:twochoices_flutter/Info.dart';
import 'Models/qtemp.dart';
import 'Models/question.dart';
import 'package:path_provider/path_provider.dart';

import 'history.dart';
import 'home.dart';
late Box box;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(QuestionAdapter());
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  box = await Hive.openBox("questionBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QTemp(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Main(),
      ),
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}
class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(icon: Icon(Icons.home),
        text: 'Home'),
    Tab(icon: Icon(Icons.history),
        text: 'History'),
    Tab(icon: Icon(Icons.public),
        text: 'World'),

  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: TabBar(
        tabs: tabs,
        controller: _tabController,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.purple,
         indicatorWeight: 3,
         indicatorPadding: EdgeInsets.symmetric(horizontal: 18.0,
             vertical: 8),
        labelColor: Colors.black,
      ),
        body: TabBarView(
          controller: _tabController,
          children:[
            Home(),
            History(),
            World()
          ]
        )
    );
  }
}




class World extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Text("World");
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}


