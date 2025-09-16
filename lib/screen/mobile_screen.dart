import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/screen/stack_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../model/portfolio_app_data.dart';
import '../shared/bottom_nav_Icon.dart';
import '../shared/build_app_icon.dart';
import '../shared/data.dart';


class MobileScreen extends ConsumerStatefulWidget {
  const MobileScreen({super.key});

  @override
  ConsumerState<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends ConsumerState<MobileScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    const appsPerPage = 8;
    final totalPages = (portfolioApps.length / appsPerPage).ceil();

    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark;

    // Handle app reordering
    void _handleAppReorder(PortfolioAppData target, PortfolioAppData source) {
      setState(() {
        final sourceIndex = portfolioApps.indexOf(source);
        final targetIndex = portfolioApps.indexOf(target);

        if (sourceIndex != -1 && targetIndex != -1) {
          portfolioApps.removeAt(sourceIndex);
          portfolioApps.insert(targetIndex, source);
        }
      });
    }


    return SafeArea(
      child: Column(
        children: [
          // 🔹 App icons with page view
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemCount: totalPages,
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * appsPerPage;
                final endIndex = (startIndex + appsPerPage).clamp(0, portfolioApps.length);
                final pageApps = portfolioApps.sublist(startIndex, endIndex);

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: pageApps.length,
                    itemBuilder: (context, index) {
                      return BuildAppIcon(
                        app: pageApps[index],
                        isDesktop: false,
                        onReorder:  (source, target) {   // 👈 pass callback correctly
                        _handleAppReorder(target, source);
                      },
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // 🔹 Page indicators
          if (totalPages > 1)
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  totalPages,
                      (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == currentPage
                          ? isDark ? Colors.white : Colors.black
                          :  Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),

          // 🔹 Three static icons at the bottom
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                BottomNavIcon(
                  app: bottomNavIcons[0],
                  tooltip: 'View GitHub Profile',
                  isDesktop: false,
                  onPressed: () async {
                    final uri =
                    Uri.parse("https://github.com/Hassan-akachi");
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                ),

                const SizedBox(width: 15),

                // Contact button
                BottomNavIcon(
                  app: bottomNavIcons[1],
                  tooltip: 'Contact me',
                  isDesktop: false,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Contact Me"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.phone),
                              title: const Text("+2348161653200"),
                              onTap: () async {
                                final uri = Uri(
                                  scheme: 'tel',
                                  path: '+2348161653200',
                                );
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                                }
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.email),
                              title: const Text("hassansorunke@gmail.com"),
                              onTap: () async {
                                final uri = Uri(
                                  scheme: 'mailto',
                                  path: 'hassansorunke@gmail.com',
                                  query: 'subject=Hello Hassan&body=Hi, I would like to contact you.',
                                );
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),


                const SizedBox(width: 15),

                // Tech stack button
                BottomNavIcon(
                  app: bottomNavIcons[2],
                  tooltip: 'View Tech Stack',
                  isDesktop: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StacksScreen(),
                      ),
                    );
                  },
                ),

                const SizedBox(width: 15),

                // Theme toggle button
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white : Colors.black, // black bg in light mode
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () =>
                        ref.read(themeProvider.notifier).toggleTheme(),
                    icon: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      color: isDark ? Colors.black : Colors.white, // always white on black bg
                    ),
                    tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
