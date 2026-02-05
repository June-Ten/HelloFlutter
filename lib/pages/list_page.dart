import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  // 生成示例数据
  List<Map<String, dynamic>> _generateItems() {
    return List.generate(
      100,
      (index) => {
        'id': index,
        'title': '列表项 ${index + 1}',
        'subtitle': '这是第 ${index + 1} 个列表项的详细描述信息',
        'icon': Icons.star,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = _generateItems();

    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  item['icon'] as IconData,
                  color: Colors.blue,
                ),
              ),
              title: Text(
                item['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['subtitle'] as String),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('点击了 ${item['title']}'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


