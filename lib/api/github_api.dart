
import 'package:github_api/models/git_hub_user.dart';
import 'package:github_api/models/repository.dart';
import 'package:http/http.dart' as http;



class GitHubApi {

  Future<List<GitHubUser>> getUser() async{
    var url = Uri.https('api.github.com', 'users');

    var response = await http.get(url);

    if(response.statusCode == 200){
      final gitHubUser = gitHubUserFromJson(response.body);
      return gitHubUser;
    }else {
      print('Request failed with status: ${response.statusCode}.');
      return List.empty();
    }

  }

  Future<List<Repository>> getRepository(String username) async{
    var url = Uri.https('api.github.com', 'users/$username/repos');
    var response = await http.get(url);
    if(response.statusCode == 200){
      final repositories = repositoryFromJson(response.body);
      return repositories;

    }else {
      print('Request failed with status: ${response.statusCode}.');
      return List.empty();
    }
  }
}