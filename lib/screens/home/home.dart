import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/github_api.dart';
import '../../models/git_hub_user.dart';
import 'account_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  GitHubApi api_instance = GitHubApi();

  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,

      ),
      body: FutureBuilder(
        future: api_instance.getUser(),
        builder: (BuildContext context, AsyncSnapshot<List<GitHubUser>> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);

          }

          var user_list = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children:
              user_list!.map((user) => Center(
                  child: AccountCard(user: user,)
              )).toList()
              ,
            ),
          );
        },
      ),
    );
  }
}
