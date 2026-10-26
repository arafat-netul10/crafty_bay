import 'package:crafty_bay/features/shared/presentation/providers/main_nav_holder_provider.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  static const String name = "/wishlist";

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) => _backToHome(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Wishlist"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(
                child: ProductCard(),
              );
            },
          ),
        ),
      ),
    );
  }

  void _backToHome() {
    context.read<MainNavHolderProvider>().backToHome();
  }
}
