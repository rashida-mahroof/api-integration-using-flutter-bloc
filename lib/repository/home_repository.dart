import 'package:dio/dio.dart';

class HomeRepository{
   static Future<String> fetchRandomAPI() async{
    try {
      final Response response = await Dio(BaseOptions()).get('https://www.boredapi.com/api/activity');
      if(response.statusCode == 200 || response.statusCode == 201){
       
        print(response);
        //  return response.data.toString();
        return response.data["activity"];
      }else{
        throw Exception();
      }
    
    } catch (_) {
       throw Exception();
    }
  }
}