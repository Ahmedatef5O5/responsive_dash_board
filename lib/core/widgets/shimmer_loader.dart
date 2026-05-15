import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmerLoader extends StatelessWidget {
  const DashboardShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? const Color(0xff2a2a2a) : const Color(0xffe0e0e0),
      highlightColor:
          isDark ? const Color(0xff3a3a3a) : const Color(0xfff5f5f5),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header skeleton
            _ShimmerBox(width: 200, height: 24),
            const SizedBox(height: 24),

            // Cards row skeleton
            Row(
              children: [
                Expanded(child: _ShimmerBox(height: 120)),
                const SizedBox(width: 16),
                Expanded(child: _ShimmerBox(height: 120)),
              ],
            ),
            const SizedBox(height: 24),

            // Chart skeleton
            _ShimmerBox(height: 200),
            const SizedBox(height: 24),

            // List items skeleton
            ...List.generate(
              3,
              (_) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    _ShimmerBox(width: 48, height: 48, isCircle: true),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ShimmerBox(width: 140, height: 14),
                          const SizedBox(height: 8),
                          _ShimmerBox(width: 90, height: 12),
                        ],
                      ),
                    ),
                    _ShimmerBox(width: 70, height: 14),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  final double? width;
  final double height;
  final bool isCircle;

  const _ShimmerBox({this.width, required this.height, this.isCircle = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            isCircle
                ? BorderRadius.circular(height / 2)
                : BorderRadius.circular(12),
      ),
    );
  }
}
