import 'package:flutter/material.dart';
import '../../models/project.dart';
import 'project_detail_page.dart' deferred as detail;

Future<void> openProjectDetail(BuildContext context, Project project) async {
  await detail.loadLibrary();
  if (!context.mounted) return;
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => detail.ProjectDetailPage(project: project),
    ),
  );
}
