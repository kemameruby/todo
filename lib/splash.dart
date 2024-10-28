import 'package:flutter/material.dart';
import 'package:post/buttom_nav.dart';

class Splash extends StatefulWidget {
 final ThemeMode mode;
  const Splash({super.key, required this.mode});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
 
    super.initState();
    Future.delayed(const Duration(seconds: 5), (){
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return   MyWidget(mode:widget.mode);
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [ClipRRect (
        borderRadius: BorderRadius.circular(40),
        child: Image.asset('images/sketch-3-todo-list-app-icon-template.png', height: 200,width: 200, fit:BoxFit.cover ,)),
        const Text('Todo App', 
        style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold),)
      ],
    ),),);
  }
}