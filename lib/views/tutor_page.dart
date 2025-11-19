import 'package:flutter/material.dart';

class TutorPage extends StatefulWidget {

  const TutorPage({Key? key}) : super(key: key);

  @override
  State<TutorPage> createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text('Tutor Page', style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Text('Nome: ${args["name"]}'),
          Text('Email: ${args["email"]}'),
          Text('Telefone: ${args["phone"]}'),
        ],
      ),
    );
  }
}
