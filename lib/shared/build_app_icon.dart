import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/portfolio_app_data.dart';
import '../screen/stack_screen.dart';

class BuildAppIcon extends StatelessWidget {
  final PortfolioAppData app;
  final bool isDesktop;
  final void Function(PortfolioAppData source, PortfolioAppData target)? onReorder;

  const BuildAppIcon({
    super.key,
    required this.app,
    this.isDesktop = false,
    this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    final double size = isDesktop ? 64 : 48;

    return LongPressDraggable<PortfolioAppData>(
      data: app,
      feedback: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: isDesktop ? 80 : 60,
          height: isDesktop ? 80 : 60,
          decoration: BoxDecoration(
            color: Theme.of(context).iconTheme.color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: _buildIconOrImage(isDesktop ? 40 : 30, context), // 👈 in feedback
        ),
      ),
      child: DragTarget<PortfolioAppData>(
        onWillAccept: (data) => true,
        onAccept: (data) {
          if (onReorder != null) onReorder!(data, app);
        },
        builder: (context, candidateData, rejectedData) {
          return GestureDetector(
            onTap: () => _handleAppTap(context, app),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: Theme.of(context).iconTheme.color,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: _buildIconOrImage(isDesktop ? 28 : 20, context), // 👈 in grid
                ),
                const SizedBox(height: 8),
                Text(
                  app.name,
                  style: TextStyle(
                    fontSize: isDesktop ? 12 : 10,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// 🔹 Helper: show `app.image` if available, otherwise fallback to icon
  Widget _buildIconOrImage(double size, BuildContext context) {
    if (app.image != null && app.image!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          app.image!,
          fit: BoxFit.cover,
          width: size,
          height: size,
        ),
      );
    } else {
      return Icon(
        app.icon,
        color: Theme.of(context).primaryColor,
        size: size,
      );
    }
  }

  // 📌 Handle app tap - show download/about options
  void _handleAppTap(BuildContext context, PortfolioAppData app) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(app.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Download'),
              onTap: () {
                Navigator.pop(context);
                if (app.downloadUrl != null) {
                  _launchURL(app.downloadUrl!);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                _launchURL(app.description);
                // _showAboutDialog(context, app);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context, PortfolioAppData app) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(app.name),
        content: Text(app.description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }


  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
