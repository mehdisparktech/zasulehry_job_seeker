# Project Structure & Organization

## Root Level Structure
```
├── lib/                    # Main application code
├── assets/                 # Static assets (images, icons)
├── android/               # Android-specific configuration
├── ios/                   # iOS-specific configuration
├── web/                   # Web platform files
├── test/                  # Unit and widget tests
├── .env                   # Environment variables
└── pubspec.yaml           # Dependencies and project config
```

## Core Architecture (`lib/core/`)

### Component System (`lib/core/component/`)
- **Reusable UI Components**: Organized by type (button, text, image, etc.)
- **Common Widgets**: Shared across features (loaders, cards, app bars)
- **Naming Convention**: `common_[component_name].dart`

### Configuration (`lib/core/config/`)
- **API**: Endpoint definitions and configuration
- **Dependency Injection**: GetX bindings for controllers
- **Routes**: Centralized navigation management
- **Theme**: App-wide styling and theming
- **Languages**: Internationalization setup

### Services (`lib/core/services/`)
- **API Service**: HTTP client with Dio, error handling, interceptors
- **Storage**: Local data persistence with SharedPreferences
- **Socket**: Real-time communication setup
- **Notifications**: Push notification management
- **Location**: GPS and location services

### Constants & Utils (`lib/core/constants/`, `lib/core/utils/`)
- **Constants**: Colors, strings, images, icons
- **Utils**: Helper functions, extensions, enums, logging

## Feature Architecture (`lib/features/`)

### Feature Organization Pattern
```
lib/features/[user_type]/[feature_name]/
├── data/
│   └── model/              # Data models
├── presentation/
│   ├── controller/         # GetX controllers
│   ├── screen/            # UI screens
│   └── widgets/           # Feature-specific widgets
└── repository/            # Data layer (when needed)
```

### User Type Separation
- **`common/`**: Shared features (auth, splash, onboarding)
- **`jobseeker/`**: Job seeker specific features
- **`employer/`**: Employer features (infrastructure exists, limited implementation)

### Feature Categories

#### Authentication (`features/common/auth/`)
- Sign up, sign in, password management
- Each auth flow has its own subfolder
- Shared widgets and controllers

#### Job Seeker Features (`features/jobseeker/`)
- **Dashboard**: Main navigation hub
- **Home**: Job browsing and search
- **Jobs**: Application management (applied, approved, pending, canceled, saved)
- **Message**: Chat functionality with employers
- **Profile**: User profile management and editing
- **Notifications**: Push notification handling
- **Settings**: App settings, privacy policy, terms
- **Additional Tools**: Resume creation, salary calculator, feedback

## Naming Conventions

### Files
- **Screens**: `[feature_name]_screen.dart`
- **Controllers**: `[feature_name]_controller.dart`
- **Models**: `[model_name]_model.dart`
- **Widgets**: Descriptive names (e.g., `job_card.dart`, `chat_bubble_message.dart`)

### Classes
- **Screens**: `[FeatureName]Screen`
- **Controllers**: `[FeatureName]Controller`
- **Models**: `[ModelName]Model`
- **Widgets**: Descriptive class names

### Routes
- Static constants in `AppRoutes` class
- Pattern: `/[screen_name].dart`

## Key Architectural Principles

1. **Feature-First Organization**: Group by business functionality, not technical layers
2. **Separation of Concerns**: Clear separation between UI, business logic, and data
3. **Reusability**: Common components in core, feature-specific widgets in features
4. **GetX Pattern**: Controllers for state management, dependency injection for services
5. **Clean Architecture**: Data flows from repository → controller → UI
6. **Consistent Naming**: Follow established patterns for files, classes, and routes