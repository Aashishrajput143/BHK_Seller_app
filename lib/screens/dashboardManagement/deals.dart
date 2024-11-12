import 'package:bhk_seller_app/resources/images.dart';
import 'package:flutter/material.dart';

class DealSaleScreen extends StatelessWidget {
  const DealSaleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Hot Deals',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(
                    122, 158, 86, 41), // Background color for each row
              ),
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              child: Wrap(
                spacing: 20,
                runSpacing: 12,
                children: [
                  _buildCategoryCard(
                    AppImages.product1,
                    'CRAFT SUPPLIES & TOOLS',
                  ),
                  _buildCategoryCard(
                    AppImages.product2,
                    'CRAFT SUPPLIES & TOOLS',
                  ),
                  _buildCategoryCard(
                    AppImages.product2,
                    'CRAFT SUPPLIES & TOOLS',
                  ),
                  _buildCategoryCard(
                    AppImages.product1,
                    'CRAFT SUPPLIES & TOOLS',
                  ),
                  _buildCategoryCard(
                    AppImages.product1,
                    'CRAFT SUPPLIES & TOOLS',
                  ),
                  _buildCategoryCard(
                    AppImages.product2,
                    'CRAFT SUPPLIES & TOOLS',
                  ),
                  _buildCategoryCard(
                    AppImages.product2,
                    'CRAFT SUPPLIES & TOOLS',
                  ),
                  _buildCategoryCard(
                    AppImages.product1,
                    'CRAFT SUPPLIES & TOOLS',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String imagePath, String title) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigate to category page
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                decoration: const BoxDecoration(
                  color: Colors.brown,
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
