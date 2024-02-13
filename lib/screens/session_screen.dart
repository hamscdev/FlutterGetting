import 'package:flutter/material.dart';
import 'package:flutterprojects/data/shared_preference_helper.dart';
import 'package:flutterprojects/shared/bottom_navigation_bar.dart';
import '../data/models/session.dart';
import '../shared/menu_drawer.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SharedPreferencesHelper sphelper = SharedPreferencesHelper();
  List<Session> sessios = [];

  @override
  void initState() {
    sphelper.init().then((value){
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Training Session')),
      drawer: MenuDrawer(),
      bottomNavigationBar: MyBottonNavigationBar(),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showSessionDialog(context);
          },
          child: const Icon(Icons.add)),
    );
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    int id = sphelper.getCounter() + 1;
    String today = '${now.year}-${now.month}-${now.day}';

    Session newSession = Session(
        id, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    sphelper.writeSession(newSession).then((_) {
      updateScreen();
      sphelper.setCounter();
    });
    txtDuration.text = '';
    txtDescription.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessios.forEach((session) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_){
          sphelper.deleteSession(session.id).then((value){ updateScreen();});
        },
        child: ListTile(
          title: Text('Event: ${session.description}'),
          subtitle: Text('Date: ${session.date}     Duration: ${session.duration} min'),
        ),
      ));
    });
    return tiles;
  }

  void updateScreen(){
    sessios = sphelper.getSessions();
    setState(() {
      
    });
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Insert Training Session'),
            content: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                    controller: txtDescription,
                    decoration: InputDecoration(hintText: 'Description')),
                TextField(
                    controller: txtDuration,
                    decoration: InputDecoration(hintText: 'Duration'))
              ],
            )),
            actions: [
              TextButton(
                onPressed: () {
                  txtDescription.text = '';
                  txtDuration.text = '';
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(onPressed: saveSession, child: Text('Save'))
            ],
          );
        });
  }
}
