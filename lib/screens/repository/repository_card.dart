import 'package:flutter/material.dart';
import 'package:github_api/models/repository.dart';

class RepositoryCard extends StatelessWidget {
  // const RepositoryCard({Key? key}) : super(key: key);

  Repository respository;
  RepositoryCard({required this.respository});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 150,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              respository.name!,
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Divider(color: Colors.black,),
            SizedBox(
              height: 10,
            ),
            Text(respository.htmlUrl!)
          ]
      ),
    );
  }
}
