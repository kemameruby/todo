import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:post/settings.dart';
import 'package:post/splash.dart';
import 'package:post/stor.dart';
import 'package:provider/provider.dart';



void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
Hive.init(dir.path);
await Hive.openBox('Glow');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    String? themeValue;

  @override
  void initState() {
    super.initState();
   
   themeValue = box.get('theme') ?? 'ThemeMode.system'; 
  }
  @override
  Widget build(BuildContext context) {
 //String value =   box.get('theme');
 print('this is value $themeValue');
 ThemeMode themeMode;

    if (themeValue == 'ThemeMode.dark') {
     // setState((){
       themeMode = ThemeMode.dark;
    //  });
    } else if (themeValue == 'ThemeMode.light') {
   // setState((){
        themeMode = ThemeMode.light;
    // });
    } else {
      themeMode = ThemeMode.system; 
    }
  return  ChangeNotifierProvider(
    create: (BuildContext context) { 
      return ScreenTheme();
     },
    child: Consumer<ScreenTheme>(
      builder: (context, val, _) {
        print('ode ${val.mode}');
        return MaterialApp( 
        
            themeMode: val.mode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
        
          title: 'Todo List App',
          home: Splash(mode: themeMode),
        );
      }
    ),
  );
  }
}


