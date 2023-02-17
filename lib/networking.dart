import 'package:task3/constanfile.dart';
import 'package:task3/modeluser.dart';
import 'package:http/http.dart' as http;

class NetworkProvider{

  Future<ModelUser?> getDataUser() async{
    var response = await http.get(Uri.parse(ConstanFile.url));
    ModelUser listData = modelUserFromJson(response.body);
    return listData;

  }

}