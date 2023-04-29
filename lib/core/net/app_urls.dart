class APIUrls{
  static const BASE_URL = "https://4sale.elite-it-team.com";
  static const BASE_IMAGE_URL = "https://4sale.elite-it-team.com/uploads/";

  /// for api call , we define section like this:




  /// Commercial Ad
  static const getAllAds = "/api/ad/all"; // done
  static const getAdById = "/api/ad/get"; // done

  /// categories
  static const getMainCategories = "/api/category/getMain"; // done
  static const getAllCategory = "/api/category/getWithChild"; // done

  /// Posts
  static const createAutomotivePost = "/api/post/automotive"; // done
  static const createServicePost = "/api/post/service"; // done
  static const createBuyAndSellPost = "/api/post/buyAndSell"; // done
  static const createElectronicPost = "/api/post/electronic"; // done
  static const createJobPost = "/api/post/job"; // done
  static const createPropertyPost = "/api/post/property"; // done


  /// Media
  static const uploadMultiImages = "/api/media/uploadImages"; // done
  static const uploadCv = "/api/media/uploadCv"; // done
  static const uploadVideo = "/api/media/uploadVideo"; // done







}