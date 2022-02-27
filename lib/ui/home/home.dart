import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symfonia/core/bloc/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:symfonia/ui/components/navigation_items.dart';
import 'package:symfonia/ui/pages/dashboard.dart';
import 'package:symfonia/ui/pages/notification.dart';
import 'package:symfonia/ui/pages/profile.dart';
import 'package:symfonia/ui/pages/task.dart';
import 'package:symfonia/utils/colors_consts.dart';
import 'package:symfonia/utils/images.dart';
import '../components/custom_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, state) {
        _currentIndex = state;
        return Scaffold(
          backgroundColor: ColorPath.BACKGROUND,
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return Dashboard();
      case 1:
        return TasksPage();
      case 2:
        return NotificationPage();
      case 3:
        return ProfilePage();
      default:
        return Text('Not Found');
    }
  }

  Widget _buildBottomNav() {
    return CustomNavBar(
        currentIndex: _currentIndex,
        items: [
          Navigationitem(ImagesAsset.chart),
          Navigationitem(ImagesAsset.globe),
          Navigationitem(ImagesAsset.notification),
          Navigationitem(ImagesAsset.profile),
        ],
        onTap: _getChangeBottomNav);
  }

  void _getChangeBottomNav(int index) {
    switch (index) {
      case 0:
        BlocProvider.of<BottomNavBarCubit>(context).getDashboard();
        break;
      case 1:
        BlocProvider.of<BottomNavBarCubit>(context).getTasks();
        break;
      case 2:
        BlocProvider.of<BottomNavBarCubit>(context).getNotification();
        break;
      case 3:
        BlocProvider.of<BottomNavBarCubit>(context).getProfile();
        break;
      default:
    }
  }
}
