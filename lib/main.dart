
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/screen/desktop_screen.dart';
import 'package:portfolio/screen/mobile_screen.dart';
import 'package:portfolio/shared/live_info_bar.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;


// Main entry point
void main() { WidgetsFlutterBinding.ensureInitialized();
  runApp(

    const ProviderScope(
      child: PortfolioApp(),
    ),
  );
}

// Main app widget
class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Hassan Akachi Portfolio',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const PortfolioHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Theme provider for state management
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
      (ref) => ThemeNotifier(),
);

// Theme notifier class
class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

// App theme definitions
class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}

// Main home page widget
class PortfolioHomePage extends ConsumerStatefulWidget {
  const PortfolioHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends ConsumerState<PortfolioHomePage> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final isDesktop = _isDesktop(context);

    return Scaffold(
      body: Column(
        children: [


          // Live information bar (time, date, weather)
          LiveInfoBar(),

          // Main content area
          Expanded(
            child: isDesktop
                ? DesktopScreen()
                : MobileScreen(),
          ),

        ],
      ),
    );
  }

  // Check if current platform is desktop
  bool _isDesktop(BuildContext context) {
    if (kIsWeb) {
      return MediaQuery
          .of(context)
          .size
          .width > 768;
    }
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }


}



