import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/portfolio_models.dart';
import '../repositories/portfolio_repository.dart';

final portfolioRepositoryProvider = Provider((ref) => PortfolioRepository());

final profileProvider = Provider<Profile>((ref) {
  return ref.watch(portfolioRepositoryProvider).getProfile();
});

final statsProvider = Provider<List<Stat>>((ref) {
  return ref.watch(portfolioRepositoryProvider).getStats();
});

final projectsProvider = Provider<List<Project>>((ref) {
  return ref.watch(portfolioRepositoryProvider).getProjects();
});

final extraProjectsProvider = Provider<List<ExtraProject>>((ref) {
  return ref.watch(portfolioRepositoryProvider).getExtraProjects();
});

final experienceProvider = Provider<List<Job>>((ref) {
  return ref.watch(portfolioRepositoryProvider).getExperience();
});

final skillsProvider = Provider<List<SkillGroup>>((ref) {
  return ref.watch(portfolioRepositoryProvider).getSkills();
});

final educationProvider = Provider<Education>((ref) {
  return ref.watch(portfolioRepositoryProvider).getEducation();
});
