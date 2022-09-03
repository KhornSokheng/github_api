import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_api/models/repository.dart';
import 'package:github_api/screens/repository/repository_card.dart';
import 'package:github_api/screens/repository/user_detail_card.dart';

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
    double width = MediaQuery. of(context). size. width ;
    int crossAxisCount = (width<500) ? 1 : (width<800) ? 2 : 4;

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
            child: Center(
              child: Column(
                children: [
                  UserDetailCard(user: widget.user),
                  Container(
                    width: width*0.8,
                    height: 900,
                    child: GridView.count(

                      crossAxisCount: crossAxisCount,


                      childAspectRatio: 4/3,
                      padding: const EdgeInsets.all(4.0),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      children:
                      // [Container(color: Colors.blueGrey,),Container(color: Colors.blue,)]
                      repositories!.map((repository) => RepositoryCard(respository: repository,)).toList()
                      ,
                    ),
                  ),
                ],
              ),
            ),
          );

        },
      ),
    );
  }
}
