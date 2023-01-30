import 'package:base_flutter_app/src/pages/pawan_ui/pull_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bottomNav/bottom_nav_cubit.dart';
import '../../widgets/slider_screen.dart';
import 'custom_radio.dart';


class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final _pageNavigation = [
     SliderScreen(),
    const PullRefresh(),
    const CustomRadio(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    return _pageNavigation.elementAt(index);
  }

  Widget _buildBottomNav() {
    int inx = context.read<BottomNavCubit>().state;
    return BottomNavigationBar(
      currentIndex: inx,
      type: BottomNavigationBarType.fixed,
      onTap: _getChangeBottomNav,
      items:   [
        BottomNavigationBarItem(icon: inx == 0 ? iconWidget(Icons.image_outlined) : const Icon(Icons.image_outlined), label: "Slider"),
        BottomNavigationBarItem(icon: inx == 1 ? iconWidget(Icons.arrow_circle_down) : const Icon(Icons.arrow_circle_down), label: "Pull Refresh"),
        BottomNavigationBarItem(icon: inx == 2 ? iconWidget(Icons.radio_button_on) : const Icon(Icons.radio_button_on), label: "Radio"),
      ],
    );
  }

  void _getChangeBottomNav(int index) {
    context.read<BottomNavCubit>().updateIndex(index);
  }

  Widget iconWidget(icon){
    return FloatingActionButton(onPressed: (){},child: Icon(icon));
  }
}
