import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_api/models/repository.dart';
import 'package:github_api/screens/repository/repository_card.dart';

import '../../api/github_api.dart';
import '../../models/git_hub_user.dart';

class RepositoryPage extends StatefulWidget {
  // const RepositoryPage({Key? key}) : super(key: key);

  GitHubUser user;
  RepositoryPage({required this.user});

  @override
  State<RepositoryPage> createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {
  @override

  GitHubApi api_instance = GitHubApi();

  Widget build(BuildContext context) {
    api_instance.getRepository(widget.user.login!);

    return Scaffold(
      appBar:AppBar(
        title: Text("Repository"),
        centerTitle: true,

      ),
      body: FutureBuilder(
        future: api_instance.getRepository(widget.user.login!),
        builder: (BuildContext context, AsyncSnapshot<List<Repository>> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);

          }

          var repositories = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 150,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(widget.user.login!),
                ),
                Column(
                  children:
                  repositories!.map((repository) => Center(
                      child: RepositoryCard(respository: repository,)
                  )).toList()
                  ,
                ),
              ],
            ),
          );

        },
      ),
    );
  }
}
