import 'package:flutter/material.dart';
import '../../data/sample_projects.dart';
import '../../models/project.dart';
import '../../shared/widgets/animated_project_card.dart';
import '../../shared/widgets/section_header.dart';
import '../projects/project_detail_page_deferred.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _Hero()),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 12, 24, 8),
            child: SectionHeader(
              title: 'Featured Projects',
              subtitle: 'Five Android-first case studies built to prove design, delivery, and performance.',
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(24),
          sliver: SliverLayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.crossAxisExtent;
              final cols = width >= 1200 ? 2 : 1;
              return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: sampleProjects.length,
                  (context, i) => AnimatedProjectCard(
                    project: sampleProjects[i],
                    onTap: () => openProjectDetail(context, sampleProjects[i]),
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisExtent: 360,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.28),
            Colors.transparent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Moe Kyaw Aung',
              style: TextStyle(fontSize: 58, fontWeight: FontWeight.w900, height: 1.0),
            ),
            const SizedBox(height: 12),
            const Text(
              'Senior Android Developer • Flutter Web Portfolio V2',
              style: TextStyle(fontSize: 20, color: Colors.white70),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 760,
              child: Text(
                'A premium portfolio built to convert recruiters fast: five projects, measurable impact, technical depth, and direct proof through code and store links.',
                style: TextStyle(fontSize: 18, color: Colors.white70, height: 1.5),
              ),
            ),
            const SizedBox(height: 22),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.work_outline),
                  label: const Text('View Projects'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: const Text('Download Resume'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
