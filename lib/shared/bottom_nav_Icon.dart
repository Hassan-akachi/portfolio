import 'package:flutter/material.dart';
import 'package:portfolio/model/portfolio_app_data.dart';

class BottomNavIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String tooltip;
  final PortfolioAppData app;
  final bool isDesktop;

  const BottomNavIcon({
    super.key,
    required this.onPressed,
    required this.tooltip,
    required this.app,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed, // 👈 make it clickable
        borderRadius: BorderRadius.circular(8),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: isDesktop ? 60 : 40,
            height: isDesktop ? 60 : 40,
            decoration: BoxDecoration(
              color: Theme.of(context).iconTheme.color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildIconOrImage(isDesktop ? 30 : 20,context),
          ),
        ),
      ),
    );
  }

  /// 🔹 Show `app.image` if available, else fallback to icon
  Widget _buildIconOrImage(double size,BuildContext context) {
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
}
