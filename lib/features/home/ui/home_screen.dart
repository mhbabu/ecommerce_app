import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Bottom navigation pages
  final List<Widget> _pages = [
    const HomeTab(),
    const CategoriesTab(),
    const CartTab(),
    const ProfileTab(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
        backgroundColor: AppColors.bottomNavBackground,
        selectedItemColor: AppColors.bottomNavActive,
        unselectedItemColor: AppColors.bottomNavInactive,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

/// -----------------
/// Home Tab Example
/// -----------------
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'Big Banner',
                  style: AppTextStyles.bigTitle.copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Categories
            Text('Categories', style: AppTextStyles.mediumTitle),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, index) => Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: Text('Category ${index + 1}')),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Products
            Text('Products', style: AppTextStyles.mediumTitle),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (_, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image Placeholder
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: const Center(child: Icon(Icons.image, size: 50)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Product Name', style: AppTextStyles.smallTitle),
                          const SizedBox(height: 4),
                          Text(
                            '\$99.99',
                            style: AppTextStyles.mediumTitle.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// -----------------
/// Placeholder Tabs
/// -----------------
class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Categories Tab'));
  }
}

class CartTab extends StatelessWidget {
  const CartTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Cart Tab'));
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Tab'));
  }
}
