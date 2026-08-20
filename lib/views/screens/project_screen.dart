import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/launcher_utils.dart';
import '../../models/portfolio_models.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key, required this.project});

  final Project project;

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final shots = project.screenshots.isNotEmpty
        ? project.screenshots
        : [project.image];
    final isPhone = project.screenshots.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.ink,
      appBar: AppBar(
        title: Text(
          project.title,
          style: const TextStyle(
            fontFamily: AppTheme.sans,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: AppColors.ink3,
            height: isPhone ? 460 : 240,
            child: PageView.builder(
              itemCount: shots.length,
              onPageChanged: (i) => setState(() => _page = i),
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    isPhone ? 56 : 0,
                    isPhone ? 20 : 0,
                    isPhone ? 56 : 0,
                    isPhone ? 12 : 0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(isPhone ? 18 : 0),
                    child: Image.asset(
                      shots[i],
                      fit: isPhone ? BoxFit.contain : BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          if (shots.length > 1)
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(shots.length, (i) {
                  final on = i == _page;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: on ? 16 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: on
                          ? AppColors.brass
                          : AppColors.fog.withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(99),
                    ),
                  );
                }),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    if (project.icon != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(project.icon!, width: 22, height: 22),
                      ),
                    _Meta(project.tech),
                    _Meta(project.role),
                    _Meta(project.stores),
                    if (project.downloads != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.brass.withValues(alpha: 0.16),
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          project.downloads!,
                          style: const TextStyle(
                            fontFamily: AppTheme.sans,
                            color: AppColors.brass2,
                            fontSize: 11,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(project.title, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 10),
                Text(project.summary, style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 18),
                ...project.points.map(
                  (point) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Icon(Icons.circle, size: 6, color: AppColors.brass),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            point,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (project.playUrl != null) ...[
                  const SizedBox(height: 18),
                  FilledButton.icon(
                    onPressed: () => openUrl(project.playUrl!),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.brass,
                      foregroundColor: AppColors.ink,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                    ),
                    icon: const Icon(Icons.shop_outlined, size: 18),
                    label: const Text('VIEW ON GOOGLE PLAY'),
                  ),
                ],
              ],
            ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontFamily: AppTheme.sans,
        color: AppColors.fog,
        fontSize: 11,
        letterSpacing: 1.1,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
