import 'package:flutter/material.dart';
import 'package:pg_slema/features/about/presentation/screen/about_screen.dart';
import 'package:pg_slema/features/chat/logic/service/threads/threads_service.dart';
import 'package:pg_slema/features/chat/presentation/screen/all_threads_screen.dart';
import 'package:pg_slema/features/diet/presentation/screen/diet_screen.dart';
import 'package:pg_slema/features/exercises/logic/service/exercise_service.dart';
import 'package:pg_slema/features/exercises/presentation/screen/exercises_screen.dart';
import 'package:pg_slema/features/gallery/logic/repository/stored_image_metadata_repository.dart';
import 'package:pg_slema/features/gallery/logic/service/image_service.dart';
import 'package:pg_slema/features/home/presentation/screen/home_screen.dart';
import 'package:pg_slema/features/medicine/presentation/screen/all_medicines_screen.dart';
import 'package:pg_slema/features/gallery/presentation/screen/gallery_screen.dart';
import 'package:pg_slema/features/picture/presentation/screen/pictures_screen.dart';
import 'package:pg_slema/features/settings/presentation/screen/settings_screen.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment_factory.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';
import 'package:pg_slema/features/well_being/presentation/screen/all_assessments_screen.dart';
import 'package:pg_slema/main/presentation/controller/main_screen_controller.dart';
import 'package:pg_slema/main/presentation/widget/custom_navigation_destination.dart';
import 'package:provider/provider.dart';
import 'package:pg_slema/features/menu/presentation/screen/menu_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainScreenController>(context);
    final assessmentFactory =
        Provider.of<AssessmentFactory>(context, listen: false);
    final assessmentsService =
        Provider.of<AssessmentsService>(context, listen: false);
    final exercisesService =
        Provider.of<ExerciseService>(context, listen: false);
    final threadsService = Provider.of<ThreadsService>(context, listen: false);
    final imageMetadataRepository =
        Provider.of<StoredImageMetadataRepository>(context, listen: false);
    final imageService = Provider.of<ImageService>(context, listen: false);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CustomNavigationDestination(
              icon: Icons.restaurant_menu_outlined,
              selectedIcon: Icons.restaurant_menu,
              label: 'Dieta',
              onPressed: controller.onTabTapped,
              currentSelectedIndex: controller.currentIndex,
              destinationIndex: 0,
            ),
            CustomNavigationDestination(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              label: 'Start',
              onPressed: controller.onTabTapped,
              currentSelectedIndex: controller.currentIndex,
              destinationIndex: 1,
            ),
            CustomNavigationDestination(
              icon: Icons.menu_outlined,
              selectedIcon: Icons.menu,
              label: 'Menu',
              onPressed: controller.onTabTapped,
              currentSelectedIndex: controller.currentIndex,
              destinationIndex: 2,
            ),
          ],
        ),
      ),
      body: <Widget>[
        const DietScreen(),
        HomeScreen(
          assessmentFactory: assessmentFactory,
          assessmentService: assessmentsService,
        ),
        const MenuScreen(),
        const AllMedicinesScreen(),
        const DietScreen(),
        ExercisesScreen(
          service: exercisesService,
        ),
        GalleryScreen(
          repository: imageMetadataRepository,
          service: imageService,
        ),
        AllAssessmentsScreen(
          service: assessmentsService,
          factory: assessmentFactory,
        ),
        AllThreadsScreen(
          threadsService: threadsService,
        ),
        const SettingsScreen(),
        const AboutScreen(),
      ][controller.currentIndex],
    );
  }
}
