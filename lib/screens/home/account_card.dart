import 'package:flutter/material.dart';
import 'package:github_api/models/git_hub_user.dart';
import 'package:github_api/screens/repository/repository_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AccountCard extends StatelessWidget {

  GitHubUser user;
  AccountCard({required this.user});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery. of(context). size. width ;

    return InkWell(
      hoverColor: Colors.blue[500]!.withOpacity(0.5),
      onTap: () {},

      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {

          return RepositoryPage( user: user,);
        })),

        child: Container(
          height: 230,
          // color: Colors.deepOrange,
          margin: EdgeInsets.symmetric(vertical: 5),
          width: width,
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 15,
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
              ),
              Positioned(
                top: 45,
                left: width>600 ? width*1/3 : 200,
                child: Container(
                  width: width>500 ? width*0.5 : 150,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AutoSizeText(
                        user.login!,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,

                        ),
                      ),
                      Divider(color: Colors.blueGrey,
                        height: 40,
                      ),
                      AutoSizeText(user.htmlUrl!,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            // fontSize: 16
                        ),
                      ),

                    ],
                  ),
              ))
            ],
          )
        ),
      ),
    );
  }
}
