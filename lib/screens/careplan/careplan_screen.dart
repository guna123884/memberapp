import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../../theme/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CareplanScreen extends StatefulWidget {
  const CareplanScreen({super.key});

  @override
  State<CareplanScreen> createState() => _CareplanScreenState();
}

class _CareplanScreenState extends State<CareplanScreen> {
  List<Map<String, dynamic>> careplanData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCareplanData();
  }

  Future<void> loadCareplanData() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'lib/screens/careplan/data.json',
      );
      final List<dynamic> jsonData = json.decode(jsonString);
      setState(() {
        careplanData = jsonData.cast<Map<String, dynamic>>();
        isLoading = false;
      });
    } catch (e) {
      print('Error loading careplan data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Care Plan'),
        automaticallyImplyLeading: false,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : careplanData.isEmpty
          ? const Center(
              child: Text(
                'No care plan data available',
                style: TextStyle(fontSize: 16),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.2,
                ),
                itemCount: careplanData.length,
                itemBuilder: (context, index) {
                  final category = careplanData[index];
                  final needCategory =
                      category['needCategory'] ?? 'Unknown Category';
                  final programsCount =
                      (category['programs'] as List?)?.length ?? 0;

                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        // TODO: Navigate to category details
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Tapped on $needCategory'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              index % 2 == 0
                                  ? AppColors.primary.withValues(alpha: 0.1)
                                  : AppColors.secondary.withValues(alpha: 0.1),
                              index % 2 == 0
                                  ? AppColors.primary.withValues(alpha: 0.05)
                                  : AppColors.secondary.withValues(alpha: 0.05),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.heart,
                              size: 32,
                              color: index % 2 == 0
                                  ? AppColors.primary
                                  : AppColors.secondary,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              needCategory,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.dark,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$programsCount programs',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.gray600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
