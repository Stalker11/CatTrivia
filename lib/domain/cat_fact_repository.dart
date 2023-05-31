import 'package:cat_trivia/domain/%D1%81at_fact_adapter.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../models/cat_fact.dart';
import '../network/cat_api_service.dart';

class CatFactRepository {
  late Box<CatFactsResponse> _factBox;
  late CatApiService _apiService;

  Future<void> initialize() async {
    final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
   /* Hive.registerAdapter(CatFactAdapter());
    Hive.registerAdapter(PageLinkAdapter());
    Hive.registerAdapter(CatFactsResponseAdapter());*/
    _factBox = await Hive.openBox<CatFactsResponse>('cat_fact_response');
    _apiService = CatApiService(Dio());
  }

  Future<CatFactsResponse> getRandomFact() async {
    final fact = await _apiService.getRandomCatFact();
    _factBox.add(fact);
    return fact;
  }

  List<CatFactsResponse> getFactHistory() {
    return _factBox.values.toList();
  }
}