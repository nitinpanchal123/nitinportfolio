import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_theme.dart';
import '../../core/utils/launcher_utils.dart';
import '../../models/portfolio_models.dart';
import '../../viewmodels/portfolio_viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _work = GlobalKey();
  final _experience = GlobalKey();
  final _skills = GlobalKey();
  final _about = GlobalKey();
  final _contact = GlobalKey();

  Future<void> _go(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 480),
      curve: Curves.easeOutCubic,
      alignment: 0.06,
    );
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 900;
    final profile = ref.watch(profileProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: AppColors.ink.withValues(alpha: 0.94),
            titleSpacing: 16,
            title: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.brass,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Text(
                    'N',
                    style: TextStyle(
                      fontFamily: AppTheme.display,
                      color: AppColors.ink,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    profile.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: AppTheme.sans,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.paper,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              if (wide) ...[
                _NavChip('Work', () => _go(_work)),
                _NavChip('Experience', () => _go(_experience)),
                _NavChip('Skills', () => _go(_skills)),
                _NavChip('About', () => _go(_about)),
                _NavChip('Contact', () => _go(_contact)),
              ],
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 4),
                child: FilledButton(
                  onPressed: openResume,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.brass,
                    foregroundColor: AppColors.ink,
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                  ),
                  child: const Text('RESUME'),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(child: _Hero(onWork: () => _go(_work))),
          SliverToBoxAdapter(child: KeyedSubtree(key: _work, child: const _Work())),
          SliverToBoxAdapter(
            child: KeyedSubtree(key: _experience, child: const _Experience()),
          ),
          SliverToBoxAdapter(child: KeyedSubtree(key: _skills, child: const _Skills())),
          SliverToBoxAdapter(child: KeyedSubtree(key: _about, child: const _About())),
          SliverToBoxAdapter(child: KeyedSubtree(key: _contact, child: const _Contact())),
          const SliverToBoxAdapter(child: _Footer()),
        ],
      ),
    );
  }
}

class _NavChip extends StatelessWidget {
  const _NavChip(this.label, this.onTap);
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.fog,
        textStyle: const TextStyle(
          fontFamily: AppTheme.sans,
          fontSize: 13,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(label),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({required this.child, this.padding = const EdgeInsets.fromLTRB(24, 20, 24, 8)});
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text, {this.light = false});
  final String text;
  final bool light;

  @override
  Widget build(BuildContext context) {
    final line = light ? const Color(0xFF8A6B32) : AppColors.brass;
    return Row(
      children: [
        Container(width: 22, height: 1, color: line),
        const SizedBox(width: 10),
        Text(
          text.toUpperCase(),
          style: TextStyle(
            fontFamily: AppTheme.sans,
            color: line,
            fontSize: 11,
            letterSpacing: 2.2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _Hero extends ConsumerWidget {
  const _Hero({required this.onWork});
  final VoidCallback onWork;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Page(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: LayoutBuilder(
        builder: (context, box) {
          final split = box.maxWidth >= 820;
          final copy = _HeroCopy(onWork: onWork, compact: !split);
          const shot = _HeroShot();
          if (!split) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [copy, const SizedBox(height: 22), shot],
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 5, child: copy),
              const SizedBox(width: 40),
              const Expanded(flex: 6, child: shot),
            ],
          );
        },
      ),
    );
  }
}

class _HeroCopy extends ConsumerWidget {
  const _HeroCopy({required this.onWork, required this.compact});
  final VoidCallback onWork;
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final titleSize = compact ? 56.0 : 72.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${profile.location}  ·  OPEN TO FLUTTER ROLES',
          style: const TextStyle(
            fontFamily: AppTheme.sans,
            color: AppColors.fog,
            fontSize: 11,
            letterSpacing: 1.6,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${profile.firstName}\n',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: titleSize),
              ),
              TextSpan(
                text: profile.lastName,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: titleSize,
                  fontStyle: FontStyle.italic,
                  color: AppColors.brass2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '${profile.title} shipping high-performance Android and iOS apps — from mill-floor production systems to consumer products with ${profile.downloads} downloads.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            FilledButton(
              onPressed: onWork,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.brass,
                foregroundColor: AppColors.ink,
              ),
              child: const Text('SELECTED WORK'),
            ),
            OutlinedButton(
              onPressed: () => openMail(email: profile.email, subject: 'Hello Nitin'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.paper,
                side: BorderSide(color: AppColors.paper.withValues(alpha: 0.18)),
              ),
              child: const Text('WRITE TO ME'),
            ),
            OutlinedButton(
              onPressed: () => openUrl(profile.linkedin),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.paper,
                side: BorderSide(color: AppColors.paper.withValues(alpha: 0.18)),
              ),
              child: const Text('LINKEDIN'),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroShot extends ConsumerWidget {
  const _HeroShot();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(statsProvider);
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/hero.jpg',
            height: 320,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, AppColors.ink.withValues(alpha: 0.88)],
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 12,
            child: Row(
              children: [
                for (final stat in stats)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stat.value,
                            style: const TextStyle(
                              fontFamily: AppTheme.display,
                              color: AppColors.paper,
                              fontSize: 26,
                            ),
                          ),
                          Text(
                            stat.label.toUpperCase(),
                            style: const TextStyle(
                              fontFamily: AppTheme.sans,
                              color: AppColors.fog,
                              fontSize: 9,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Work extends ConsumerWidget {
  const _Work();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    final extraProjects = ref.watch(extraProjectsProvider);

    final featured = projects.firstWhere((p) => p.featured);
    final rest = projects.where((p) => !p.featured).toList();

    return _Page(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('01 — Selected work'),
          const SizedBox(height: 10),
          Text('Apps people actually open.', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              'Live Play Store screenshots from the apps I shipped — plus the textile-mill system used on the shop floor every day.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 24),
          _ProjectCard(project: featured, tall: true),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, box) {
              final two = box.maxWidth >= 720;
              if (!two) {
                return Column(
                  children: [
                    for (final project in rest) ...[
                      _ProjectCard(project: project),
                      const SizedBox(height: 16),
                    ],
                  ],
                );
              }
              final gap = 16.0;
              final width = (box.maxWidth - gap) / 2;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (final project in rest)
                    SizedBox(width: width, child: _ProjectCard(project: project)),
                ],
              );
            },
          ),
          const SizedBox(height: 8),
          ...extraProjects.map((item) => _ExtraTile(item: item)),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project, this.tall = false});

  final Project project;
  final bool tall;

  @override
  Widget build(BuildContext context) {
    final phone = project.screenshots.isNotEmpty;
    return Material(
      color: AppColors.ink2,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          context.push('/project', extra: project);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
              child: phone
                  ? Container(
                      height: tall ? 300 : 250,
                      width: double.infinity,
                      color: AppColors.ink3,
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.fromLTRB(48, 18, 48, 0),
                      child: Image.asset(project.image, fit: BoxFit.contain),
                    )
                  : Image.asset(
                      project.image,
                      height: tall ? 240 : 190,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (project.icon != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(project.icon!, width: 18, height: 18),
                        ),
                        const SizedBox(width: 8),
                      ],
                      Flexible(
                        child: Text(
                          '${project.tech}  ·  ${project.stores}'.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: AppTheme.sans,
                            color: AppColors.fog,
                            fontSize: 11,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      if (project.downloads != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          project.downloads!,
                          style: const TextStyle(
                            fontFamily: AppTheme.sans,
                            color: AppColors.brass2,
                            fontSize: 11,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(project.title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 6),
                  Text(project.summary, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExtraTile extends StatelessWidget {
  const _ExtraTile({required this.item});
  final ExtraProject item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.playUrl == null ? null : () => openUrl(item.playUrl!),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            if (item.icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(item.icon!, width: 36, height: 36),
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 2),
                  Text(
                    item.meta.toUpperCase(),
                    style: const TextStyle(
                      fontFamily: AppTheme.sans,
                      color: AppColors.brass,
                      fontSize: 11,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(item.blurb, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            if (item.playUrl != null)
              const Icon(Icons.north_east, size: 16, color: AppColors.brass),
          ],
        ),
      ),
    );
  }
}

class _Experience extends ConsumerWidget {
  const _Experience();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experience = ref.watch(experienceProvider);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 36),
      color: AppColors.paper,
      child: _Page(
        padding: const EdgeInsets.fromLTRB(24, 48, 24, 52),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionLabel('02 — Experience', light: true),
            const SizedBox(height: 10),
            const Text(
              'Six years, five teams.',
              style: TextStyle(
                fontFamily: AppTheme.display,
                color: AppColors.ink,
                fontSize: 40,
                height: 1,
              ),
            ),
            const SizedBox(height: 28),
            ...experience.map((job) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${job.dates}  ·  ${job.tenure}'.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: AppTheme.sans,
                        color: Color(0xFF6D665B),
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      job.role.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: AppTheme.sans,
                        color: Color(0xFF8A6B32),
                        fontSize: 11,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      job.company,
                      style: const TextStyle(
                        fontFamily: AppTheme.display,
                        color: AppColors.ink,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ...job.points.map(
                      (point) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '·  $point',
                          style: const TextStyle(
                            fontFamily: AppTheme.sans,
                            color: Color(0xFF5C564C),
                            height: 1.45,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _Skills extends ConsumerWidget {
  const _Skills();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillGroups = ref.watch(skillsProvider);
    return _Page(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('03 — Capabilities'),
          const SizedBox(height: 10),
          Text('The stack I work in.', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, box) {
              final two = box.maxWidth >= 720;
              final gap = 12.0;
              final width = two ? (box.maxWidth - gap) / 2 : box.maxWidth;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (final group in skillGroups)
                    SizedBox(
                      width: width,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                        decoration: BoxDecoration(
                          color: AppColors.ink2,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(group.title, style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: group.items
                                  .map(
                                    (item) => Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 7,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(99),
                                        border: Border.all(
                                          color: AppColors.paper.withValues(alpha: 0.12),
                                        ),
                                      ),
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontFamily: AppTheme.sans,
                                          color: AppColors.paper,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _About extends ConsumerWidget {
  const _About();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final education = ref.watch(educationProvider);
    return _Page(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('04 — About'),
          const SizedBox(height: 10),
          Text('Built in Ahmedabad.', style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, box) {
              final two = box.maxWidth >= 720;
              final bio = _AboutCard(
                kicker: null,
                title: 'A lead who still ships.',
                body:
                    '${profile.summary} Comfortable on both consumer Play Store products and internal tools that have to work every morning on a factory floor.',
              );
              final edu = _AboutCard(
                kicker: 'EDUCATION',
                title: education.degree,
                body: '${education.focus}\n${education.school}',
              );
              if (!two) {
                return Column(
                  children: [bio, const SizedBox(height: 12), edu],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: bio),
                  const SizedBox(width: 12),
                  Expanded(child: edu),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  const _AboutCard({required this.kicker, required this.title, required this.body});
  final String? kicker;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.ink2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (kicker != null) ...[
            Text(
              kicker!,
              style: const TextStyle(
                fontFamily: AppTheme.sans,
                color: AppColors.brass,
                fontSize: 11,
                letterSpacing: 1.6,
              ),
            ),
            const SizedBox(height: 8),
          ],
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(body, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _Contact extends ConsumerStatefulWidget {
  const _Contact();

  @override
  ConsumerState<_Contact> createState() => _ContactState();
}

class _ContactState extends ConsumerState<_Contact> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _message.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final profile = ref.read(profileProvider);
    await openMail(
      email: profile.email,
      subject:
          'Portfolio note from ${_name.text.trim().isEmpty ? 'the app' : _name.text.trim()}',
      body: '${_message.text.trim()}\n\n— ${_name.text.trim()} · ${_email.text.trim()}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);
    const field = InputDecoration(
      filled: true,
      fillColor: AppColors.ink2,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none,
      ),
      labelStyle: TextStyle(
        fontFamily: AppTheme.sans,
        color: AppColors.fog,
        fontSize: 13,
      ),
    );

    final form = Column(
      children: [
        TextField(controller: _name, decoration: field.copyWith(labelText: 'Name')),
        const SizedBox(height: 10),
        TextField(
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          decoration: field.copyWith(labelText: 'Email'),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _message,
          maxLines: 4,
          decoration: field.copyWith(labelText: 'Message'),
        ),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.centerLeft,
          child: FilledButton(
            onPressed: _send,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.brass,
              foregroundColor: AppColors.ink,
            ),
            child: const Text('SEND MESSAGE'),
          ),
        ),
      ],
    );

    final links = Column(
      children: [
        _LinkRow(
          icon: Icons.mail_outline,
          label: profile.email,
          onTap: () => openMail(email: profile.email),
        ),
        _LinkRow(
          icon: Icons.phone_outlined,
          label: profile.phone,
          onTap: () => openUrl(profile.phoneUri),
        ),
        _LinkRow(
          icon: Icons.link,
          label: 'linkedin.com/in/nitin-mistry',
          onTap: () => openUrl(profile.linkedin),
        ),
        _LinkRow(
          icon: Icons.language,
          label: 'Open the website',
          onTap: openWebsite,
        ),
      ],
    );

    return _Page(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('05 — Contact'),
          const SizedBox(height: 10),
          Text("Let's build the next one.", style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, box) {
              if (box.maxWidth < 720) {
                return Column(children: [links, const SizedBox(height: 18), form]);
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: links),
                  const SizedBox(width: 28),
                  Expanded(child: form),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LinkRow extends StatelessWidget {
  const _LinkRow({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.brass),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: AppTheme.sans,
          color: AppColors.paper,
          fontSize: 15,
        ),
      ),
      onTap: onTap,
    );
  }
}

class _Footer extends ConsumerWidget {
  const _Footer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    return _Page(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
      child: Wrap(
        spacing: 16,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            '© ${DateTime.now().year} ${profile.name}  ·  ${profile.location}',
            style: const TextStyle(
              fontFamily: AppTheme.sans,
              color: AppColors.fog,
              fontSize: 13,
            ),
          ),
          TextButton(
            onPressed: openWebsite,
            child: const Text('Website'),
          ),
        ],
      ),
    );
  }
}
