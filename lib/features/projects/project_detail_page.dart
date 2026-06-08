import 'package:flutter/material.dart';
import '../../models/project.dart';
import '../../shared/utils/url_service.dart';
import '../../shared/widgets/metric_tile.dart';
import '../../shared/widgets/screenshot_carousel.dart';
import '../../shared/widgets/tech_stack_cloud.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(project.category, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(project.role, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 18),
          Text(project.challenge, style: const TextStyle(fontSize: 16, height: 1.5)),
          const SizedBox(height: 24),
          ScreenshotCarousel(screenshots: project.screenshots),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => UrlService.open(project.githubUrl),
                  icon: const Icon(Icons.code),
                  label: const Text('GitHub Repository'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => UrlService.open(project.playStoreUrl),
                  icon: const Icon(Icons.shop),
                  label: const Text('Play Store'),
                ),
              ),
            ],
          ),
          if (project.liveUrl != null) ...[
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => UrlService.open(project.liveUrl!),
              icon: const Icon(Icons.public),
              label: const Text('Live Demo'),
            ),
          ],
          const SizedBox(height: 28),
          const Text('Impact', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          Text(project.impact, style: const TextStyle(height: 1.5, color: Colors.white70)),
          const SizedBox(height: 22),
          const Text('Performance Metrics', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.35,
            children: project.metrics.map((m) => MetricTile(label: m.label, value: m.value)).toList(),
          ),
          const SizedBox(height: 22),
          const Text('Tech Stack', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          TechStackCloud(
            tags: project.techStack,
            onTapTag: (tag) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(tag),
                  content: Text('Used in this project and highlighted as part of Android-specific engineering depth.'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
