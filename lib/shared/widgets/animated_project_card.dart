import 'package:flutter/material.dart';
import '../../models/project.dart';

class AnimatedProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback onTap;

  const AnimatedProjectCard({
    super.key,
    required this.project,
    required this.onTap,
  });

  @override
  State<AnimatedProjectCard> createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<AnimatedProjectCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 180),
        scale: hovered ? 1.02 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: hovered ? 0.32 : 0.18),
                blurRadius: hovered ? 28 : 16,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeroStrip(project: widget.project),
                  const SizedBox(height: 16),
                  Text(widget.project.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  Text(widget.project.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.techStack.take(4).map((t) => Chip(label: Text(t))).toList(),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: widget.project.metrics.take(2).map((m) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(m.value, style: const TextStyle(fontWeight: FontWeight.w800)),
                            Text(m.label, style: const TextStyle(fontSize: 12, color: Colors.white70)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroStrip extends StatelessWidget {
  final Project project;

  const _HeroStrip({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.9),
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.8),
          ],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(project.category, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
