# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

FalconX is a modular Flutter framework consisting of multiple packages in a workspace/monorepo structure. The project uses Melos for workspace management and follows a clean architecture pattern with strong separation of concerns.

## Package Structure

The workspace contains 6 main packages:

- **flutter_falconx**: Core framework with BLoC patterns, routers, state management
- **flutter_falconnect**: Network layer with Dio, Retrofit, WebSocket, and connectivity handling
- **flutter_falkit**: UI kit with animations, widgets, styles, and extensions
- **flutter_falmodel**: Data models and state structures with WidgetDataState pattern
- **flutter_falstore**: Storage layer with secure storage and database abstractions
- **flutter_faltool**: Utility tools, logging, platform detection, and type definitions

## Common Development Commands

### Workspace Management (using Melos)
```bash
# Get dependencies for all packages
melos get

# Clean and restart dependencies
melos restart

# Upgrade dependencies
melos upgrade

# Check outdated dependencies
melos outdated

# Run build_runner for code generation
melos build_runner
```

### Testing
```bash
# Run tests for a specific package
cd flutter_falconx && flutter test
cd flutter_falconnect && flutter test
# etc.

# Run a single test file
flutter test test/unit_test.dart

# Run tests with coverage
flutter test --coverage
```

### Code Quality
```bash
# Analyze code (uses very_good_analysis package)
flutter analyze

# Format code
dart format .
```

### Build & Run
```bash
# Get dependencies for workspace
melos run upgrade

# Run build_runner for code generation (in packages that need it)
melos run build_runner

```

## Architecture Patterns

### State Management Pattern
The framework uses a custom BLoC pattern with `WidgetDataState` that provides:
- Loading, Success, Fail, Warning, Cancel states
- Data persistence across state changes
- User feedback integration
- Event-driven architecture

### BLoC Base Classes
- `FalconBloc`: Base BLoC with Either pattern and stream fetching
- `FalconWidgetDataStateBloc`: BLoC with non-nullable data state
- `FalconNullableWidgetDataStateBloc`: BLoC with nullable data state

### Network Architecture
- Uses Dio for HTTP requests with Retrofit for API definitions
- Includes interceptors for connectivity and caching
- Rate limiting support
- WebSocket support via web_socket_channel
- External dependency on dart_falconnect package

### Package Dependencies Flow
```
flutter_falconx (main framework)
├── flutter_falconnect (networking)
├── flutter_falkit (UI components)
├── flutter_falmodel (data models)
├── flutter_falstore (storage)
└── flutter_faltool (utilities)
```

## Code Style & Conventions

### Analysis Configuration
- Uses `very_good_analysis` package for strict linting
- Custom rules in analysis_options.yaml
- Excludes generated files (*.g.dart, *.freezed.dart, *.gen.dart)

### Import Conventions
- Avoid relative imports for lib/ files
- Use single quotes for strings
- Export commonly used dependencies through main package files

### File Naming
- Use lowercase with underscores for file names
- Group related files in feature folders
- Main exports through lib/[feature]/[feature].dart pattern

## Code Generation

Packages that use code generation:
- **flutter_falconnect**: Uses freezed, json_serializable, retrofit_generator
- Run `dart run build_runner build --delete-conflicting-outputs` in package directory

## Testing Strategy

- Unit tests located in `test/unit_test.dart` for each package
- Widget tests for UI components in flutter_falkit
- Integration tests for network layer in flutter_falconnect

## Important Files & Patterns

### Export Patterns
Each package has a main export file (e.g., `flutter_falconx.dart`) that re-exports:
- Core Flutter/Dart libraries with specific hiding
- Sub-package dependencies
- Internal feature modules

### State Management
- `WidgetDataState<T>`: Core state structure for UI components
- BLoC pattern with events and states
- Stream-based reactive programming

### Networking
- Retrofit for API interface definitions
- Dio interceptors for cross-cutting concerns
- Rate limiting and connectivity handling

## Development Tips

1. When modifying multiple packages, use `melos` commands to manage all packages at once
2. Always run `flutter analyze` before committing
3. Use the provided BLoC base classes for consistent state management
4. Follow the existing export pattern when adding new features
5. Generated files should never be manually edited
6. The project references an external dart_falconnect package at a specific path