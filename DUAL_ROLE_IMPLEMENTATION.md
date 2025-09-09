# Job Seeker & Employer Dual Role App

This Flutter application has been modified to support both Job Seeker and Employer roles with dedicated dashboards and features for each role.

## New Features Added

### 🏢 Employer Features
- **Employer Dashboard**: Overview of posted jobs, applications, and candidates
- **Job Posting**: Create and publish new job openings
- **Candidate Management**: Review applications, schedule interviews, and manage candidates
- **Application Tracking**: Monitor and update application statuses

### 👤 Job Seeker Features  
- **Job Seeker Dashboard**: Overview of applications and job recommendations
- **Job Search**: Search and filter jobs by location, type, experience, and salary
- **Application Tracking**: Track application status and interview schedules
- **Saved Jobs**: Bookmark and manage favorite job listings

## Role-Based Navigation

### Authentication
- Updated sign-up flow to include role selection (Job Seeker or Employer)
- Role-based navigation after login
- Persistent role storage

### Dashboards
- **Job Seekers** → Job Seeker Dashboard with job recommendations and application stats
- **Employers** → Employer Dashboard with job management and candidate overview

## Folder Structure Improvements

```
lib/
├── features/
│   ├── dashboard/                    # Role-specific dashboards
│   │   └── presentation/
│   │       ├── controller/
│   │       ├── screen/
│   │       └── widgets/
│   ├── employer/                     # Employer-specific features
│   │   ├── job_posting/
│   │   └── candidate_management/
│   ├── job_seeker/                   # Job seeker-specific features
│   │   ├── job_search/
│   │   └── application_tracking/
│   └── ... (existing features)
├── utils/
│   └── enum/
│       └── enum.dart                 # Added UserRole, JobStatus, ApplicationStatus
└── services/
    └── storage/
        ├── storage_keys.dart         # Added userRole key
        └── storage_services.dart     # Added role handling
```

## Technical Updates

### Enums
- `UserRole`: jobSeeker, employer
- `JobStatus`: active, paused, closed  
- `ApplicationStatus`: applied, shortlisted, interviewed, hired, rejected

### Storage
- Added `userRole` to local storage
- Updated storage services to handle role persistence
- Role-based navigation logic

### Routing
- Added new routes for employer and job seeker features
- Role-based dashboard routing
- Updated splash screen navigation

### Dependency Injection
- Added all new controllers to dependency injection
- Organized controllers by feature groups

## How to Use

### For Job Seekers:
1. Sign up and select "Job Seeker" role
2. Access Job Seeker Dashboard
3. Use "Find Jobs" to search for opportunities
4. Track applications in "My Applications"

### For Employers:
1. Sign up and select "Employer" role  
2. Access Employer Dashboard
3. Use "Post New Job" to create job listings
4. Manage applications in candidate management

## Mock Data
Currently using mock data for demonstration. Replace with actual API calls:
- Update API endpoints in controllers
- Implement real data fetching
- Add proper error handling

## Next Steps
1. Implement real API integration
2. Add advanced filtering and search
3. Implement real-time notifications
4. Add messaging between employers and job seekers
5. Implement advanced candidate screening features

---

All existing functionality has been preserved while adding the new dual-role system.