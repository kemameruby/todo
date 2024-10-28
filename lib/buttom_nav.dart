import 'package:flutter/material.dart';
import 'package:post/settings.dart';
import 'package:post/todo_screen.dart';

class MyWidget extends StatefulWidget {
  final ThemeMode mode;
  const MyWidget({super.key, required this.mode});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
//     ThemeMode get mode => widget.mode;
//      theme(ThemeMode mod){
// setState(() {
//         mod = mode;
// });
//     }
  List<Widget> screens = [TodoListScreen(), Settings()];
  int currentIndex = 0;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 75, 54, 79),
        clipBehavior: Clip.antiAlias,
        splashColor: Colors.black12,
        
        onPressed: () {
          showDialog(
            context: context, 
            builder: (BuildContext context) {
              final TextEditingController todoController = TextEditingController();
            return AlertDialog(
              title: const Text('Add New Todo'),
              content: TextField(
                controller:todoController,
                decoration: const InputDecoration(hintText: 'Enter todo'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, 
                  child: const Text('Cancel'),
                  ),
                  TextButton(onPressed: (){}, child: const Text('Add'))
              ],
            );
          }
         );
       },
       child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
       child: BottomNavigationBar(
        backgroundColor: Colors.black12,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(color: Color.fromARGB(255, 75, 54, 79), size:40, Icons.home),
          label: 'Home'
          
          ),
           BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(color: Color.fromARGB(255, 75, 54, 79), size:40, Icons.settings),
            label: 'Settings'
            ),
          ],
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.black,
        ),
      )
    );
  }
}































//       extendBody: true,
//       floatingActionButton: FloatingActionButton(
//         onPressed:(){},
//         child: const Icon(Icons.add),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           height: 60,
//           color: Colors.black12,
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 5,
//           child: Row(
//             mainAxisAlignment:MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.max,
//             children:<Widget> [
//               IconButton(
//                 icon:const Icon(Icons.search),
//                 onPressed: () {}, 
//                 ),
//             ],
//           ),
//         ),
//     );
//   }
// }




























































     