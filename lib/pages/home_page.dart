import 'package:flutter/material.dart';
import 'dialog_page.dart';
import 'list_page.dart';
import 'image_picker_page.dart';
import 'map_page.dart';
import 'camera_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 功能演示'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.chat_bubble_outline), text: '弹窗'),
            Tab(icon: Icon(Icons.list), text: '长列表'),
            Tab(icon: Icon(Icons.image), text: '图片选择'),
            Tab(icon: Icon(Icons.map), text: '地图'),
            Tab(icon: Icon(Icons.camera_alt), text: '相机'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DialogPage(),
          ListPage(),
          ImagePickerPage(),
          MapPage(),
          CameraPage(),
        ],
      ),
    );
  }
}


