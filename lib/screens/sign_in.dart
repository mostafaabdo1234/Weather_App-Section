import 'package:flutter/material.dart';
import 'package:weather_application/screens/search_page.dart';
import 'package:weather_application/screens/sign_up.dart';
import '../component/row_component.dart';
import '../dbHelper.dart';
import '../model/user_model.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({super.key});
  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/images/rainy.png',
                height: 120,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Weather',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'field require';
                  }
                  return null;
                },
                controller: username,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  hintStyle:const TextStyle(color: Colors.white),
                  prefixIcon:const Icon(Icons.email),
                  prefixIconColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:const BorderSide(color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'field require';
                  }
                  return null;
                },
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle:const TextStyle(color: Colors.white),
                  prefixIcon:const Icon(Icons.password),
                  prefixIconColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:const BorderSide(color: Colors.white)),
                ),
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var response = await DbHelper().signin(Users(usrName: username.text, usrPassword: password.text));
                      if (response == true) {
                         // ignore: use_build_context_synchronously
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchPage()));
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('not found account , create account'),
                        ));
                      }
                    } else {}
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  )),
              const SizedBox(
                height: 10,
              ),
              RowComponent(
                status: 'don\'t have an account?',
                type: '  Sign Up',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignUp();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
