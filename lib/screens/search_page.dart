import 'package:flutter/material.dart';
import 'package:weather_application/component/textfield_component.dart';
import 'package:weather_application/screens/accounts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:const Text('Search a City',
        style: TextStyle(
          fontSize: 22
        ),
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,bottom: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const Accounts();
                    }));
                  },
                  child:const Text('Accounts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ],
            ),
          ),
          const TextFieldComponent(),
        ],
      ),
    );
  }
}