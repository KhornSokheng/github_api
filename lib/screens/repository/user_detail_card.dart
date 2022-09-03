import 'package:flutter/material.dart';
import 'package:github_api/api/github_api.dart';
import 'package:github_api/models/git_hub_user.dart';
import 'package:github_api/screens/repository/repository_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UserDetailCard extends StatefulWidget {

  GitHubUser user;
  UserDetailCard({required this.user});

  @override
  State<UserDetailCard> createState() => _UserDetailCardState();
}

class _UserDetailCardState extends State<UserDetailCard> {


  // late Future<int> num_repos;
  var num_repos = 30;

  // void setNumberOf() async{
  //   GitHubApi api_instance = GitHubApi();
  //   // num_repos = (await api_instance.getNumRepository(widget.user.login!)) as Future<int>;
  //   // print("Num: $num_repos");
  //
  // }

  @override
  void initState() {
    super.initState();
    // setNumberOf();

  }

  Widget build(BuildContext context) {

    double width = MediaQuery. of(context). size. width ;




    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {

        return RepositoryPage( user: widget.user,);
      })),

      child: Container(
          height: 230,
          // color: Colors.deepOrange,
          margin: EdgeInsets.symmetric(vertical: 5),
          width: width*0.8,
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
                              image: NetworkImage(widget.user.avatarUrl!)
                          )
                      ),
                    ),
                  )
              ),
              Positioned(
                  top: 45,
                  left: width>600 ? width*1/3 : 200,
                  child: Container(
                    // color: Colors.amberAccent,
                    width: width>500 ? width*0.4 : width*0.3,
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          widget.user.login!,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,

                          ),
                        ),
                        Divider(color: Colors.blueGrey,
                          height: 20,
                        ),
                        AutoSizeText("$num_repos Repositories ",
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            // fontSize: 16
                          ),
                        ),

                        AutoSizeText("2 Followers",
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            // fontSize: 16
                          ),
                        ),

                        AutoSizeText("5 Following",
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            // fontSize: 16
                          ),
                        ),

                        AutoSizeText(widget.user.htmlUrl!,
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
    );
  }
}
