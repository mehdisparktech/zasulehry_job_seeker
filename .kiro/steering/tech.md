# Technology Stack

## Framework & Language
- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language (SDK ^3.9.0)
- **Flutter Version Management**: FVM for version control (currently 3.35.2)

## State Management & Architecture
- **GetX**: State management, dependency injection, and routing
- **Clean Architecture**: Feature-based folder structure with separation of concerns

## Key Dependencies
- **HTTP Client**: Dio with pretty logging for API requests
- **UI/Responsive**: flutter_screenutil for responsive design
- **Storage**: shared_preferences for local data persistence
- **Notifications**: flutter_local_notifications for push notifications
- **Real-time Communication**: socket_io_client for chat functionality
- **Image Handling**: image_picker, image_cropper, cached_network_image
- **Maps**: google_maps_flutter for location services
- **Forms**: intl_phone_field, pin_code_fields for specialized inputs
- **Styling**: google_fonts, flutter_svg for custom fonts and vector graphics
- **Environment**: flutter_dotenv for environment variable management

## Common Commands

### Setup & Installation
```bash
# Install dependencies
flutter pub get

# Clean and rebuild
flutter clean && flutter pub get

# Run on specific device
flutter run -d <device_id>
```

### Development
```bash
# Run in debug mode
flutter run

# Run with specific flavor/environment
flutter run --dart-define-from-file=.env

# Build for release
flutter build apk --release
flutter build ios --release
```

### FVM Commands
```bash
# Use specific Flutter version
fvm use 3.35.2

# Run Flutter commands through FVM
fvm flutter run
fvm flutter build apk
```

## Environment Configuration
- Uses `.env` file for environment variables
- Environment loaded in main.dart using flutter_dotenv
- API endpoints configured in `lib/core/config/api/api_end_point.dart`

## Build System
- Standard Flutter build system
- Multi-platform support (Android, iOS, Web, Desktop)
- Asset management through pubspec.yaml
- Custom launcher icons and splash screens configured