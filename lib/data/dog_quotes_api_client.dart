import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod/riverpod.dart';

part 'dog_quotes_api_client.g.dart';

final apiClient = Provider(((ref) => DogQuotesApiClient(Dio())));

//kako injectati base url kroz provider
@RestApi(baseUrl: 'https://dog-api.kinduff.com/api')
abstract class DogQuotesApiClient {
  factory DogQuotesApiClient(Dio dio, {String baseUrl}) = _DogQuotesApiClient;

  @GET('/facts')
  Future<FactsResponse> getFacts();
}

//anotacija za build runner - build runner zbog ovog kuzi kaj treba generirat
@JsonSerializable()
//posebna klasa
class FactsResponse {
  final List<String> facts;

  FactsResponse(this.facts);

  factory FactsResponse.fromJson(Map<String, dynamic> json) =>
      _$FactsResponseFromJson(json);
}
