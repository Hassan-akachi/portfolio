import 'package:flutter/material.dart';

class LiveInfoBar extends StatefulWidget {
  const LiveInfoBar({super.key});

  @override
  State<LiveInfoBar> createState() => _LiveInfoBarState();
}

class _LiveInfoBarState extends State<LiveInfoBar> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Row(
        // Use MainAxisAlignment.spaceBetween to push items to the ends
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
        isDesktop ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          // This empty Spacer pushes the time/date to the center
          if (isDesktop) const Spacer(),

          // Time + Date
          StreamBuilder<DateTime>(
            stream: Stream.periodic(
              const Duration(seconds: 1),
                  (_) => DateTime.now(),
            ),
            builder: (context, snapshot) {
              final now = snapshot.data ?? DateTime.now();
              final time =
                  '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
              final date = '${now.day}/${now.month}/${now.year}';

              // In desktop mode, the time and date are in a Row, centered.
              // In mobile mode, they are in a Column, aligned to the start.
              return isDesktop
                  ? Row(
                // MainAxisAlignment.center centers the children within this Row
                // which is inside the flexible space created by the Spacers.
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    date,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            },
          ),

          // This Spacer pushes the time/date to the center
          if (isDesktop) const Spacer(),

          // Weather placeholder
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.wb_sunny, size: 16),
              SizedBox(width: 4),
              Text(
                '25°C',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}