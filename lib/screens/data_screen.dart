import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/users_provider.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UsersProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Gelen datalar')),
          body: Center(
            child: FutureBuilder(
              future: provider.getUserList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var userList = snapshot.data!;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      var user = userList[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: ListTile(
                          tileColor: Colors.green.shade200,
                          title: Text(user.name),
                          subtitle: Text(user.website),
                          leading: CircleAvatar(
                            backgroundColor: Colors.green.shade500,
                            child: Text(
                              user.id.toString(),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: userList.length,
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
