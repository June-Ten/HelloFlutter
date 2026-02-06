import 'package:flutter/material.dart';

import 'models/destination.dart';
import 'pages/aspen_detail_page.dart';
import 'pages/aspen_home_page.dart';
import 'pages/aspen_onboarding_page.dart';

void main() {
  runApp(const AspenApp());
}

class AspenApp extends StatelessWidget {
  const AspenApp({super.key});

  static const routeOnboarding = '/';
  static const routeHome = '/home';
  static const routeDetail = '/detail';

  static const _destinations = <Destination>[
    Destination(
      id: 'maroon-bells',
      title: 'Maroon Bells',
      location: 'Aspen, Colorado',
      rating: 4.9,
      pricePerNight: 199,
      description:
          'Maroon Bells is one of the most photographed spots in North America. Enjoy crisp air, hiking trails, and postcard views—perfect for a day trip or a sunset walk.',
      tags: ['Nature', 'Hiking', 'Lakes', 'Views'],
    ),
    Destination(
      id: 'aspen-mountain',
      title: 'Aspen Mountain',
      location: 'Downtown Aspen',
      rating: 4.7,
      pricePerNight: 249,
      description:
          'Ride the gondola for sweeping alpine panoramas, then explore restaurants and scenic overlooks. Winter brings world-class skiing; summer is all about hiking and fresh mountain breezes.',
      tags: ['Ski', 'Gondola', 'Mountains', 'Adventure'],
    ),
    Destination(
      id: 'independence-pass',
      title: 'Independence Pass',
      location: 'Highway 82',
      rating: 4.8,
      pricePerNight: 159,
      description:
          'A legendary drive with dramatic switchbacks and overlooks. Stop for photos, short trails, and wildflowers—especially stunning during golden hour.',
      tags: ['Scenic Drive', 'Lookouts', 'Photography'],
    ),
    Destination(
      id: 'snowmass-village',
      title: 'Snowmass Village',
      location: 'Snowmass, CO',
      rating: 4.6,
      pricePerNight: 219,
      description:
          'A cozy base with trails, family-friendly activities, and a lively village vibe. Great for longer stays and relaxed exploration.',
      tags: ['Village', 'Family', 'Trails', 'Relax'],
    ),
    Destination(
      id: 'aspen-art-museum',
      title: 'Aspen Art Museum',
      location: 'Aspen, CO',
      rating: 4.4,
      pricePerNight: 129,
      description:
          'A modern space with rotating exhibitions and architecture worth seeing on its own. Great for a slower afternoon between outdoor adventures.',
      tags: ['Museum', 'Culture', 'Design'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aspen Travel',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2A77FF)),
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        inputDecorationTheme: const InputDecorationTheme(isDense: true),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case routeOnboarding:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (context) => AspenOnboardingPage(
                onGetStarted: () =>
                    Navigator.of(context).pushReplacementNamed(routeHome),
              ),
            );
          case routeHome:
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (context) => AspenHomePage(
                destinations: _destinations,
                onOpenDestination: (d) =>
                    Navigator.of(context).pushNamed(routeDetail, arguments: d),
              ),
            );
          case routeDetail:
            final destination = settings.arguments;
            if (destination is! Destination) {
              return MaterialPageRoute<void>(
                settings: settings,
                builder: (context) => const Scaffold(
                  body: Center(child: Text('Missing destination')),
                ),
              );
            }
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (context) => AspenDetailPage(destination: destination),
            );
        }
        return null;
      },
    );
  }
}
