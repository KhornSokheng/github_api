
import 'package:github_api/models/git_hub_account.dart';
import 'package:http/http.dart' as http;



class GitHubApi {
  Future<List<GitHubAccount>> getUser() async{
    var url = Uri.https('api.github.com', 'users');

    var response = await http.get(url);

    if(response.statusCode == 200){
      final gitHubAccount = gitHubAccountFromJson(response.body);
      print(gitHubAccount);
      return gitHubAccount;
    }else {
      print('Request failed with status: ${response.statusCode}.');
      return List.empty();
    }

  }
}