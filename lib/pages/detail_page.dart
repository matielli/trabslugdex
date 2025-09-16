import 'package:flutter/material.dart';
import '../models/slug_model.dart';
import '../widgets/theme_appbar.dart';
import '../utils/constants.dart';

class DetailPage extends StatelessWidget {
  final Slug slug;

  const DetailPage({Key? key, required this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: ThemeAppBar(
        title: slug.name,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'slug-${slug.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppDimensions.cardBorderRadius
                ),
                child: Image.network(
                  slug.imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.error, size: 200, color: Colors.orange),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              slug.name,
              style: TextStyles.pageTitle,
            ),
            const SizedBox(height: 20),
            _buildInfoCard(AppStrings.elementLabel, slug.element),
            _buildInfoCard(AppStrings.shotTypeLabel, slug.shotType),
            _buildInfoCard(AppStrings.abilitiesLabel, slug.abilities),
            _buildStatsRow(),
            _buildInfoCard(AppStrings.strategyLabel, slug.strategy),
            _buildInfoCard(AppStrings.triviaLabel, slug.trivia),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Card(
      color: AppColors.cardBackground,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.slugDetailTitle,
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: TextStyles.slugDetailContent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(AppStrings.speedLabel, slug.speed),
        ),
        Expanded(
          child: _buildStatCard(AppStrings.strengthLabel, slug.strength),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      color: AppColors.cardBackground,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.defaultPadding),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyles.slugDetailTitle,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}