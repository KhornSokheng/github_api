import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/github_api.dart';
import '../../models/git_hub_account.dart';
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
        builder: (BuildContext context, AsyncSnapshot<List<GitHubAccount>> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);

          }


          var acount_list = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children:
              acount_list!.map((account) => Center(
                  child: AccountCard(account: account,)
              )).toList()
              ,
            ),
          );


          // snapshot.data?.map((e) => Text("Hi"));

        },
      ),
    );
  }
}
