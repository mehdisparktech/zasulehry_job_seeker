class JobDetailsModel {
  final String id;
  final String companyName;
  final String jobTitle;
  final String salary;
  final String location;
  final String address;
  final String postedDate;
  final String distance;
  final String description;
  final List<String> responsibilities;
  final List<String> qualifications;
  final String companyIcon;

  JobDetailsModel({
    required this.id,
    required this.companyName,
    required this.jobTitle,
    required this.salary,
    required this.location,
    required this.address,
    required this.postedDate,
    required this.distance,
    required this.description,
    required this.responsibilities,
    required this.qualifications,
    required this.companyIcon,
  });

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) {
    return JobDetailsModel(
      id: json['id'] ?? '',
      companyName: json['companyName'] ?? '',
      jobTitle: json['jobTitle'] ?? '',
      salary: json['salary'] ?? '',
      location: json['location'] ?? '',
      address: json['address'] ?? '',
      postedDate: json['postedDate'] ?? '',
      distance: json['distance'] ?? '',
      description: json['description'] ?? '',
      responsibilities: List<String>.from(json['responsibilities'] ?? []),
      qualifications: List<String>.from(json['qualifications'] ?? []),
      companyIcon: json['companyIcon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'jobTitle': jobTitle,
      'salary': salary,
      'location': location,
      'address': address,
      'postedDate': postedDate,
      'distance': distance,
      'description': description,
      'responsibilities': responsibilities,
      'qualifications': qualifications,
      'companyIcon': companyIcon,
    };
  }

  // Factory method for creating sample data
  factory JobDetailsModel.sample() {
    return JobDetailsModel(
      id: '1',
      companyName: 'Google',
      jobTitle: '🩺 Senior Business Analytics',
      salary: '\$200 / Monthly',
      location: 'XYZ Hospital, 123 Main Street',
      address: 'XYZ Hospital, 123 Main Street',
      postedDate: '20 Jan 2025',
      distance: '5km',
      description:
          'We Are Seeking A Compassionate Nurse To Join Our Growing Department, Providing Quality Care To Patients In A Fast-Paced Environment.',
      responsibilities: [
        'Patient Care: Provide Direct Care To Patients, Monitor Vital Signs, Administer Medications, Etc.',
        'Documentation: Maintain Patient Records And Ensure They Are Up To Date.',
        'Collaboration: Work Closely With Doctors, Nurses, And Healthcare Teams.',
        'Emergency Response: Respond Quickly To Patient Needs And Emergencies.',
      ],
      qualifications: [
        'Education: Bachelor\'s Degree In Nursing (BSN)" Or "Associate Degree In Nursing (ADN)".',
        'Certifications: Certified Nursing Assistant (CNA)" Or "Board-Certified In Pediatrics.',
        'Experience: "2+ Years Of Experience In A Hospital Setting Preferred."',
        'Skills: Strong Communication Skills, Attention To Detail, Critical Thinking.',
      ],
      companyIcon: 'business',
    );
  }
}
