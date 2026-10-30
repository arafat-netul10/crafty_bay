class Urls {
  Urls._();

  static const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';

  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String signInUrl = '$_baseUrl/auth/signin';
  static const String homeSliderListUrl = '$_baseUrl/ListProductSlider';
  static const String categoryListUrl = '$_baseUrl/CategoryList';

  static String verifyEmailUrl(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtpUrl(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String productListByCategoryUrl(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';
  static String productListByRemarkUrl(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';
  static String productDetailsUrl(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
}
