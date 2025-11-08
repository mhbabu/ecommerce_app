class ApiConstants {
  static const String baseUrl = 'https://your-laravel-backend.com/api';

  // Auth
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String logout = '$baseUrl/logout';
  static const String userProfile = '$baseUrl/user/profile';

  // Products
  static const String allProducts = '$baseUrl/products';
  static String productDetails(int id) => '$baseUrl/products/$id';

  // Cart
  static const String cart = '$baseUrl/cart';
  static const String addToCart = '$baseUrl/cart/add';
  static const String removeFromCart = '$baseUrl/cart/remove';

  // Orders
  static const String createOrder = '$baseUrl/orders';
  static const String orderHistory = '$baseUrl/orders/history';

  // Misc
  static const String categories = '$baseUrl/categories';
}
