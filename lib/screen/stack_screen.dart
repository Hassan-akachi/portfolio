// Stacks screen to display skills
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../shared/data.dart';

class StacksScreen extends StatelessWidget {
  const StacksScreen({Key? key}) : super(key: key);

  // Helper method to determine cross axis count based on screen width
  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth >= 1200) {
      return 4; // Desktop - 4 columns
    } else if (screenWidth >= 800) {
      return 3; // Laptop/Tablet - 3 columns
    } else if (screenWidth >= 600) {
      return 2; // Large mobile - 2 columns
    } else {
      return 1; // Small mobile - 1 column
    }
  }

  // Helper method to determine aspect ratio based on screen width
  double _getChildAspectRatio(double screenWidth) {
    if (screenWidth >= 1200) {
      return 3.5; // Desktop - wider cards
    } else if (screenWidth >= 800) {
      return 3.2; // Laptop/Tablet
    } else if (screenWidth >= 600) {
      return 3.0; // Large mobile
    } else {
      return 4.0; // Small mobile - even wider for single column
    }
  }

  // Helper method to determine icon size based on screen width
  double _getIconSize(double screenWidth) {
    if (screenWidth >= 1200) {
      return 40; // Desktop - larger icons
    } else if (screenWidth >= 800) {
      return 36; // Laptop/Tablet
    } else {
      return 32; // Mobile
    }
  }

  // Helper method to determine font sizes based on screen width
  Map<String, double> _getFontSizes(double screenWidth) {
    if (screenWidth >= 1200) {
      return {'title': 18, 'subtitle': 14}; // Desktop
    } else if (screenWidth >= 800) {
      return {'title': 17, 'subtitle': 13}; // Laptop/Tablet
    } else {
      return {'title': 16, 'subtitle': 12}; // Mobile
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tech Stack & Skills')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final crossAxisCount = _getCrossAxisCount(screenWidth);
          final childAspectRatio = _getChildAspectRatio(screenWidth);
          final iconSize = _getIconSize(screenWidth);
          final fontSizes = _getFontSizes(screenWidth);

          return Padding(
            padding: EdgeInsets.all(screenWidth >= 800 ? 24 : 16),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                crossAxisSpacing: screenWidth >= 800 ? 20 : 16,
                mainAxisSpacing: screenWidth >= 800 ? 20 : 16,
              ),
              itemCount: techStacks.length,
              itemBuilder: (context, index) {
                final stack = techStacks[index];
                return Card(
                  elevation: screenWidth >= 800 ? 4 : 2,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth >= 800 ? 20 : 16),
                    child: Row(
                      children: [
                        // Using CachedNetworkImage instead of Icon
                        CachedNetworkImage(
                          imageUrl: stack.imageUrl, // Assuming stack has imageUrl property
                          width: iconSize,
                          height: iconSize,
                          placeholder: (context, url) => SizedBox(
                            width: iconSize,
                            height: iconSize,
                            child: const CircularProgressIndicator(strokeWidth: 2),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error_outline,
                            size: iconSize,
                            color: Colors.grey,
                          ),
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: screenWidth >= 800 ? 16 : 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                stack.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSizes['title'],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: screenWidth >= 800 ? 4 : 2),
                              Text(
                                stack.category,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: fontSizes['subtitle'],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}