import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zasulehry_job_seeker/core/component/appbar/common_app_bar.dart';
import 'package:zasulehry_job_seeker/core/constants/app_string.dart';
import 'package:zasulehry_job_seeker/core/utils/extensions/extension.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/controller/appointments_controller.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/widgets/appointment_card_widget.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/widgets/appointment_tab_widget.dart';
import 'package:zasulehry_job_seeker/features/jobseeker/appointments/presentation/widgets/bottom_action_buttons.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    Get.put(AppointmentsController());

    return Scaffold(
      appBar: const CommonAppBar(title: AppString.appointments),
      body: Column(
        children: [
          // Filter Tabs
          const AppointmentTabWidget(),

          // Appointments List
          Expanded(
            child: GetBuilder<AppointmentsController>(
              builder: (controller) => SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(children: _buildAppointmentsList(controller)),
              ),
            ),
          ),

          // Bottom Action Buttons
          const BottomActionButtons(),
        ],
      ),
    );
  }

  List<Widget> _buildAppointmentsList(AppointmentsController controller) {
    final appointments = controller.getCurrentAppointments();
    List<Widget> widgets = [];

    for (int i = 0; i < appointments.length; i++) {
      if (i > 0) widgets.add(16.height);

      widgets.add(
        AppointmentCardWidget(
          name: appointments[i]['name'],
          date: appointments[i]['date'],
          time: appointments[i]['time'],
          status: appointments[i]['status'],
          statusColor: appointments[i]['statusColor'],
          showActions: appointments[i]['showActions'],
          isConfirmed: appointments[i]['isConfirmed'],
          isCancelled: appointments[i]['isCancelled'] ?? false,
        ),
      );
    }

    return widgets;
  }
}
