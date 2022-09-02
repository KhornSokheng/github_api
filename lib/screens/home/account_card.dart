import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_api/models/git_hub_account.dart';

class AccountCard extends StatelessWidget {
  // const AccountCard({Key? key}) : super(key: key);

  GitHubAccount account;
  AccountCard({required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 1250,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      // decoration: BoxDecoration(
      //   color: Colors.green[200],
      //   borderRadius: BorderRadius.circular(16),
      // ),
      child: Card(
        shadowColor: Colors.orange,
        elevation: 8,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AspectRatio(

              aspectRatio: 4/3,
              child: Ink.image(
                image: NetworkImage(account.avatarUrl!),

                // colorFilter: widget.activity.reached ? ColorFilters.identity
                //     : ColorFilters.greyscale,
                // height: 500,
                // width: 500,
                // fit: BoxFit.cover,
                fit: BoxFit.fill,
                child: InkWell(
                  hoverColor: Colors.grey[100]!.withOpacity(0.5),
                  onTap: () {},
                ), // InkWell
              ),
            ),
            Text(account.login!),

            Text(account.htmlUrl!)

          ],
        ),


      ),
    );
  }
}
