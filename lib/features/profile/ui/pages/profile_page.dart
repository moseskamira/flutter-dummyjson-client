import 'package:dummy_json_api/core/utils/common_functions.dart';
import 'package:dummy_json_api/core/utils/constants.dart';
import 'package:dummy_json_api/shared/providers/app_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/themes/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final baseStyle = CommonFunctions.baseStyle;
    final provider = context.watch<AppStateProvider>();
    final profile = provider.userProfile;
    final profilePic = profile?.image ?? '';
    final fullName = [
      profile?.firstName,
      profile?.lastName,
    ].where((name) => name?.trim().isNotEmpty == true).join(' ');
    final gender = profile?.gender ?? '';
    final userName = profile?.username ?? '';
    final age = profile?.age;
    final bloodType = profile?.bloodGroup ?? '';
    final email = profile?.email ?? '';
    final phone = profile?.phone ?? '';
    final height = profile?.height;
    final eyeColor = profile?.eyeColor ?? '';
    final hair = profile?.hair;
    final weight = profile?.weight;
    final maidenName = profile?.maidenName ?? '';
    final address = profile?.address;
    final company = profile?.company;
    final bank = profile?.bank;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.network(profilePic, width: 80, height: 80),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fullName,
                          style: baseStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(userName, style: baseStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [Icon(Icons.person), Text(gender)]),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Text('$age'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.bloodtype),
                                Text(bloodType),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text(
                      'Email',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      email,
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      'Phone',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      phone,
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Personal Information'),
                  ),
                  ListTile(
                    leading: Icon(Icons.height),
                    title: Text(
                      'Height',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      '$height',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.remove_red_eye),
                    title: Text(
                      'Eye Color',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      eyeColor,
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.woman),
                    title: Text(
                      'Hair Color',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      hair?.color ?? '',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.monitor_weight),
                    title: Text(
                      'Weight',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      '$weight',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Maiden Name',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      maidenName,
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.location_on_outlined),
                    title: Text('Address'),
                  ),
                  ListTile(
                    title: Text(
                      address?.address ?? '',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      address?.state ?? '',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.factory),
                    title: Text('Company'),
                  ),
                  ListTile(
                    title: Text(
                      company?.name ?? '',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      company?.title ?? '',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: defaultPadding),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Bank Details'),
                  ),
                  ListTile(
                    title: Text(
                      'Card Number',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      bank?.cardNumber ?? '',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Card Type',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      bank?.cardType ?? '',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Card Expire',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      bank?.cardExpire ?? '',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Currency',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      bank?.currency ?? '',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'IBAN',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                    subtitle: Text(
                      bank?.iban ?? '',
                      style: baseStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
