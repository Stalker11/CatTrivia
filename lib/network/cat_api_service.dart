import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/cat_fact.dart';

part 'cat_api_service.g.dart';

@RestApi(baseUrl: 'https://catfact.ninja')
abstract class CatApiService {
  factory CatApiService(Dio dio, {String baseUrl}) = _CatApiService;

  @GET('/facts')
  Future<CatFactsResponse> getRandomCatFact();
}