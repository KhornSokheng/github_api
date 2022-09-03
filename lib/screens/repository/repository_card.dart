import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:github_api/models/repository.dart';

class RepositoryCard extends StatelessWidget {

  Repository respository;
  RepositoryCard({required this.respository});


  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 8,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15,15,0,10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                respository.name!,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AutoSizeText(
                respository.htmlUrl!,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ]
        ),
      ),
    );
  }
}
