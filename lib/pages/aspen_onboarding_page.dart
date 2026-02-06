import 'package:flutter/material.dart';

class AspenOnboardingPage extends StatelessWidget {
  const AspenOnboardingPage({super.key, required this.onGetStarted});

  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          const _AspenBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    'Aspen',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Plan your next adventure.\nDiscover places you’ll love.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          height: 1.2,
                          color: Colors.white.withValues(alpha: 0.92),
                        ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: onGetStarted,
                      child: const Text(
                        'Explore Aspen',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AspenBackground extends StatelessWidget {
  const _AspenBackground();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2A77FF),
            Color(0xFF6C4DFF),
            Color(0xFF111827),
          ],
          stops: [0.0, 0.55, 1.0],
        ),
      ),
      child: Stack(
        children: const [
          Positioned(
            left: -80,
            top: -50,
            child: _GlowCircle(size: 220, color: Color(0x66FFFFFF)),
          ),
          Positioned(
            right: -60,
            top: 140,
            child: _GlowCircle(size: 180, color: Color(0x55BFD6FF)),
          ),
          Positioned(
            left: -30,
            bottom: 110,
            child: _GlowCircle(size: 160, color: Color(0x44FFC6E7)),
          ),
          Align(
            alignment: Alignment(0.85, -0.72),
            child: _MountainMark(),
          ),
        ],
      ),
    );
  }
}

class _GlowCircle extends StatelessWidget {
  const _GlowCircle({required this.size, required this.color});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            blurRadius: 60,
            spreadRadius: 20,
            color: color,
          ),
        ],
      ),
    );
  }
}

class _MountainMark extends StatelessWidget {
  const _MountainMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: const Icon(Icons.landscape_rounded, color: Colors.white, size: 64),
    );
  }
}


