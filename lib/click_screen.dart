import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post/model/model.dart';

class ClickScreen extends StatelessWidget {
 final  Model? todo;
  
  const ClickScreen({Key? key, required this.todo}) :super(key: key);


  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail View')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Title: ${todo?.title ?? ''}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('Completed: ${todo?.completed?? true ? "Yes" : "No"}', style: const TextStyle(fontSize: 18)),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}