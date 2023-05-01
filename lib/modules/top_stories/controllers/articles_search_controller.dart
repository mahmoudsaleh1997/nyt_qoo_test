import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nyt_qoo_test/core/constants.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/ui/dialogs.dart';
import '../../../core/ui/snack_bars.dart';
import '../model/article_details_model.dart';
import '../model/response/search_articles_list_response.dart';
import '../presentation/top_stories_details_screen.dart';
import '../services/articles_search_service.dart';
import '../presentation/articles_search_state.dart';

class ArticlesSearchController extends GetxController {
  final _service = ArticlesSearchService();
  Rx<ArticlesSearchState> pageState = ArticlesSearchState.initial.obs;
  late BuildContext pageContext;
  TextEditingController searchFieldController = TextEditingController();

  RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  int pageNumber = 0;

  SearchArticlesListModel? searchArticlesListModel;

  List<SearchResultItem> searchResults = [];

  @override
  void onInit() {

    searchFieldController.text = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() async {
    search();
    super.onReady();
  }

  search() async {
    pageState(ArticlesSearchState.loading);
    update();
    await _service
        .search(searchFieldController.text, pageNumber)
        .then((response) {
      print('aaaa');
      if (response.success) {
        searchArticlesListModel = response.response;
        searchResults = searchArticlesListModel!.response.docs;
      } else {
        if (response.dioError != null) {
          if (response.dioError!.error is SocketException) {
            AppDialogs.noInternetDialog(() {
              search();
              Get.back();
            });
          } else {
            print(response.dioError!.type);
            AppSnackBars.showErrorSnackBar(
                title: 'Error While Fetch Data',
                description: response.dioError!.response?.statusMessage ??
                    'Unknown Error');
          }
        }
      }
    });
    pageState(ArticlesSearchState.initial);
    update();
  }

  loadMore() async {
    if (searchArticlesListModel!.response.meta.hits > searchResults.length) {
      pageNumber++;
      update();
      await _service
          .search(searchFieldController.text, pageNumber)
          .then((response) {
        print('aaaa');
        if (response.success) {
          searchArticlesListModel = response.response;
          searchResults.addAll(searchArticlesListModel!.response.docs);
          print(searchResults.length);
          refreshController.loadComplete();
          update();
          if (searchArticlesListModel!.response.docs.isEmpty) {
            refreshController.loadNoData();
          }
        } else {
          if (response.dioError != null) {
            if (response.dioError!.error is SocketException) {
              AppDialogs.noInternetDialog(() {
                search();
                Get.back();
              });
            } else {
              print(response.dioError!.type);
              AppSnackBars.showErrorSnackBar(
                  title: 'Error While Fetch Data',
                  description: response.dioError!.response?.statusMessage ??
                      'Unknown Error');
            }
            refreshController.loadFailed();
          }
        }
      });
      update();
    }
  }

  getImage(int index) {
    if (searchResults[index].multimedia.isEmpty) {
      return null;
    }
    return AppConstants.baseImageUrl +
        searchResults[index].multimedia.first.url!;
  }

  getHeadLine(int index) {
    if (searchResults[index].headline.main == null) {
      return 'No Title Available';
    }
    return searchResults[index].headline.main;
  }

  onCardTapped(int index) {
    ArticleDetailsModel articleDetailsModel = ArticleDetailsModel(
        index: index,
        abstract: searchResults[index].docAbstract,
        title: getHeadLine(index),
        byLine: searchResults[index].byline.original,
        imageUrl: getImage(index),
        webUrl: searchResults[index].webUrl);
    Get.toNamed(TopStoriesDetailsScreen.routeName,
        arguments: articleDetailsModel);
  }
}
