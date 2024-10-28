import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:post/click_screen.dart';
import 'package:post/model/model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:translator/translator.dart';

class TodoListScreen extends StatefulWidget{
  const TodoListScreen({super.key});

 @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State {
  List todos = ['','',''];

final translator = GoogleTranslator();
Future<List<Model?>?> getData () async{
  var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  print(response.body);
  if(response.statusCode == 200){
    //fetcchData = jsonDecode();
    List<dynamic> data = jsonDecode(response.body);
    List<Model> uses = data.map((e)=>Model.fromJson(json: e)).toList();
    print(uses);
   return uses;
  }else{
    return null;
  }
}
Future<String> tras (String text) async{
  final slot = await translator.translate( text,);
  final tc = slot.text;
  return tc;

}
@override
  void initState() {
getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       // backgroundColor: const Color.fromARGB(110, 114, 95, 95),
        appBar: AppBar(backgroundColor: Colors.black12,
          title: const Text(
            'Todo List',
             style: TextStyle(),
             ), 
          ), 
          body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState ==  ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
              
              return Skeletonizer(
                enabled: snapshot.connectionState == ConnectionState.waiting,
                child: ListView.builder(
                itemCount:snapshot.data?.length ?? 0,
                itemBuilder:(context,index) {
                  final val = snapshot.data![index];
                  tras(val?.title ?? '');
                 // print('the text ${te.}');                       

                 return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClickScreen(todo:val),
                    ),
                  );  
                },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Column(verticalDirection: VerticalDirection.down,
                        children: [
                        const SizedBox(width: 30, height:10,),
                        Container(
                          height: 70,
                            width: double.infinity,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), 
                          color: Colors.white,
                        ),
                
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: val?.completed ?? false, onChanged: (bool? newValue) {
                               setState(() {
                                 val?.completed = newValue ?? false;
                               });
                              },
                             ),
                
                              FutureBuilder(
                                future: tras(val?.title ?? ''),
                                builder: (context, sn) {
                                  return SizedBox(
                                    width: 250,
                                    child: Text(sn.data?? '', 
                                    softWrap: true,
                                    style: const TextStyle(color: Colors.black, 
                                    fontSize: 18, 
                                    ),
                                    ),
                                  );
                                }
                              ),
                              const SizedBox(width: 20,),
                               Expanded(
                                 child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.end,
                                   children: [
                                     const Text('',
                                      style: TextStyle(color: Colors.black, 
                                      fontSize: 15, 
                                     ),),
                                        Text( '${val?.id ?? ''}, ${val?.userId ?? ''}',
                                  style: const TextStyle(color: Colors.black, 
                                    fontSize: 15, 
                                  ),
                                 ),
                                   ],
                                 ),
                               ),
                            
                              
                            ],
                          ),
                        ),
                        )
                             
                        ],
                      ),
                    ),
                  );
                }
                ),
              );
            }
         }
       ),  
     );
  }
}