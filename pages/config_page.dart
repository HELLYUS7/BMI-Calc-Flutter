import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/app_theme.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  int _corApp = AppThemeController.instance.numberColor;

  Widget a(int index){
    Color color;
    if(index == 0){
      color = Colors.purple;
    }
    else if(index == 1){
      color = Colors.blue;
    }
    else if(index == 2){
      color = Colors.green;
    }
    else if(index == 3){
      color = Colors.red;
    }
    else{
      color = Colors.yellow;
    }
    return Radio(
      activeColor: color,
      value: index, 
      groupValue: AppThemeController.instance.numberColor, 
      onChanged: (int? value){
        if(value != null) {
          setState(() {
            _corApp = value;
            AppThemeController.instance.changeColor(color, index);
          });
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Configurações'),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor.withOpacity(0.2)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Modo Dark:',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                  Switch(
                    value: AppThemeController.instance.themeDark, 
                    onChanged: ((value) => AppThemeController.instance.changeTheme())
                  )
                ]
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor.withOpacity(0.2)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Cor do App:',
                  style: TextStyle(
                    fontSize: 20
                  ),),
                  Row(
                    children: [0,1,2,3,4].map((index) => a(index)).toList()
                  )
                ]
              ),
            ),
          ),
          const SizedBox(height: 60),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Made by',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary
                  ),),
                  Text('Gabriel P.',
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.onPrimaryContainer
                  ),)
                ],
              ),
            ))
        ],
      )
    );
  }
}