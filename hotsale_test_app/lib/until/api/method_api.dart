import 'package:hotsale_test_app/until/api/config_api.dart';
import 'package:http/http.dart' as http;

class ApiMethod {

  methodGet(request) async{

    var url = Uri.parse(END_POINT_URL + request);

    return await http.get(
      url,
      headers: headers
    );    
  }

}