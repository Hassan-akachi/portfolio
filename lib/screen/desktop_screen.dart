import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/screen/stack_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../shared/bottom_nav_Icon.dart';
import '../shared/build_app_icon.dart';
import '../shared/data.dart';

class DesktopScreen extends ConsumerStatefulWidget {
  const DesktopScreen({super.key});

  @override
  ConsumerState<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends ConsumerState<DesktopScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _buildDesktopLayout(context)),
        _buildTaskBar(context, true),
      ],
    );
  }

  // 🔹 Desktop layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: portfolioApps.length,
        itemBuilder: (context, index) {
          return BuildAppIcon(
            app: portfolioApps[index],
            isDesktop: true,
          );
        },
      ),
    );
  }

  // 🔹 Custom Task Bar
  Widget _buildTaskBar(BuildContext context, bool isDesktop) {
    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark;

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Portfolio title
          Text(
            'Sorunke Hassan ',
            style: TextStyle(
              fontSize: isDesktop ? 24 : 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),

          // Task bar buttons
          Row(
            children: [
              // GitHub button
              BottomNavIcon(
                app: bottomNavIcons[0],
                tooltip: 'View GitHub Profile',
                isDesktop: true,
                onPressed: () async {
                  final uri =
                  Uri.parse('https://github.com/Hassan-akachi');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
              ),

              const SizedBox(width: 8),

              // Contact button
              BottomNavIcon(
                app: bottomNavIcons[1],
                tooltip: 'Contact me',
                isDesktop: true,
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
                                await launchUrl(uri);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),


              const SizedBox(width: 8),

              // Tech stack button
              BottomNavIcon(
                app: bottomNavIcons[2],
                tooltip: 'View Tech Stack',
                isDesktop: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StacksScreen(),
                    ),
                  );
                },
              ),
            ],
          ),

          // Theme toggle button
          IconButton(
            onPressed: () =>
                ref.read(themeProvider.notifier).toggleTheme(),
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            tooltip:
            isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
          ),
        ],
      ),
    );
  }
}
