import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:nyt_qoo_test/core/ui/dialogs.dart';
import 'package:nyt_qoo_test/modules/top_stories/model/response/top_stories_list_response.dart';
import 'package:nyt_qoo_test/modules/top_stories/presentation/articles_search_screen.dart';
import 'package:nyt_qoo_test/modules/top_stories/presentation/top_stories_details_screen.dart';
import '../../../core/net/network_checker.dart';
import '../../../core/system_enum/view_cards_enum.dart';
import '../../../core/ui/snack_bars.dart';
import '../model/article_details_model.dart';
import '../services/top_stories_list_service.dart';
import '../presentation/top_stories_list_state.dart';

class TopStoriesListController extends GetxController {
  final _service = TopStoriesListService();
  Rx<TopStoriesListState> pageState = TopStoriesListState.initial.obs;
  late BuildContext pageContext;
  ViewCardsEnum viewCardsEnum = ViewCardsEnum.listView;

  TopStoriesListModel? topStoriesListModel;
  TextEditingController searchController = TextEditingController();

  List<TopStoryItem> topStories = [];
  String selectedSection = 'home';
  List<String> sections = [
    'home',
    "arts",
    "automobiles",
    "books",
    "business",
    "fashion",
    "food",
    "health",
    "insider",
    "magazine",
    "movies",
    "nyregion",
    "obituaries",
    "opinion",
    "politics",
    "realestate",
    "science",
    "sports",
    "sundayreview",
    "technology",
    "theater",
    "t-magazine",
    "travel",
    "upshot",
    "us",
    "world"
  ];

  final _networkConnectivity = Connectivity();
  final NetworkChecker networkChecker = NetworkChecker.instance;
  ConnectivityResult? lastConnectivityResult;

  @override
  void onInit() {
    createNetworkStatusListener();
    super.onInit();
  }

  @override
  void onReady() async {
    getStories(
      selectedSection,
    );
    super.onReady();
  }

  onListViewTapped() {
    if (viewCardsEnum == ViewCardsEnum.gridView) {
      viewCardsEnum = ViewCardsEnum.listView;
      update();
    }
  }

  onGridViewTapped() {
    if (viewCardsEnum == ViewCardsEnum.listView) {
      viewCardsEnum = ViewCardsEnum.gridView;
      update();
    }
  }

  onFilterChanged(String? newSection) {
    if (newSection == null) return;
    if (newSection != selectedSection) {
      selectedSection = newSection;
      getStories(selectedSection);
      update();
    }
  }

  onCardTapped(int index) {
    ArticleDetailsModel articleDetailsModel = ArticleDetailsModel(index: index, abstract: topStories[index].abstract, title: topStories[index].title, byLine: topStories[index].byline, imageUrl: getLargeImageOfStory(index), webUrl: topStories[index].url);
    Get.toNamed(TopStoriesDetailsScreen.routeName,
        arguments: articleDetailsModel);
  }

  /// api calls
  getStories(
    String section,
  ) async {
    pageState(TopStoriesListState.loading);
    update();
    await _service.getTopStories(selectedSection).then((response) {
      print('aaaa');
      if (response.success) {
        topStoriesListModel = response.response;
        topStories = topStoriesListModel!.results;
      } else {
        if (response.dioError != null) {
          if (response.dioError!.error is SocketException) {
            AppDialogs.noInternetDialog(() {
              getStories(selectedSection);
              Get.back();
            });
          } else {
            AppSnackBars.showErrorSnackBar(
                title: 'Error While Fetch Data',
                description: response.dioError!.response!.statusMessage ??
                    'Unknown Error');
          }
        }
      }
    });
    pageState(TopStoriesListState.initial);
    update();
  }

  getSmallImageOfStory(int index) {
    Multimedia? multimedia = topStories[index].multimedia.firstWhereOrNull(
          (element) => element.format == 'threeByTwoSmallAt2X',
        );
    if (multimedia != null) {
      return multimedia.url;
    }
    return null;
  }


  getLargeImageOfStory(int index) {
    Multimedia? multimedia = topStories[index].multimedia.firstWhereOrNull(
          (element) => element.format == 'Super Jumbo',
    );
    if (multimedia != null) {
      return multimedia.url;
    }
    return null;
  }

  createNetworkStatusListener() async {
    _networkConnectivity.onConnectivityChanged.listen((result) async {
      print(result);
      switch (result) {
        case ConnectivityResult.bluetooth:
        case ConnectivityResult.wifi:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.mobile:
          bool isOnline = await networkChecker.checkStatus(result);
          if (!isOnline) {
            AppSnackBars.showNoInternetSnackBar();
            lastConnectivityResult = result;
          } else {
            if (lastConnectivityResult != null) {
              if (Get.isSnackbarOpen) {
                Get.back();
                AppSnackBars.showConnectionRestoredSnackBar();
              }
            }
          }
          break;
        case ConnectivityResult.none:
          AppSnackBars.showNoInternetSnackBar();
          lastConnectivityResult = result;
          break;
        case ConnectivityResult.vpn:
          // TODO: Handle this case.
          break;

        case ConnectivityResult.other:
          // TODO: Handle this case.
          break;
      }
    });
  }

  /// search
  onSearchSubmit() {
    if (searchController.text.isNotEmpty) {
      Get.toNamed(ArticlesSearchScreen.routeName, arguments: searchController.text);
    }
  }
}
