import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      // body: FutureBuilder(
      //   future: api_instance.getRepository(widget.user.login!),
      //   builder: (BuildContext context, AsyncSnapshot<List<GitHubAccount>> snapshot) {
      //
      //   },
      // ),
    );
  }
}
