class Urls {
  static const String BASE_URL = "https://movie.douban.com";

  /// 电影分类
  static const String SEARCH_MOVIE_TAGS = "/j/search_tags?type=movie&source=index";

  /// 电视剧分类
  static const String SEARCH_TV_TAGS = "/j/search_tags?type=tv&source=index";

  ///  type=tv&tag=%E7%83%AD%E9%97%A8&page_limit=50&page_start=0
  ///  /j/search_subjects?type=movie&tag=热门&page_limit=50&page_start=0  豆瓣高分
  static const String SEARCH_SUBJECTS = "/j/search_subjects?type=movie&tag=热门&page_limit=50&page_start=0";


}
