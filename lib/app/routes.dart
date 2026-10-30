import 'package:flutter/material.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';

import '../features/cart/presentation/screens/cart_screen.dart';
import '../features/category/presentation/screens/category_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/auth/presentation/screens/verify_otp.dart';
import '../features/products/presentation/screens/product_details_screen.dart';
import '../features/products/presentation/screens/product_list_by_category.dart';
import '../features/reviews/presentation/screens/add_review_screen.dart';
import '../features/reviews/presentation/screens/review_screen.dart';
import '../features/shared/presentation/screens/main_nav_holder_screen.dart';
import '../features/wishlist/presentation/screens/wishlist_screen.dart';

class AppRoutes {
  static MaterialPageRoute<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget widget = SizedBox();

    switch (settings.name) {
      case SplashScreen.name:
        widget = SplashScreen();
        break;

      case SignInScreen.name:
        widget = SignInScreen();
        break;

      case SignUpScreen.name:
        widget = SignUpScreen();
        break;

      case HomeScreen.name:
        widget = HomeScreen();
        break;

      case VerifyOTP.name:
        widget = VerifyOTP();
        break;

      case MainNavHolderScreen.name:
        widget = MainNavHolderScreen();
        break;

      case CategoryScreen.name:
        widget = CategoryScreen();
        break;

      case ProductListByCategory.name:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widget = ProductListByCategory(
          categoryId: args["categoryId"],
          categoryName: args["categoryName"],
        );
        break;

      case CartScreen.name:
        widget = CartScreen();
        break;

      case WishlistScreen.name:
        widget = WishlistScreen();
        break;
      case ProductDetailsScreen.name:
        final String productId = settings.arguments as String;
        widget = ProductDetailsScreen(productId: productId);
        break;

      case ReviewScreen.name:
        widget = ReviewScreen();
        break;

      case AddReviewScreen.name:
        widget = AddReviewScreen();
        break;

      default:
        widget = SplashScreen();
    }
    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
