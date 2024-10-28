import 'package:flutter/material.dart';
import 'package:post/main.dart';
import 'package:post/stor.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
 
  const Settings({super.key});
  
  @override
  State<StatefulWidget> createState() => _SettingsState();
  }
  
  class _SettingsState extends State<Settings> {
  
    List<String> categories = ['work', 'pesonal', 'urgent',];
   //  String value =   box.get('theme');
    Map<String,Color> categoryColors = {
      'Work': Colors.blue,
      'Personal': Colors.green,
      'Urgent': Colors.red,
    };

    // String selectedTheme = 'Light';
    ThemeMode selectedTheme = ThemeMode.light;
 // List<String> themes = ['Light', 'Dark', 'System'];
//  List<ThemeMode> themes = [ThemeMode.dark, ThemeMode.light, ThemeMode.system];
  String selectedTaskType = 'General';
  List<String> taskTypes = ['General', 'Important', 'Deadline'];

// @override
// void initState() {
//   super.initState();
//   String savedTheme = box.get('theme');
//       if (savedTheme == 'ThemeMode.dark') {
//       selectedTheme = ThemeMode.dark;
//     } else if (savedTheme == 'ThemeMode.light') {
//       selectedTheme = ThemeMode.light;
//     } else {
//       selectedTheme = ThemeMode.system; 
//     }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text('Settings'), automaticallyImplyLeading: false,),
      body:  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Theme:', style: Theme.of(context).textTheme.headlineSmall),
                DropdownButton<ThemeMode>(
                  value: selectedTheme,
                  items: ThemeMode.values.map((theme) {
                    return DropdownMenuItem<ThemeMode>(
                      value: theme,
                      child: Text(theme.toString().split('.').last),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTheme = value ?? ThemeMode.dark;
                      box.put('theme', selectedTheme.toString());
                    });
                    context.read<ScreenTheme>().theme(selectedTheme);
                  },
                ),
                const SizedBox(height: 20),
                Text('Select Category:', style: Theme.of(context).textTheme.headlineSmall),
                ...categories.map((category) {
                  return ListTile(
                    title: Text(category),
                    leading: CircleAvatar(
                      backgroundColor: categoryColors[category],
                    ),
                    onTap: () {},
                    
                  );
                }),
                const SizedBox(height: 20),
                Text('Select Task Type:', style: Theme.of(context).textTheme.headlineSmall),
                DropdownButton<String>(
                  value: selectedTaskType,
                  items: taskTypes.map((taskType) {
                    return DropdownMenuItem<String>(
                      value: taskType,
                      child: Text(taskType),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTaskType = value!;
                    });
                  },
                ),
              ],
            ),
          )
        
     
    );
  }
}
  

  class ScreenTheme extends ChangeNotifier{
    final ThemeMode? _mode;
  ThemeMode get mode => _mode?? ThemeM;
     theme(ThemeMode mod){

        mod = _mode;
        print('state ${_mode}');
notifyListeners();
    }
  }