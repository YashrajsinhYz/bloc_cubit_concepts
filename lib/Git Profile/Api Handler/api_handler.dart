import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/profile.dart';

part 'api_handler.g.dart';

@RestApi(baseUrl: "https://api.github.com")
abstract class ApiHandler {
  factory ApiHandler(Dio dio) = _ApiHandler;

  @GET("/users/{userName}")
  Future<Profile> getProfileInfo(@Path("userName") String userName);
}
