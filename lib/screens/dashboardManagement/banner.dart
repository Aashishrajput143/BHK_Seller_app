import 'package:bhk_seller_app/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerCarousel extends StatelessWidget {
  BannerCarousel({super.key});

  final CarouselSliderController _controller = CarouselSliderController();
  final List<BannerItem> bannerItems = [
    BannerItem(
      imagePath: AppImages.bhkbackground,
      title: 'HAND MADE GIFTS',
      subtitle: '23-28 December',
      discount: 'UP TO 50-60% OFF',
    ),
    BannerItem(
      imagePath: AppImages.bhkbackground,
      title: 'BIGGEST SAVINGS ONLY HERE',
      subtitle: '23-28 December',
      discount: 'UP TO 80% OFF',
    ),
    BannerItem(
      imagePath: AppImages.bhkbackground,
      title: 'JEWELLERY & ACCESSORIES',
      subtitle: '23-28 December',
      discount: 'UP TO 60-70% OFF',
    ),
    BannerItem(
      imagePath: AppImages.bhkbackground,
      title: 'HOME DECOR & MORE',
      subtitle: '23-28 December',
      discount: 'UP TO 60-70% OFF',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Column(
      children: [
        CarouselSlider(
          items: bannerItems
              .map((item) => SizedBox(
                    width: double.infinity,
                    height: 220.0, // Adjust height as per your design
                    child: BannerCard(item: item),
                  ))
              .toList(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true, // Enables auto sliding
            autoPlayInterval:
                const Duration(seconds: 3), // Slide every 3 seconds
            height: 200,
            enlargeCenterPage: true,
            viewportFraction: 1.035,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              currentIndex = index;
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bannerItems.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 20.0,
                height: 5.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(currentIndex == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class BannerItem {
  final String imagePath;
  final String title;
  final String subtitle;
  final String discount;

  BannerItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.discount,
  });
}

class BannerCard extends StatelessWidget {
  final BannerItem item;

  const BannerCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(
                205, 93, 46, 23), // Background color for the banner
            //color: Colors.black54,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          height: 170, // Adjust height as per your design
          child: Row(
            children: [
              // Image on the Left Side
              Container(
                width: 130, // Adjust width as needed
                height:
                    double.infinity, // Fill the entire height of the container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                  image: DecorationImage(
                    image: AssetImage(item.imagePath), // Image asset
                    fit: BoxFit.cover,
                    opacity: 0.7,
                  ),
                ),
              ),

              // Space between the image and content
              const SizedBox(width: 5),

              // Content on the Right Side
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title
                      Flexible(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 3),

                      // Subtitle
                      Flexible(
                        child: Text(
                          item.subtitle,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Discount Text
                      Flexible(
                        child: Text(
                          item.discount,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // "Shop Now" Button
                      ElevatedButton(
                        onPressed: () {
                          // Define your button action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 177, 87, 59),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 8.0), // Button background color
                          foregroundColor: Colors.white, // Button text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        child: const Text(
                          'SHOP NOW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
