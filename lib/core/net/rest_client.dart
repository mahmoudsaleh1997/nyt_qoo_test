import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../modules/top_stories/model/response/search_articles_list_response.dart';
import '../../modules/top_stories/model/response/top_stories_list_response.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://api.nytimes.com/svc/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('topstories/v2/{section}.json')
  Future<TopStoriesListModel> getTopStories(
    @Path('section') String section,
  );

  @GET( 'search/v2/articlesearch.json')
  Future<SearchArticlesListModel> search(
      @Query('q') String keyword,
      @Query('persons') String person,
      @Query('headline') String headline,
      @Query('page') int pageNumber,
      );
}
