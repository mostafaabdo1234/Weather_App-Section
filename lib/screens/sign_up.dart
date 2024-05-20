import 'package:flutter/material.dart';
import '../component/row_component.dart';
import '../dbHelper.dart';
import '../model/user_model.dart';
import 'sign_in.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController upController = TextEditingController();
  TextEditingController upController1 = TextEditingController();
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
                'Sign Up',
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
                    return 'field required';
                  }
                  return null;
                },
                controller: upController,
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
                    return 'field required';
                  }
                  return null;
                },
                controller: upController1,
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
                    try {
                      if (formKey.currentState!.validate()) {
                        await DbHelper().signup(Users(
                            usrName: upController.text,
                            usrPassword: upController1.text));
                        // ignore: use_build_context_synchronously
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      }
                    }  catch (e) {
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('attention email is unique, enter anther email'),
                        ));
                    }
                  },
                  child:const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  )),
              const SizedBox(
                height: 10,
              ),
              RowComponent(
                status: 'already have an account.',
                type: 'Sign In',
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
