# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

FalconX is a comprehensive Flutter development framework with a monorepo structure managed by Melos. It consists of 6 interdependent packages:

1. **faltool** - Core utilities and extensions
2. **falmodel** - Data models and network structures  
3. **falconnect** - Networking layer (HTTP/WebSocket)
4. **falstore** - Data persistence and storage
5. **falkit** - UI components and animations
6. **falconx** - Main framework tying everything together

### Environment Requirements
- Flutter SDK: >=3.0.0 <4.0.0
- Dart SDK: >=3.3.0 <4.0.0

## Development Commands

### Dependency Management
```bash
# Get dependencies for all packages
melos get

# Clean and restart all packages
melos restart  

# Upgrade dependencies
melos upgrade

# Check outdated dependencies
melos outdated
```

### Code Generation
```bash
# Run build_runner for code generation (freezed, json_serializable)
melos build_runner

# Generate assets with flutter_gen
melos gen
```

### Testing
```bash
# Run tests for a specific package
cd [package_name] && flutter test

# Run tests for all packages
melos exec -- flutter test
```

## Architecture

### Package Dependencies
- **falconx** (main) → depends on all other packages
- **falconnect** → depends on faltool, falmodel
- **falkit**, **falmodel**, **falstore** → depend on faltool
- **faltool** → standalone utility package

### Key Technologies
- **State Management**: BLoC pattern with custom implementations
- **Networking**: Dio with Retrofit for REST APIs, WebSocket support
- **Code Generation**: freezed, json_serializable, build_runner
- **Storage**: Flutter Secure Storage for sensitive data
- **Routing**: app_links for deep linking support

### Code Standards
- Most packages use Very Good Analysis (strict linting)
- falconnect uses standard Flutter lints
- Generated files are excluded from analysis (*.g.dart, *.freezed.dart)
- Single quotes preferred for strings
- Print statements discouraged (use proper logging) - enforced by `avoid_print: true`

## Working with the Codebase

### When modifying network code
- HTTP clients are in `falconnect/lib/engine/https/`
- WebSocket implementation in `falconnect/lib/engine/sockets/`
- Network models defined in `falmodel/lib/networks/`
- All network exceptions handled in `falconnect/lib/engine/https/exceptions/`

### When working with state management
- BLoC implementations in `falconx/lib/blocs/`
- Custom cubits for simple states (bool, int, string, enum)
- Widget state builders in `falconx/lib/views/builders/`

### When adding UI components
- Place reusable widgets in `falkit/lib/widgets/`
- Animations go in `falkit/lib/animations/`
- Use existing color definitions from `falkit/lib/styles/colors.dart`

### When adding utilities
- Extensions go in `faltool/lib/extensions/`
- General utilities in `faltool/lib/utils/`
- Platform-specific code should use `PlatformChecker`