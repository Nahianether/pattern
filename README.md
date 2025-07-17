# Flutter Pattern Template

A comprehensive Flutter starter template with custom components, utility functions, and essential packages pre-configured for rapid development. This template provides a solid foundation for building production-ready Flutter applications.

## ✨ Features

### 🎨 Custom Components
- **Custom Buttons** - Reusable button components with multiple styles
- **Custom Input Fields** - Enhanced text input widgets with validation
- **Custom Cards** - Beautiful card components with shadows and animations
- **Custom Dialogs** - Modal dialogs and bottom sheets
- **Custom Navigation** - Enhanced navigation components
- **Custom Loaders** - Loading indicators and progress bars
- **Custom Snackbars** - Elegant notification components

### 🔧 Utility Functions
- **Validation Helpers** - Email, phone, password validation functions
- **Date/Time Utilities** - Date formatting and manipulation helpers
- **Network Helpers** - HTTP request utilities and error handling
- **Storage Helpers** - Local storage and SharedPreferences utilities
- **Color Utilities** - Color manipulation and theme helpers
- **String Extensions** - String manipulation and formatting extensions
- **Navigation Helpers** - Route management and navigation utilities

### 📦 Pre-configured Packages
- **State Management** - Provider/Riverpod/Bloc setup
- **HTTP Client** - Dio configured with interceptors
- **Local Storage** - Hive/SharedPreferences setup
- **Routing** - Go Router or Auto Route configuration
- **UI Components** - Material Design 3 components
- **Animations** - Pre-built animation utilities
- **Form Validation** - Form validation helpers
- **Image Handling** - Image picker and caching

### 🏗️ Architecture
- **Clean Architecture** - Separation of concerns with proper layering
- **Folder Structure** - Well-organized project structure
- **Design Patterns** - Repository pattern, Singleton, Factory patterns
- **Error Handling** - Centralized error handling system
- **Logging** - Comprehensive logging system
- **Testing Setup** - Unit and widget test configurations

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio/VS Code
- Git

### Using This Template

#### Method 1: GitHub Template (Recommended)
1. **Click "Use this template"** on GitHub
2. **Create your repository** from this template
3. **Clone your new repository**
   ```bash
   git clone https://github.com/yourusername/your-project-name.git
   cd your-project-name
   ```

#### Method 2: Manual Clone
```bash
# Clone the template
git clone https://github.com/Nahianether/pattern.git my-new-project
cd my-new-project

# Remove git history and start fresh
rm -rf .git
git init
git add .
git commit -m "Initial commit from Flutter Pattern Template"
```

### Setup Instructions

1. **Install dependencies**
   ```bash
   flutter pub get
   ```

2. **Configure app details**
   - Update `pubspec.yaml` with your app name and description
   - Modify `android/app/src/main/AndroidManifest.xml` for Android config
   - Update `ios/Runner/Info.plist` for iOS config

3. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── app/                         # App-level configuration
│   ├── app.dart                # Main app widget
│   ├── routes.dart             # Route definitions
│   └── themes.dart             # App themes
├── core/                       # Core functionality
│   ├── constants/              # App constants
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   └── app_dimensions.dart
│   ├── utils/                  # Utility functions
│   │   ├── validators.dart
│   │   ├── helpers.dart
│   │   ├── extensions.dart
│   │   └── date_utils.dart
│   ├── services/               # Core services
│   │   ├── api_service.dart
│   │   ├── storage_service.dart
│   │   └── navigation_service.dart
│   └── exceptions/             # Custom exceptions
│       └── app_exceptions.dart
├── features/                   # Feature modules
│   ├── home/                   # Home feature
│   │   ├── data/              # Data layer
│   │   ├── domain/            # Business logic
│   │   └── presentation/      # UI layer
│   └── auth/                  # Authentication feature
│       ├── data/
│       ├── domain/
│       └── presentation/
├── shared/                     # Shared components
│   ├── widgets/               # Reusable widgets
│   │   ├── custom_button.dart
│   │   ├── custom_input.dart
│   │   ├── custom_card.dart
│   │   ├── custom_dialog.dart
│   │   └── custom_loader.dart
│   ├── components/            # Complex components
│   │   ├── app_bar.dart
│   │   ├── bottom_nav.dart
│   │   └── drawer.dart
│   └── models/                # Shared data models
│       └── base_model.dart
└── config/                    # Configuration files
    ├── app_config.dart
    └── environment.dart
```

## 🎨 Custom Components Usage

### Custom Button
```dart
import 'package:pattern/shared/widgets/custom_button.dart';

CustomButton(
  text: 'Click Me',
  onPressed: () {
    // Handle button press
  },
  type: ButtonType.primary,
  isLoading: false,
)
```

### Custom Input Field
```dart
import 'package:pattern/shared/widgets/custom_input.dart';

CustomInput(
  label: 'Email',
  hint: 'Enter your email',
  validator: Validators.email,
  prefixIcon: Icons.email,
  keyboardType: TextInputType.emailAddress,
)
```

### Custom Card
```dart
import 'package:pattern/shared/widgets/custom_card.dart';

CustomCard(
  title: 'Card Title',
  subtitle: 'Card subtitle',
  onTap: () {
    // Handle card tap
  },
  child: YourCustomWidget(),
)
```

## 🔧 Utility Functions

### Validation
```dart
import 'package:pattern/core/utils/validators.dart';

// Email validation
String? emailError = Validators.email('user@example.com');

// Password validation
String? passwordError = Validators.password('password123');

// Phone validation
String? phoneError = Validators.phone('+1234567890');
```

### Date Utilities
```dart
import 'package:pattern/core/utils/date_utils.dart';

// Format date
String formatted = DateUtils.formatDate(DateTime.now());

// Get relative time
String relative = DateUtils.getRelativeTime(DateTime.now());

// Parse date string
DateTime parsed = DateUtils.parseDate('2024-01-01');
```

### Extensions
```dart
import 'package:pattern/core/utils/extensions.dart';

// String extensions
String text = 'hello world';
String capitalized = text.capitalize(); // 'Hello world'
bool isValidEmail = text.isValidEmail();

// Widget extensions
Widget().paddingAll(16.0);
Widget().marginHorizontal(8.0);
```

## 🌈 Theming

### Custom Themes
```dart
import 'package:pattern/app/themes.dart';

// Light theme
ThemeData lightTheme = AppThemes.lightTheme;

// Dark theme
ThemeData darkTheme = AppThemes.darkTheme;

// Custom colors
Color primaryColor = AppColors.primary;
Color accentColor = AppColors.accent;
```

### Theme Usage
```dart
// Use theme colors
Container(
  color: Theme.of(context).primaryColor,
  child: Text(
    'Themed Text',
    style: Theme.of(context).textTheme.headlineMedium,
  ),
)
```

## 📱 State Management

### Provider Example
```dart
import 'package:provider/provider.dart';
import 'package:pattern/features/home/presentation/providers/home_provider.dart';

// In your widget
Consumer<HomeProvider>(
  builder: (context, provider, child) {
    if (provider.isLoading) {
      return CustomLoader();
    }
    return YourContentWidget();
  },
)
```

### Riverpod Example
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern/features/home/presentation/providers/home_provider.dart';

// In your widget
Consumer(
  builder: (context, ref, child) {
    final homeState = ref.watch(homeProvider);
    return homeState.when(
      data: (data) => YourContentWidget(data),
      loading: () => CustomLoader(),
      error: (error, stack) => ErrorWidget(error),
    );
  },
)
```

## 🔌 API Integration

### HTTP Service
```dart
import 'package:pattern/core/services/api_service.dart';

// GET request
final response = await ApiService.get('/users');

// POST request
final user = await ApiService.post('/users', {
  'name': 'John Doe',
  'email': 'john@example.com',
});

// Error handling
try {
  final data = await ApiService.get('/data');
} catch (e) {
  // Handle error
}
```

## 💾 Local Storage

### Storage Service
```dart
import 'package:pattern/core/services/storage_service.dart';

// Save data
await StorageService.saveString('user_token', 'abc123');
await StorageService.saveObject('user', userObject);

// Get data
String? token = await StorageService.getString('user_token');
User? user = await StorageService.getObject('user', User.fromJson);

// Remove data
await StorageService.remove('user_token');
```

## 🧪 Testing

### Running Tests
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage

# View coverage report
genhtml coverage/lcov.info -o coverage/html
```

### Test Structure
```
test/
├── unit/                      # Unit tests
│   ├── utils/
│   └── services/
├── widget/                    # Widget tests
│   └── shared/
│       └── widgets/
└── integration/               # Integration tests
    └── app_test.dart
```

## 📦 Included Packages

### Core Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  provider: ^6.0.5
  riverpod: ^2.4.0
  
  # HTTP Client
  dio: ^5.3.0
  
  # Local Storage
  hive: ^2.2.3
  shared_preferences: ^2.2.0
  
  # Routing
  go_router: ^10.1.0
  
  # UI Components
  material_symbols_icons: ^4.2719.1
  
  # Utilities
  intl: ^0.18.1
  uuid: ^3.0.7
```

### Development Dependencies
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  
  # Linting
  flutter_lints: ^3.0.0
  
  # Code Generation
  build_runner: ^2.4.6
  json_annotation: ^4.8.1
  
  # Testing
  mocktail: ^1.0.0
  mockito: ^5.4.2
```

## 🚀 Deployment

### Android
```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release
```

### iOS
```bash
# Build iOS
flutter build ios --release

# Build IPA
flutter build ipa --release
```

### Web
```bash
# Build for web
flutter build web --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Nahian Ether**
- **Company:** AKIJ iBOS Limited
- **Location:** Dhaka, Bangladesh
- **GitHub:** [@Nahianether](https://github.com/Nahianether)
- **Portfolio:** [portfolio.int8bit.xyz](https://portfolio.int8bit.xyz/)
- **LinkedIn:** [nahinxp21](https://www.linkedin.com/in/nahinxp21/)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Community contributors for various packages
- Material Design team for design guidelines
- All developers who provided feedback and suggestions

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design](https://material.io/design)
- [Flutter Community](https://flutter.dev/community)

---

*Start your Flutter project with a solid foundation. This template includes everything you need to build beautiful, maintainable, and scalable Flutter applications!*
