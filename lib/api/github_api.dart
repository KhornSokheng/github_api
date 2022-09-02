
import 'package:github_api/models/git_hub_user.dart';
import 'package:http/http.dart' as http;



class GitHubApi {

  Future<List<GitHubUser>> getUser() async{
    var url = Uri.https('api.github.com', 'users');

    var response = await http.get(url);

    if(response.statusCode == 200){
      final gitHubUser = GitHubUserFromJson(response.body);
      return gitHubUser;
    }else {
      print('Request failed with status: ${response.statusCode}.');
      return List.empty();
    }

  }

  Future<void> getRepository(String username) async{
    var url = Uri.https('api.github.com', 'users/$username/repos');
    var response = await http.get(url);
    if(response.statusCode == 200){
      print('get repo');
      print(response.body);

    }
  }
}