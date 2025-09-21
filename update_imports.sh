#!/bin/bash

# Script to update import statements in employer directory files

cd "/Users/mehdihassan/Documents/GitHub/zasulehry_job_seeker/lib/features/employer"

# Find all dart files and update imports
find . -name "*.dart" -type f | while read file; do
    echo "Updating imports in: $file"
    
    # Update imports for appointments
    sed -i '' 's|appointments_screen\.dart|employer_appointments_screen.dart|g' "$file"
    
    # Update imports for salary
    sed -i '' 's|salary_calculator_controller\.dart|employer_salary_calculator_controller.dart|g' "$file"
    sed -i '' 's|salary_comparison_controller\.dart|employer_salary_comparison_controller.dart|g' "$file"
    sed -i '' 's|salary_calculator_screen\.dart|employer_salary_calculator_screen.dart|g' "$file"
    sed -i '' 's|salary_comparison_screen\.dart|employer_salary_comparison_screen.dart|g' "$file"
    
    # Update imports for resume
    sed -i '' 's|resume_creation_screen\.dart|employer_resume_creation_screen.dart|g' "$file"
    sed -i '' 's|resume_widgets\.dart|employer_resume_widgets.dart|g' "$file"
    
    # Update imports for message
    sed -i '' 's|chat_list_model\.dart|employer_chat_list_model.dart|g' "$file"
    sed -i '' 's|chat_message_model\.dart|employer_chat_message_model.dart|g' "$file"
    sed -i '' 's|message_model\.dart|employer_message_model.dart|g' "$file"
    sed -i '' 's|chat_controller\.dart|employer_chat_controller.dart|g' "$file"
    sed -i '' 's|message_controller\.dart|employer_message_controller.dart|g' "$file"
    sed -i '' 's|chat_screen\.dart|employer_chat_screen.dart|g' "$file"
    sed -i '' 's|message_screen\.dart|employer_message_screen.dart|g' "$file"
    sed -i '' 's|chat_list_item\.dart|employer_chat_list_item.dart|g' "$file"
    sed -i '' 's|message_bubble\.dart|employer_message_bubble.dart|g' "$file"
    
    # Update imports for profile
    sed -i '' 's|profile_controller\.dart|employer_profile_controller.dart|g' "$file"
    sed -i '' 's|profile_screen\.dart|employer_profile_screen.dart|g' "$file"
    sed -i '' 's|profile_widgets\.dart|employer_profile_widgets.dart|g' "$file"
    
    # Update imports for jobs
    sed -i '' 's|jobs_screen\.dart|employer_jobs_screen.dart|g' "$file"
    sed -i '' 's|job_card\.dart|employer_job_card.dart|g' "$file"
    
    # Update imports for feedback
    sed -i '' 's|feedback_screen\.dart|employer_feedback_screen.dart|g' "$file"
    
    # Update imports for dashboard
    sed -i '' 's|dashboard_controller\.dart|employer_dashboard_controller.dart|g' "$file"
    sed -i '' 's|dashboard_screen\.dart|employer_dashboard_screen.dart|g' "$file"
    sed -i '' 's|dashboard_widgets\.dart|employer_dashboard_widgets.dart|g' "$file"
    
    # Update imports for settings
    sed -i '' 's|setting_controller\.dart|employer_setting_controller.dart|g' "$file"
    sed -i '' 's|terms_of_services_screen\.dart|employer_terms_of_services_screen.dart|g' "$file"
    sed -i '' 's|privacy_policy_screen\.dart|employer_privacy_policy_screen.dart|g' "$file"
    sed -i '' 's|country_selection_screen\.dart|employer_country_selection_screen.dart|g' "$file"
    sed -i '' 's|setting_screen\.dart|employer_setting_screen.dart|g' "$file"
    sed -i '' 's|impressum_screen\.dart|employer_impressum_screen.dart|g' "$file"
    sed -i '' 's|connected_accounts_screen\.dart|employer_connected_accounts_screen.dart|g' "$file"
    sed -i '' 's|language_selection_screen\.dart|employer_language_selection_screen.dart|g' "$file"
    sed -i '' 's|profile_visibility_option\.dart|employer_profile_visibility_option.dart|g' "$file"
    sed -i '' 's|setting_item\.dart|employer_setting_item.dart|g' "$file"
    
    # Update imports for notifications
    sed -i '' 's|notification_repository\.dart|employer_notification_repository.dart|g' "$file"
    sed -i '' 's|notification_model\.dart|employer_notification_model.dart|g' "$file"
    sed -i '' 's|notifications_controller\.dart|employer_notifications_controller.dart|g' "$file"
    sed -i '' 's|notifications_screen\.dart|employer_notifications_screen.dart|g' "$file"
    sed -i '' 's|notification_item\.dart|employer_notification_item.dart|g' "$file"
done

echo "All imports updated successfully!"