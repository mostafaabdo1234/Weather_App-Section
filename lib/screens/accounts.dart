import 'package:flutter/material.dart';
import 'package:weather_application/dbHelper.dart';

class Accounts extends StatelessWidget {
  const Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      body: FutureBuilder(
          future: DbHelper().getUsers(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(children: [
                          Text(
                            "Email: ${snapshot.data![index].usrName}",
                          ),
                          Text(
                              "Password: ${snapshot.data![index].usrPassword}"),
                        ]),
                      ),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })),
    );
  }
}