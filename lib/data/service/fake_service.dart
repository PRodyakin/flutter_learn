
import 'package:clean_arch_test/data/entity/user_dto.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
part 'fake_service.g.dart';

@RestApi(baseUrl: "https://230d58ab-7959-415f-8d2d-e7c6169fcfb3.mock.pstmn.io/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/get-status")
  Future<UserDto> getStatus();
}