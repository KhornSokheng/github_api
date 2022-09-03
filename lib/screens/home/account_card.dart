import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_api/models/git_hub_user.dart';
import 'package:github_api/screens/repository/repository_page.dart';

class AccountCard extends StatelessWidget {
  // const AccountCard({Key? key}) : super(key: key);

  GitHubUser user;
  AccountCard({required this.user});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {

        return RepositoryPage( user: user,);
      })),

      child: Container(
        height: 230,
        // color: Colors.deepOrange,
        margin: EdgeInsets.symmetric(vertical: 5),
        width: width,
        // padding: EdgeInsets.all(8),
        // margin: EdgeInsets.all(8),
        // decoration: BoxDecoration(
        //   color: Colors.green[200],
        //   borderRadius: BorderRadius.circular(16),
        // ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 15,
              // right: width*0.1,
              bottom: 15,
              child: Material(
                child: Container(

                  height: 190,
                  width: width,
                  decoration: BoxDecoration(

                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0.2),
                    boxShadow: [ BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(-10, 10),
                        blurRadius: 20,
                        spreadRadius: 4
                    )],

                  ),

                ),

            )),
            Positioned(
              top: 0,
              left: width*0.05,
              child: Card(
                elevation: 10,
                shadowColor: Colors.grey.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(user.avatarUrl!)
                    )
                  ),
                ),
              )
            )
          ],
        )
      ),
    );
  }
}
