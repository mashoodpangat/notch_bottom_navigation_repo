# Notch Bottom Navigation Bar

A customizable bottom navigation bar with an elegant inward notch and a floating action button (FAB) for Flutter.

---

## ✨ Features

- 🕳️ Modern inward-notch design with smooth curves  
- ➕ Center Floating Action Button (FAB) with customizable color and icon  
- 📱 Supports multiple pages and icons  
- 🔵 Active tab indicator dot  
- 🎨 Configurable selected and unselected colors  
- 🔧 Easy to integrate with any app  

---

## 🚀 Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  notch_bottom_navigation: ^0.0.1
```

Then, run the following command in your terminal:

```bash
flutter pub get

```

Or directly add the package using:

```bash
flutter pub add notch_bottom_navigation
```

## 📦 Usage

```dart

Import the package and use CustomNotchBottomNavigation in your app:

import 'package:flutter/material.dart';
import 'package:notch_bottom_navigation/notch_bottom_navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notch Bottom Navigation Demo',
      home: CustomNotchBottomNavigation(
        pages: const [
          Scaffold(body: Center(child: Text('Home'))),
          Scaffold(body: Center(child: Text('Search'))),
          Scaffold(body: Center(child: Text('Notifications'))),
          Scaffold(body: Center(child: Text('Settings'))),
        ],
        icons: const [
          Icons.home,
          Icons.search,
          Icons.notifications,
          Icons.settings,
        ],
        fabIcon: Icons.add,
        fabColor: Colors.deepPurple,
        selectedColor: Colors.deepPurple,
        unselectedColor: Colors.grey,
        onFabTap: () => debugPrint('FAB tapped'),
      ),
    );
  }
}

```

## ⚙️ Customization Options

| Parameter         | Description                         |
| ----------------- | ----------------------------------- |
| `pages`           | List of widgets for each tab        |
| `icons`           | List of icons for each tab          |
| `fabIcon`         | Icon for the floating action button |
| `fabColor`        | Color of the FAB                    |
| `selectedColor`   | Color of the selected tab icon      |
| `unselectedColor` | Color of the unselected tab icons   |
| `onFabTap`        | Callback when FAB is tapped         |


---

📬 Additional Information

❗ Found a bug? Please open an issue on GitHub Issues

🤝 Want to contribute? Pull requests are welcome!



---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🧑‍💻 Author

Made with ❤️ by [YourName]  
GitHub: [github.com/yourusername](https://github.com/mashoodpangat)



