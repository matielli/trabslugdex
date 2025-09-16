import 'package:flutter/material.dart';
import '../models/slug_model.dart';
import '../utils/constants.dart';

class SlugCard extends StatelessWidget {
  final Slug slug;
  final VoidCallback onTap;

  const SlugCard({Key? key, required this.slug, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
        side: const BorderSide(color: AppColors.primaryBlue, width: 2),
      ),
      color: AppColors.cardBackground,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.defaultPadding),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimensions.imageBorderRadius),
                child: Image.network(
                  slug.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.error, size: 80, color: AppColors.accentOrange),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      slug.name,
                      style: TextStyles.slugName,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${AppStrings.elementLabel}: ${slug.element}',
                      style: TextStyles.slugDetailContent,
                    ),
                    Text(
                      '${AppStrings.shotTypeLabel}: ${slug.shotType}',
                      style: TextStyles.slugDetailContent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}