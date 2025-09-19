### **Flutter Project Coding Guidelines and Rules**

This document outlines the coding standards and best practices for our project. Adherence to these guidelines is mandatory for all developers to ensure our codebase remains clean, readable, and maintainable.

#### **1. Folder Structure & Codebase Flow**

Our project follows a specific folder structure. All new code must be placed in the appropriate directory.

*   **`lib/core/`**: This directory contains the foundational and shared code of the application, which is not dependent on any specific feature.
    *   **`config`**: Application-wide configurations (e.g., themes, routes, API keys).
    *   **`services`**: All background services (e.g., API clients, location, storage).
    *   **`utils`**: Shared utilities and tools (e.g., constants, helpers, extensions).
    *   **`components`**: Common widgets that are reused across the entire application (e.g., `CustomButton`, `CustomCard`, `InputField`).

*   **`lib/features/`**: All application features or modules are located here.
    *   **`common/`**: Features that are common to all user roles (e.g., `splash`, `onboarding`, `auth`).
    *   **`role_one/`**: Features specific to users with "Role One".
    *   **`role_two/`**: Features specific to users with "Role Two".

**Rule:** Before writing any code, ensure you are in the correct directory for that feature or module.

#### **2. Clean Architecture**

Our project will adhere to the principles of Clean Architecture. The primary goal is to separate concerns by keeping the UI, Business Logic, and Data sources independent of each other.

*   **Presentation Layer**: This layer is responsible for everything the user sees and interacts with (the UI). It includes `screens`, `widgets`, and state management logic (`controllers`/`blocs`). It should only receive data from the Domain Layer.
*   **Domain Layer**: Contains the core business logic of the application. It is completely independent of both the Presentation and Data layers.
*   **Data Layer**: Responsible for fetching data from and sending data to data sources (like an API or a local database). This layer includes `Repository` implementations and `Data Sources`.

**Rule:** The Presentation Layer must **never** communicate directly with the Data Layer. This rule must be strictly followed.

#### **3. Code Optimization**

Performance must be a consideration while writing code.

*   Use state management (Provider/BLoC/GetX) correctly to avoid unnecessary widget rebuilds.
*   Use `const` constructors wherever possible to improve performance.
*   Break down large widgets into smaller, more manageable ones.
*   Use `ListView.builder` for displaying long lists of items.

#### **4. Reusable Components**

Code repetition must be avoided.

*   **DRY (Don't Repeat Yourself) Principle:** Do not write the same UI or logic multiple times.
*   If a widget (e.g., a card, button, text field) is likely to be used in more than one place, create a common widget for it in the `core/components/` directory.
*   These common widgets should be made customizable through parameters (e.g., `title`, `onPressed`, `color`).

#### **5. Strings and Localization**

Hardcoded static text is strictly prohibited in the UI.

*   All static strings (e.g., button labels, titles, messages) must be placed in a central file, such as `core/utils/app_strings.dart`.
*   In the UI code, always reference strings from this central file (e.g., `Text(AppStrings.welcomeMessage)`).

**Reasoning:** This practice makes it incredibly easy to add new languages (localization) in the future and allows all app text to be managed from a single location.

---

Following these guidelines will ensure that our codebase maintains a consistent and high-quality standard. Thank you for your cooperation.