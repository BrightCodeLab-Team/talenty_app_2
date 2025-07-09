import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:logger/logger.dart';

class LocalizationService extends Translations {
  final log = Logger();
  static getLocalizedKey(String key) {
    String currentLanguageCode = Get.locale!.languageCode;
    Logger().d('Localized key is: ${key}_$currentLanguageCode');
    return '${key}_$currentLanguageCode';
  }

  @override
  Map<String, Map<String, String>> get keys {
    const Map<String, String> english = {
      "hello": "Hello world!",
      'choose_one': 'Choose one:',
      'i_am_candidate': "I am a candidate",
      'i_am_company_or_recruiter': 'I am a company or recruiter',
      'header_part1': 'The ',
      'header_part2': '1st APP',
      'header_part3': ' job',
      'header_part4': ' created for young',
      'header_part5': ' people',
      // Candidate Screens
      'candidate_onboard_title_1': 'Welcome to Talenty',
      'candidate_onboard_desc_1':
          'Connect to top opportunities with a single swipe and match with companies in real time.',
      'candidate_onboard_title_2': 'Instant Interviews',
      'candidate_onboard_desc_2':
          'With our integrated video-conferencing, enjoy on-the-spot interviews with no waits or lengthy processes.',
      'candidate_onboard_title_3': 'Find Job Openings',
      'candidate_onboard_desc_3':
          'Showcase your profile, chat instantly with recruiters, and take the next step in your career from anywhere. Your future begins with a match!',
      'candidate_onboard_title_4': 'Match Instantly',
      'candidate_onboard_desc_4':
          'Swipe to match with companies seeking your talent and join immediate video-call interviews. Welcome to Talenty!',

      // Recruiter Screens
      'recruiter_onboard_title_1': 'Welcome to Talenty',
      'recruiter_onboard_desc_1':
          'In TALENTY you can create job postings, manage candidates, schedule interviews, track selection progress, and connect with top profiles—all in one place.',
      'recruiter_onboard_title_2': 'Post Job Openings',
      'recruiter_onboard_desc_2':
          'Publish listings and tap into a network of talented young professionals ready to join your team.',
      'recruiter_onboard_title_3': 'Conduct Video Calls',
      'recruiter_onboard_desc_3':
          'Host instant video calls to quickly and easily evaluate applicants.',
      'recruiter_onboard_title_4': 'Application Tracking',
      'recruiter_onboard_desc_4':
          'See how many applications each job has received and optimize your hiring process.',
      // Continue Button
      'btn_continue': 'Continue',
      // Login screen
      'login_tagline_candidate': 'Your talent. Your match. Your job, today.',
      'login_tagline_recruiter':
          'Your bridge between young talent and the working world.',
      'login_title': 'Log In',
      'btn_candidate': 'I am a candidate',
      'btn_recruiter': 'I am a company or recruiter',
      'label_email': 'Email',
      'label_required': '*required',
      'hint_email': 'Enter your email',
      'label_password': 'Password',
      'hint_password': 'Enter your password',
      'enterValidEmail': 'Please enter a valid email',
      'invalidEmail': 'Invalid email address',
      'enterValidPassword': 'Please enter a password',
      'enterValidConfirmPassword': 'Please enter a confirm password',
      'invalidPassword': 'Password must be at least 8 characters',
      'btn_google': 'Sign in with Google',
      'btn_apple': 'Sign in with Apple',
      'no_account': "Don't have an account? ",
      'action_create_account': 'Create account',
      'action_register_company': 'Register your company.',
      'login_recruiter_prefix': "If you're a ",
      'login_recruiter_highlight': 'recruiter',
      'login_recruiter_suffix':
          ', ask your company to assign you credentials and enter them to access your recruiter account.',
      //Register Account
      'register_company_title': 'Create Company Account',
      'register_company_description':
          'Set up your company account by entering an email address and a secure password. Only companies may register here.',
      'register_company_password_info':
          'Create a secure password of at least 8 characters—including uppercase, lowercase, numbers, and symbols.',
      'register_company_confirm_password_label': 'Confirm Password',
      'register_company_confirm_password_hint': 'Confirm your password',
      // OTP Screen
      'otp_verify_title': 'Verify your email',
      'otp_instruction': 'Enter the code we sent to',
      'otp_resend_timer': 'Resend code in ',
      'passwordsDoNotMatch': 'Passwords do not match',
      'please_enter_6_digit_code': 'Please enter the full 6-digit code',

      // NotificationPermissionScreen
      'notif_title': 'Stay informed at all times',
      'notif_body':
          'Enable notifications to keep up with important news, reminders, and updates to your account.',
      'btn_allow': 'Allow',
      'btn_not_now': 'Not now',
      // CameraPermissionScreen
      'camera_title': 'Camera access permission',
      'camera_body_part1':
          'We need access to your camera so you can take photos directly from the app. ',
      'camera_body_mandatory': 'This permission is mandatory',
      'camera_body_part3':
          ', as we will use your pictures only for features related to your profile or activity within the platform.',
      // ImagePermissionScreen
      'image_title': 'Gallery access permission',
      'image_body_part1':
          'We need access to your gallery so you can upload images from your device. ',
      'image_body_mandatory': 'This permission is mandatory',
      'image_body_part3':
          ', as we will use your photos only for features related to your profile or activity within the app.',
      // … Register Company Screen …
      'percent_0': '0%',
      'register_company_title_process': 'Register Company',
      'register_company_description_process':
          'Review and manage all information collected by your recruiters. '
          'View the history of job postings created by your team, distribute '
          'new opportunities efficiently, and maintain full control of the hiring '
          'process. Use this data to make more effective decisions and optimize '
          'each stage of the process from a single place.',
      'buisness_information': "Business Information",

      'buisness_description':
          "Complete the basic information to begin creating the company account.",
      'buisness_basic_informations':
          "Complete the basic information to begin creating your company account.",
      'your_company_name': "What is the name of the company?",
      'enter_company_name': "Write the name of the company?",
      'enter_your_company_name': "Enter your company name?",
      'enter_your_company_descrip': "Enter your company Description?",
      'help _message': "Help message?",
      'describe_the_company?': "How would you describe the company?",
      'help_message': "Help message?",
      'best_travel_experiences':
          "E.g.: We are the only company that guarantees the best travel experiences...",
      'uplod_company_logo': 'Do you upload the company logo?',
      'uplod_your_logo_in_png_or_jpg_format':
          "Upload your logo in png or jpg format (Optional)",
      'uplod_company_cover_image': "Upload a company cover image",

      ///
      /// 33.33% company screen
      ///
      'complete_your_company_info':
          'Complete your official company information to continue registration.',

      // … Business Information screen…
      'buisness_info_description':
          'Complete your company’s official information to continue with the registration.',
      'company_belong': "Which industry does the company belong to?",

      'select_option': "Select an option",
      'company_part_public_or_private_sector':
          "Is the company part of the public or private sector?",
      'select _option': "Select an option",
      'employs_curently_?':
          "How many employees does the company currently have?",
      'country_registration_rc':
          "What is the company’s Federal Taxpayer Registry (RFC)?",
      'rfc_number': "E.g., XEXX010101ABC",
      'invalid_rfc_format': 'Invalid RFC format. Example: ABC800101XYZ',
      'invalid_imss_format': 'Invalid IMSS format. Example: A1234567890',

      "field_required": "Field is Required",
      'company_registration_message':
          "A unique identification key assigned to individuals and companies for tax and legal purposes.",
      'company_registration_number_imss':
          "What is the company’s Social Security registration number (IMSS)?",
      'unique_identifier':
          "A unique identifier assigned to a company, required for registering employees and meeting labor obligations.",
      'corporate_name_comapany':
          "What is the company’s legal name or the full name of the individual with business activity?",
      'corporate_name_example': "E.g., Pacific Integrated Solutions, Inc.",
      'corporate_name_description':
          "Legal name with which your company is registered, it is used in billing, contracts and tax procedures.",

      // … Business location screen…
      'buisness_location': 'Business Location',
      'company_location': "Company Location",
      'enter_location':
          "Enter the location where your company's main office is located.",
      'fedral_company_located':
          "In which federal entity is the company located?",
      'select_an_option': 'Select an option',
      'where_company_located':
          'In which municipality or borough is the company located?',
      'out_side_number': 'Exterior Number',

      'inner_side_number': 'Interior Number',
      'optional': '(Optional)',
      'which_neighbour_vacancy_located':
          'In which neighborhood is the vacancy located?',

      'name_person': 'e.g., Romero de Terreros',
      'company_street_located': 'On which street is the company located?',
      'company_zip_code': "What is the company's zip code?",
      'e_g_0930': "Ex: 09430",
      'omega': 'e.g., Omega',

      ///
      /// Buisness profile
      ///
      "buisness_profile": "Business Profile",
      "buisness_profile_description":
          "The business profile can manage all profiles under its administration. In addition, it has the ability to create vacancies, consult relevant information about the hiring process and monitor all associated activities.",
      "buisness_profile_info": "Business Profile Information",
      "buisness_profile_info_description":
          "Complete your business profile with your basic information so candidates can get to know you.",
      "buisness_profile_info_enter_name": "First Name(s)",
      "buisness_profile_info_enter_write_your_name": "Enter your first name",
      "buisness_profile_info_enter_surname": "Last Name(s)",
      "buisness_profile_info_paternal_name": "Paternal Last Name",
      "buisness_profile_info_mother_name": "Maternal Last Name",
      "buisness_profile_info_postion_hold_in_company":
          "What is your position in the company?",
      "buisness_profile_info_administrative_minister":
          "E.g., Administrative Assistant",
      "buisness_profile_info_describe_your_self_professionally":
          "How would you describe yourself professionally?",
      "buisness_profile_info_describe_your_self_professionally_example":
          "E.g., I am a professional in administrative assistance, with experience in office management, scheduling coordination, and operational support.",

      // # Completa perfil reclutador - Section

      // ### Pagina informacion del reclutador - 50% Pt-1
      'time_label': '9:41',
      'complete_profile': 'Complete your profile',
      'accept_and_continue': 'Accept and continue',
      'complete_profile_description':
          'Complete your profile with your basic information so that candidates can get to know you.',
      'fifty_percent': '50%',
      'first_names': 'First name',
      'jessica': 'Jessica',
      'last_names_label': 'Last name',
      'gonzales': 'Gonzales',
      'cruz': 'Cruz',
      'What position do you hold in the company?':
          'What position do you hold in the company?',
      'E.g.: administrative assistant': 'E.g.: Administrative assistant',
      'How would you describe yourself professionally?':
          'How would you describe yourself professionally?',
      'E.g.: I am a professional in administrative assistance, with experience in office management, agenda coordination and operational support.':
          'E.g.: I am a professional in administrative assistance, with experience in office management, agenda coordination and operational support.',
      '0/500 characters': '0/500 characters',
      "description_limit_exceeded": "Description cannot exceed 500 characters",
      'by_continue':
          'By continuing, I confirm that I have read and accepted the ',
      'terms_and_condition': ' Terms and Conditions',
      'talenty_as_well': ' of Talenty, as well as the ',
      'privacy_policy': 'Privacy Policies.',
      //         ### Pagina informacion del reclutador - 50% Pt-2
      // ```dart
      'Human Resources': 'Human Resources',
      'I am a Human Resources professional with experience in recruiting and talent development. I focus on creating positive work environments.':
          'I am a Human Resources professional with experience in recruiting and talent development. I focus on creating positive work environments.',
      '144/500 characters': '144/500 characters',

      // ### Pagina informacion del reclutador - 100% Pt-1
      // ```dart
      'upload your photography': 'Upload your photography',
      'Photography for your profile': 'Photography for your profile',
      'upload_photo_complete_your_profile':
          'You can upload a photo to complete your profile. Remember to choose a clear and presentable image.',
      'confirm_button': 'Confirm',

      // Popup section
      'We recommend using a presentable, well-lit photograph.':
          'We recommend using a presentable, well-lit photograph.',
      'choose_from_library': 'Choose from library',
      'take_photo': 'Take photo',

      // ### Pagina informacion del reclutador - 100% Pt-3
      // ```dart
      'change_photo': 'Change photo',

      // # Menu reclutador - Section
      // ### Pagina Tutorial 1
      // ```dart
      'home': 'Home',
      'tips': 'Tips',
      'chats': 'Chats',
      'more': 'More',
      'talenty': 'Talenty',
      'You don`t have any active vacancies yet. Create one now to view them and start receiving applications.':
          'You don’t have any active vacancies yet. Create one now to view them and start receiving applications.',
      'Create vacancy': 'Create vacancy',
      'It all starts with a connection.': 'It all starts with a connection.',
      'My vacancies': 'My vacancies',
      'Your categories': 'Your categories',
      'Your_vacancies': 'Your vacancies',
      'Create a vacancy in just a few steps and find the ideal candidate for your company.':
          'Create a vacancy in just a few steps and find the ideal candidate for your company.',

      // ### Pagina Tutorial 2
      // ```dart
      'Search engine': 'Search engine',
      'Use the search engine to quickly find your created vacancies.':
          'Use the search engine to quickly find your created vacancies.',

      // ### Pagina Tutorial 3
      // ```dart
      'notifications': 'Notifications',
      'You have a new notification! Check the details in the app and stay up to date with updates.':
          'You have a new notification! Check the details in the app and stay up to date with updates.',

      // ### Pagina Tutorial 4
      // ```dart
      'navigation_bar': 'Navigation bar',
      'Easily navigate the app, access your Profile, discover Tips, communicate through the chat, and return to Home with a single tap.':
          'Easily navigate the app, access your Profile, discover Tips, communicate through the chat, and return to Home with a single tap.',

      // # Primera vez reclutador - Section
      // ### Pagina Home sin vacante
      // ```dart
      'Post your vacancy on TALENTY and multiply your chances of finding the ideal candidate.':
          'Post your vacancy on TALENTY and multiply your chances of finding the ideal candidate.',

      'Everything stars with a match': 'Everything starts with a match',

      'Your vacancies': 'Your vacancies',

      // ### Pagina Notificaciones - Pt 1
      '0 New': '0 New',
      'You don`t have any new notifications':
          'You don’t have any new notifications',

      // ### Pagina  Notificaciones - Pt 2
      // ```dart
      'Account Settings': 'Account Settings',
      'Change your email or update your password securely.':
          'Change your email or update your password securely.',
      'Change email': 'Change email',
      'Current email': 'Current email',
      'Enter password': 'Enter password',
      'New email': 'New email',
      'Confirm password': 'Confirm password',
      'Change password': 'Change password',
      'Current password': 'Current password',
      'New password': 'New password',
      'Create a strong password of at least 8 characters, including uppercase, lowercase, numbers, and symbols.':
          'Create a strong password of at least 8 characters, including uppercase, lowercase, numbers, and symbols.',
      'Confirm new password': 'Confirm new password',

      // ### Pagina Verificar email
      // ```dart
      'Verify your email': 'Verify your email',
      'Enter the code we sent to tucorreo@gmail.com':
          'Enter the code we sent to tucorreo@gmail.com',
      'Resend code in': 'Resend code in',

      // ### Pagina eliminar de favoritos - popup
      // ```dart
      'Done! Your password has been successfully changed. For security reasons, be sure to use your new password the next time you log in.':
          'Done! Your password has been successfully changed. For security reasons, be sure to use your new password the next time you log in.',
      'Aceptar': 'Accept',

      // ### Pagina Chats activos
      'You don`t have any new chats': 'You don’t have any new chats',

      // ### Pagina Tips reclu
      // ```dart
      'For your next interview:': 'For your next interview:',
      'Get ready for your next interview:':
          'Get ready for your next interview:',
      'Do your research about the company before talking to them.':
          'Do your research about the company before talking to them.',
      'Learn more': 'Learn more',
      'Research the company': 'Research the company',
      'Learn about its history, values, and key products.':
          'Learn about its history, values, and key products.',
      'Internet from \$400': 'Internet from \$400',
      'Discover our packages starting at \$400 and connect to the best internet in Mexico.':
          'Discover our packages starting at \$400 and connect to the best internet in Mexico.',
      'Develop your networking:': 'Develop your networking:',
      'Prepare a question': 'Prepare a question',
      'Show interest by asking about the position.':
          'Show interest by asking about the position.',
      'Dress appropriately': 'Dress appropriately',
      'Wear formal or professional clothing depending on the role.':
          'Wear formal or professional clothing depending on the role.',
      'With this series of videos, you`ll be guaranteed success in your next job interview.':
          'With this series of videos, you’ll be guaranteed success in your next job interview.',
      '10 videos': '10 videos',
      '25 minutes': '25 minutes',
      'Develop your CV as a professional:':
          'Develop your CV as a professional:',
      'The importance of a CV': 'The importance of a CV',
      'Choose a simple and easy-to-read design, and it is important to add your updated data.':
          'Choose a simple and easy-to-read design, and make sure to include your updated information.',
      'Detail your skills': 'Detail your skills',
      'Use keywords like "organized" or "proactive." Show that you`re unique!':
          'Use keywords like "organized" or "proactive." Show that you’re unique!',
      'Find here a collection of tips, best practices, and personalized recommendations to help you get the most out of the platform.':
          'Find here a collection of tips, best practices, and personalized recommendations to help you get the most out of the platform.',

      // ### Pagina Calendario
      // ```dart
      'Calendar': 'Calendar',
      'April': 'April',
      'SUN': 'SUN',
      'MON': 'MON',
      'TUE': 'TUE',
      'WED': 'WED',
      'THU': 'THU',
      'FRI': 'FRI',
      'SAT': 'SAT',
      'This calendar will show all the dates on which you have an assigned appointment.':
          'This calendar will show all the dates on which you have an assigned appointment.',

      // ### Pagina Editar nombre
      // ```dart
      'Delete Account': 'Delete Account',

      'Continue': 'Continue',
      'By deleting your account, all your personal data, activity history, conversations, job postings (if applicable), and any information associated with your profile will be permanently erased.':
          'By deleting your account, all your personal data, activity history, conversations, job postings (if applicable), and any information associated with your profile will be permanently erased.',
      'What happens when you delete your account?':
          'What happens when you delete your account?',
      'Your entire profile, including your name, email, photo, and any other personal information, will be removed.\nAll your conversations, matches, applications, scheduled interviews, and job postings (if you’re a recruiter) will be deleted with no possibility of recovery.\nIf you have active subscriptions, those will be canceled automatically.\nIf you are participating in any selection processes, companies will no longer see your profile and will not be able to contact you.':
          'Your entire profile, including your name, email, photo, and any other personal information, will be removed.\nAll your conversations, matches, applications, scheduled interviews, and job postings (if you’re a recruiter) will be deleted with no possibility of recovery.\nIf you have active subscriptions, those will be canceled automatically.\nIf you are participating in any selection processes, companies will no longer see your profile and will not be able to contact you.',
      'Can I reactivate my account afterward?':
          'Can I reactivate my account afterward?',
      'No. This action cannot be undone. If you decide to come back in the future, you must create a new account from scratch, with no prior history.':
          'No. This action cannot be undone. If you decide to come back in the future, you must create a new account from scratch, with no prior history.',
      'What happens to my data?': 'What happens to my data?',
      'All data is deleted in accordance with our privacy policy and data protection regulations. You can find more details in our [Privacy Policy] section.':
          'All data is deleted in accordance with our privacy policy and data protection regulations. You can find more details in our [Privacy Policy] section.',

      // ### Pagina Desbloquear popup
      // ```dart
      'Are you sure you want to delete your account?':
          'Are you sure you want to delete your account?',
      'This action is final.': 'This action is final.',
      'Delete': 'Delete',
      'Cancel': 'Cancel',

      // ### Pagina Menu reclutador
      // ```dart
      'Jessica González Cruz Perez': 'Jessica González Cruz Perez',
      'View Profile': 'View Profile',
      'My Account': 'My Account',
      'My Calendar': 'My Calendar',
      'Privacy and Security': 'Privacy and Security',

      'Privacy Notice': 'Privacy Notice',
      'Terms and Conditions': 'Terms and Conditions',
      'Account Management': 'Account Management',

      'Log Out': 'Log Out',
      'Home': 'Home',
      'Tips': 'Tips',
      'Chats': 'Chats',
      'More': 'More',

      // # Primera vez reclutador last screens
      // ### Pagina Perfil reclutador
      // ```dart
      'Position': 'Position',

      'Company': 'Company',
      'Viajes PREMIUM': 'Viajes PREMIUM',
      'Email': 'Email',
      'jessicagonzalez@viajespremium.com': 'jessicagonzalez@viajespremium.com',
      'I am a Human Resources professional with experience in recruitment and talent development. I focus on creating positive work environments.':
          'I am a Human Resources professional with experience in recruitment and talent development. I focus on creating positive work environments.',

      // ### Pagina Editar nombre
      // ```dart
      'Edit Information': 'Edit Information',
      'Name(s)': 'Name(s)',
      'Enter your Name(s)': 'Enter your Name(s)',
      'Last Name(s)': 'Last Name(s)',
      'Paternal Last Name': 'Paternal Last Name',
      'Maternal Last Name': 'Maternal Last Name',

      // ### Pagina Editar descripcion
      // ```dart
      'What position do you hold at the company?':
          'What position do you hold at the company?',
      'Eg: Administrative Assistant': 'Eg: Administrative Assistant',

      'Eg: I am a professional in administrative assistance, with \nexperience in office management, agenda coordination, and operational support.':
          'Eg: I am a professional in administrative assistance, with \nexperience in office management, agenda coordination, and operational support.',

      // ### Pagina Vacantes
      // ```dart
      'Vacancies': 'Vacancies',
      'About_us': 'About us',
      'Employees': 'Employees',
      'Viajes_Premium': 'Viajes Premium',
      'Tourism_Industry': 'Tourism Industry',
      'Web_Designer': 'Web Designer',
      'Coyoacán_CDMX': 'Coyoacán, CDMX',
      'We_are_looking_for_a_creative_and_detail_oriented_web_designer_to_design_attractive_functional_and_...':
          'We are looking for a creative and detail-oriented web designer to design attractive, functional, and ...',
      '2_weeks_ago': '2 weeks ago',
      '20_Matches': '20 Matches',
      'Salary_range_10000_to_15000': '10,000 - 15,000',
      'Onsite': 'Onsite',

      // ### Pagina informacion del reclutador
      // ```dart
      'Location_Coyoacán_CDMX': 'Coyoacán, CDMX',
      'Job_Description':
          'We are looking for a creative and detail-oriented web designer to design attractive, functional, and ...',
      'Posted': '2 weeks ago',
      'Matches': '20 Matches',
      'Salary_Range': '10,000 - 15,000',
      'Work_Type': 'Onsite',

      // ### Pagina Poner foto overlay
      // ```dart
      'We_recommend_using_a_presentable_and_well-lit_photograph.':
          'We recommend using a presentable and well-lit photograph.',
      'Choose_from_library': 'Choose from library',
      'Take_photo': 'Take photo',

      // ### Pagina informacion del reclutador - Photo
      // ```dart
      'Photo_for_your_profile': 'Photo for your profile',
      'You_can_upload_a_photo_so_that_your_profile_looks_complete._Remember_to_choose_a_clear_and_presentable_image.':
          'You can upload a photo so that your profile looks complete. Remember to choose a clear and presentable image.',
      'Confirm': 'Confirm',
      'Change_photo': 'Change photo',

      // # Crear vacante reclutador
      // ### Pagina informacion Basica
      // ```dart
      'Fill_in_the_basic_data_to_start_creating_your_vacancy.':
          'Fill in the basic data to start creating your vacancy.',
      'What_is_the_name_of_the_vacancy?': 'What is the name of the vacancy?',
      'Eg_Administrative_Assistant': 'E.g.: Administrative Assistant',
      'What_is_the_subcategory_of_the_vacancy?':
          'What is the subcategory of the vacancy?',
      'Eg:_Web_Design': 'E.g.: Web Design',
      'What_is_the_required_education_level?':
          'What is the required education level?',
      'Select_an_option': 'Select an option',
      'In_which_state_is_the_vacancy_located?':
          'In which state is the vacancy located?',
      'Which_borough_or_municipality_is_the_vacancy_located_in?':
          'Which borough or municipality is the vacancy located in?',
      'In_which_neighborhood_is_the_vacancy_located?':
          'In which neighborhood is the vacancy located?',
      'Eg:_Romero_de_Terreros': 'E.g.: Romero de Terreros',

      // ### Pagina informacion del empleo
      // ```dart
      'Define_how_the_work_will_be_organized_for_the_vacancy':
          'Define how the work will be organized for the vacancy',
      'When_is_the_vacancy_start_date?': 'When is the vacancy start date?',
      'Eg:_March_08,_2025': 'E.g.: March 08, 2025',
      'What_will_be_the_work_modality_for_the_vacancy?':
          'What will be the work modality for the vacancy?',

      'Remote': 'Remote',
      'Hybrid': 'Hybrid',
      'What_is_the_work_schedule_for_this_vacancy?':
          'What is the work schedule for this vacancy?',

      'What_is_the_work_shift_for_this_vacancy?':
          'What is the work shift for this vacancy?',
      'Morning_shift': 'Morning shift',
      'Evening_shift': 'Evening shift',
      'Mixed_shift': 'Mixed shift',
      'Night_shift': 'Night shift',
      'Rotating_shift': 'Rotating shift',
      'Flexible_shift': 'Flexible shift',
      'Weekend_shift': 'Weekend shift',

      // ### Pagina informacion del empleo Pt2
      // ```dart
      'March_30,_2025': 'March 30, 2025',
      'When_will_your_vacancy_posting_end?':
          'When will your vacancy posting end?',
      'June_30,_2025': 'June 30, 2025',
      'Your_vacancy_will_be_active_for_90_days_from_the_start_date.Afterwards_it_will_close_automatically.But_don’t_worry!_You_can_reopen_it_whenever_you_want.':
          'Your vacancy will be active for 90 days from the start date. Afterwards, it will close automatically. But don’t worry! You can reopen it whenever you want.',

      // ### Pagina Popup - Guardar proceso
      // ```dart
      'Save_process': 'Save process',
      'Your_information_will_be_saved_so_you_can_complete_the_process_later.':
          'Your information will be saved so you can complete the process later.',

      // ### Pagina informacion del reclutador
      // ```dart
      'Job_Details': 'Job Details',
      'Save': 'Save',
      'Add_the_detailed_job_information.': 'Add the detailed job information.',
      'When_can_the_candidate_start?': 'When can the candidate start?',

      'Does_this_vacancy_require_previous_work_experience?':
          'Does this vacancy require previous work experience?',
      'Which_will_be_the_working_days?': 'Which will be the working days?',

      'What_is_the_schedule_of_the_vacancy?':
          'What is the schedule of the vacancy?',
      'Start_time': 'Start time',
      'Hours': 'Hours',
      'Minutes': 'Minutes',
      'End_time': 'End time',
      'Do_you_have_additional_specifications_about_the_schedule?':
          'Do you have additional specifications about the schedule?',
      'Eg:_The_working_days_are_Monday_to_Friday_from_8:00_am_to_9:00_pm_and_Saturdays_from_8:00_am_to_1:00_pm':
          'E.g.: The working days are Monday to Friday from 8:00 am to 9:00 pm and Saturdays from 8:00 am to 1:00 pm',
      '0/200_characters': '0/200 characters',

      // ### Pagina Sueldo y prestaciones
      // ```dart
      'Salary,_Benefits_and_Perks': 'Salary, Benefits and Perks',

      'Specify_the_offered_salary_as_well_as_the_benefits_and_perks_included_in_the_vacancy.':
          'Specify the offered salary as well as the benefits and perks included in the vacancy.',

      'Minimum': 'Minimum',
      'to': 'to',
      'What_will_be_the_Payment_Frequency?':
          'What will be the Payment Frequency?',

      'What_benefits_and_perks_does_this_vacancy_offer?':
          'What benefits and perks does this vacancy offer?',
      'Write_the_benefits_and/or_perks_of_your_vacancy.  \nSocial_security\nVacation\nChristmas_bonus\nVacation_bonus':
          'Write the benefits and/or perks of your vacancy.\nSocial security\nVacation\nChristmas bonus\nInfonavit\nVacation bonus',
      '0/2000_characters': '0/2000 characters',
      'What_requirements_must_the_candidate_meet?':
          'What requirements must the candidate meet?',
      'Write_the_requirements_for_your_vacancy.               \nPrevious_experience_in_administrative_tasks \nProficiency_in_Office_suite \nOrganizational_and_attention_to_detail_skills\nGood_spelling_and_writing':
          'Write the requirements for your vacancy.\nPrevious experience in administrative tasks\nProficiency in Office suite\nOrganizational and attention to detail skills\nGood spelling and writing',

      // ###  Habilidades
      // ```dart
      '💪_Resilience': '💪 Resilience',
      '💡_Critical_thinking': '💡 Critical Thinking',
      '🧠_Problem_solving': '🧠 Problem Solving',
      '🕊️_Empathy': '🕊️ Empathy',
      '🗣️_Assertive_communication': '🗣️ Assertive Communication',
      '🧘‍️_Stress_management': '🧘‍️ Stress Management',
      '🚀_Proactivity': '🚀 Proactivity',
      '🤝_Teamwork': '🤝 Teamwork',
      '💬_Active_listening': '💬 Active Listening',
      '💻_Programming': '💻 Programming',
      '🎨_Graphic_design': '🎨 Graphic Design',
      '💻_Use_of_Artificial_Intelligence': '💻 Use of Artificial Intelligence',
      '🌐_Web_design': '🌐 Web Design',
      '🏆_Self-discipline': '🏆 Self-Discipline',
      '⏰_Time_management': '⏰ Time Management',
      '🔄_Adaptability': '🔄 Adaptability',
      '🎯_Results_orientation': '🎯 Results Orientation',
      '🧩_Negotiation_skills': '🧩 Negotiation Skills',
      '🖥️_Database_management': '🖥️ Database Management',
      '🔧_Maintenance_and_technical_support':
          '🔧 Maintenance and Technical Support',
      '📈_Data_analysis': '📈 Data Analysis',
      '🧠_Machine_Learning_/_AI': '🧠 Machine Learning / AI',
      '⚙️_Software_engineering': '⚙️ Software Engineering',
      '🏗️_Project_management': '🏗️ Project Management',

      // ### Pagina Habilidades
      // ```dart
      'Required_Skills': 'Required Skills',
      'Select_the_skills_that_best_describe_the_ideal_candidate_for_this_vacancy.':
          'Select the skills that best describe the ideal candidate for this vacancy.',
      'Filter_by_skill_type': 'Filter by Skill Type',
      'Human_skills': 'Human Skills',
      'Technical_skills': 'Technical Skills',

      // ### Pagina Descripcion del sueldo
      // ```dart
      'Describe_the_type_of_job_you_are_offering_in_a_clear_and_respectful_manner.':
          'Describe the type of job you are offering in a clear and respectful manner.',
      'Before_continuing,_make_sure_that_your_content_complies_with_the_following_rules:\nIt_must_not_violate_any_law.\nIt_must_not_contain_offensive,_discriminatory,_or_inappropriate_language.\nIt_must_not_include_false,_misleading,_or_incomplete_information.\nThe_content_must_be_clear,_truthful,_and_professional.':
          'Before continuing, make sure your content complies with the following rules:\nIt must not violate any law.\nIt must not contain offensive, discriminatory, or inappropriate language.\nIt must not include false, misleading, or incomplete information.\nThe content must be clear, truthful, and professional.',
      'How_would_you_describe_this_position?':
          'How would you describe this position?',
      'Eg:_We_are_looking_for_a_responsible_and_organized_Administrative_Assistant_to_support_operational_and_office_tasks._Their_main_role_will_be_to_manage_documentation,_coordinate_schedules,_answer_calls,_and_provide_support_to_the_team_in_daily_administrative_activities...':
          'E.g.: We are looking for a responsible and organized Administrative Assistant to support operational and office tasks. The main responsibilities include managing documentation, coordinating schedules, answering calls, and supporting the team in daily administrative activities...',

      // ### Pagina Resumen de datos
      // ```dart
      'Edit_vacancy': 'Edit Vacancy',
      'Vacancy_photo': 'Vacancy Photo',
      'basic_information': 'Basic Information',
      'Vacancy_name': 'Vacancy Name',
      'Web_designer': 'WEB DESIGNER',
      'Category': 'Category',
      'Art_and_design': 'Art and Design',
      'State': 'State',
      'Mexico_City': 'Mexico City',
      'Municipality_or_borough': 'Municipality or Borough',
      'Coyoacán': 'Coyoacán',
      'Neighborhood': 'Neighborhood',
      'Romero_de_Terreros': 'Romero de Terreros',
      'Job_information': 'Job Information',
      'Vacancy_start_and_end_date': 'Vacancy Start and End Date',
      'From_March_30,_2025_to_June_30,_2025':
          'From March 30, 2025 to June 30, 2025',
      'Vacancy_modality': 'Vacancy Modality',

      'Vacancy_working_hours': 'Working Hours',
      'Full_time': 'Full-Time',
      'Vacancy_shift': 'Shift Type',
      'Part_time': 'Part-Time',
      'Job_details': 'Job Details',
      'Candidate_incorporation': 'Candidate Start Date',
      'Immediate_incorporation': 'Immediate Incorporation',
      'Assigned_working_days': 'Assigned Working Days',

      'Entry_time.': 'Entry Time:',
      '09:00__AM': '09:00 AM',
      'Exit_time.': 'Exit Time:',
      '07:00__PM': '07:00 PM',
      '8_hour_shift': '8-Hour Shift',
      'Previous_work_experience': 'Previous Work Experience',
      'No': 'No',

      'Salary': 'Salary',
      'Between_10,000_MXN_to_15,000_MXN': 'Between 10,000 MXN to 15,000 MXN',
      'Payment_frequency': 'Payment Frequency',
      'Biweekly_(every_fortnight)': 'Biweekly (every fortnight)',
      'Benefits_and_perks': 'Benefits and Perks',
      'Write_the_benefits_and/or_perks_of_your_vacancy.  \nMedical_insurance.\nPaid_vacations.\nFlexible_schedule.\nTraining_and_professional_development\nPerformance_bonuses.\nCommissions.\nChristmas_bonus.\nSavings_fund.':
          'Write the benefits and/or perks of your vacancy.\nMedical insurance.\nPaid vacations.\nFlexible schedule.\nTraining and professional development.\nPerformance bonuses.\nCommissions.\nChristmas bonus.\nSavings fund.',

      'Requirements': 'Requirements',
      'Write_the_requirements_of_your_vacancy.               \nBachelor’s_in_Graphic_Design.\nIntermediate_English.\nProficiency_in_Adobe_(Illustrator,_Photoshop,_InDesign,_After_Effects).\nProficiency_in_Office_(Word,_Excel,_PowerPoint).\nIntermediate-advanced_knowledge_of_WordPress_and_basic_HTML.\nFamiliarity_with_printing_techniques_(Flexography).\nCreative,_organized,_detail-oriented,_team_player.':
          'Write the requirements of your vacancy.\nBachelor’s degree in Graphic Design.\nIntermediate English.\nProficiency in Adobe (Illustrator, Photoshop, InDesign, After Effects).\nProficiency in Office (Word, Excel, PowerPoint).\nIntermediate-advanced knowledge of WordPress and basic HTML.\nFamiliarity with printing techniques (Flexography).\nCreative, organized, detail-oriented, and a team player.',
      'Skills': 'Skills',
      '5/10_Selected_skills': '5/10 Selected Skills',
      'Vacancy_description': 'Vacancy Description',
      'Description': 'Description',
      'We_are_looking_for_a_creative_designer_with_experience_in_graphic_and_visual_design._The_ideal_candidate_must_have_skills_in_using_tools_such_as_Adobe_Photoshop,_Illustrator,_and_Figma,_and_be_able_to_create_attractive_visual_concepts_for_different_platforms._The_ability_to_work_independently_and_as_part_of_a_team,_adapting_to_the_project’s_needs_while_maintaining_a_consistent_brand_aesthetic,_will_be_valued.':
          'We are looking for a creative designer with experience in graphic and visual design. The ideal candidate must be skilled in using tools such as Adobe Photoshop, Illustrator, and Figma, and be able to create attractive visual concepts for different platforms. The ability to work independently and as part of a team, adapting to the project’s needs while maintaining a consistent brand aesthetic, will be valued.',
      'Preview': 'Preview',
      'Publish_vacancy': 'Publish Vacancy',
      'Data_summary': 'Data Summary',
      'Verify_that_all_entered_information_is_correct_before_proceeding.':
          'Verify that all entered information is correct before proceeding.',

      // ### Pagina Visualizacion de vacante
      // ```dart
      "This_is_how_candidates_will_see_your_vacancy":
          "This is how candidates will see your vacancy",
      "View_Profile": "View Profile",

      "Romero_de_Terreros,_Coyoacán,_Mexico_City":
          "Romero de Terreros, Coyoacán, Mexico City",
      "Full_time,_10_hour_shift": "Full-time, 10-hour shift",
      "Modality:_Onsite": "Modality: Onsite",
      "Working_days:_Monday_to_Saturday_from_09:00_to_19:00_hrs":
          "Working days: Monday to Saturday from 09:00 to 19:00 hrs",
      "Incorporation:_Can_start_immediately.":
          "Incorporation: Can start immediately.",
      "Payment_frequency:_Biweekly_(every_fortnight)":
          "Payment frequency: Biweekly (every fortnight)",
      "Previous_experience:_No": "Previous experience: No",

      "We_are_looking_for_a_creative_designer_with_experience_in_graphic_and_visual_design._The_ideal_candidate_must_have_skills_in_using_tools_such_as_Adobe_Photoshop,_Illustrator,_and_Figma,_and_be_able_to_create_attractive_visual_concepts_for_different_platforms._The_ability_to_work_independently_and_as_part_of_a_team,_adapting_to_project_needs_and_maintaining_a_consistent_brand_aesthetic,_will_be_valued.":
          "We are looking for a creative designer with experience in graphic and visual design. The ideal candidate must have skills in using tools such as Adobe Photoshop, Illustrator, and Figma, and be able to create attractive visual concepts for different platforms. The ability to work independently and as part of a team, adapting to project needs and maintaining a consistent brand aesthetic, will be valued.",
      "Required_skills": "Required skills",

      "Medical_insurance.\nPaid_vacations.\nFlexible_schedule.\nTraining_and_professional_development\nPerformance_bonuses.\nCommissions.\nChristmas_bonus.\nSavings_fund.":
          "Medical insurance.\nPaid vacations.\nFlexible schedule.\nTraining and professional development.\nPerformance bonuses.\nCommissions.\nChristmas bonus.\nSavings fund.",

      "Bachelor’s_degree_in_Graphic_Design.\nIntermediate_English.\nProficiency_in_Adobe_(Illustrator,_Photoshop,_InDesign,_After_Effects).\nOffice_skills_(Word,_Excel,_PowerPoint).\nIntermediate-advanced_knowledge_of_WordPress_and_basic_HTML.\nFamiliarity_with_printing_techniques_(Flexography).\nCreative,_organized,_detail-oriented,_team_player.":
          "Bachelor’s degree in Graphic Design.\nIntermediate English.\nProficiency in Adobe (Illustrator, Photoshop, InDesign, After Effects).\nOffice skills (Word, Excel, PowerPoint).\nIntermediate-advanced knowledge of WordPress and basic HTML.\nFamiliarity with printing techniques (Flexography).\nCreative, organized, detail-oriented, team player.",
      "Schedule_specifications": "Schedule specifications",
      "Monday_to_Friday_from_9:00_am_to_7:00_pm,_Saturday_from_9:00_am_to_1:00_pm":
          "Monday to Friday from 9:00 am to 7:00 pm, Saturday from 9:00 am to 1:00 pm",

      // ### Pagina empleados
      // ```dart
      'About_Us': 'About Us',

      'Jessica_Gonzáles_Cruz': 'Jessica Gonzáles Cruz',
      'Human_Resources': 'Human Resources',

      // ### Pagina Visualizacion de vacante Pt 2
      // ```dart
      '\$10,000_-_\$15,000_MXN': '\$10,000 - \$15,000 MXN',

      'Full_time,_10-hour_shift': 'Full-time, 10-hour shift',

      'We_are_looking_for_a_creative_designer_with_experience_in_graphic_and_visual_design._The_ideal_candidate_should_have_skills_in_using_tools_such_as_Adobe_Photoshop,_Illustrator_and_Figma,_and_be_able_to_create_attractive_visual_concepts_for_different_platforms._The_ability_to_work_independently_and_as_part_of_a_team,_adapting_to_project_needs_while_maintaining_a_coherent_brand_aesthetic,_will_be_valued.':
          'We are looking for a creative designer with experience in graphic and visual design. The ideal candidate should have skills in using tools such as Adobe Photoshop, Illustrator and Figma, and be able to create attractive visual concepts for different platforms. The ability to work independently and as part of a team, adapting to project needs while maintaining a coherent brand aesthetic, will be valued.',

      'Medical_insurance.\nPaid_vacations.\nFlexible_schedule.\nTraining_and_professional_development,\nPerformance_bonuses.\nCommissions.\nChristmas_bonus.\nSavings_fund.':
          'Medical insurance.\nPaid vacations.\nFlexible schedule.\nTraining and professional development,\nPerformance bonuses.\nCommissions.\nChristmas bonus.\nSavings fund.',

      'Bachelor’s_degree_in_Graphic_Design.\nIntermediate_English.\nProficiency_in_Adobe_(Illustrator,_Photoshop,_InDesign,_After_Effects).\nOffice_suite_proficiency_(Word,_Excel,_PowerPoint).\nIntermediate-advanced_knowledge_of_WordPress_and_basic_HTML.\nFamiliarity_with_printing_techniques_(Flexography).\nCreative,_organized,_detail-oriented,_team_player.':
          'Bachelor’s degree in Graphic Design.\nIntermediate English.\nProficiency in Adobe (Illustrator, Photoshop, InDesign, After Effects).\nOffice suite proficiency (Word, Excel, PowerPoint).\nIntermediate-advanced knowledge of WordPress and basic HTML.\nFamiliarity with printing techniques (Flexography).\nCreative, organized, detail-oriented, team player.',

      // # Vacante - section
      // ### Pagina Home
      // ```dart
      "section_description":
          'In this section, you can view all the vacancies you have created yourself.',
      "your_categories": 'Your Categories',
      "your_vacancies": 'Your Vacancies',
      "my_vacancies": 'My Vacancies',
      "all": 'All',
      "art_and_design": 'Art and Design',
      "programming_and_technology": 'Programming and Technology',
      "create_vacancy": 'Create Vacancy',
      "vacancy": 'Vacancy',
      "web_designer": 'Web Designer',
      "active_vacancy": 'Active Vacancy',
      "start_label": 'Start:',
      "start_date": 'March/30/2025',
      "validity": 'Validity:',
      "June/30/2025": 'June/30/2025',
      "14_matches_found": '14 Matches Found',
      "explore_candidates": 'Explore Candidates',
      "vacancy_in_edit_mode": 'Vacancy in Edit Mode',

      // ### Ajuste vacante Popup
      // ```dart
      "renew_vacancy": 'Renew Vacancy',
      "pause_vacancy": 'Pause Vacancy',
      "finish_vacancy": 'Finish Vacancy',
      "delete_vacancy": 'Delete Vacancy',

      // ### Pagina Informacion del reclutador
      // ```dart
      "web_design": 'Web Design',
      "programming_intern": 'Programming Intern',
      "vacancy_deleted": 'Vacancy Deleted',
      "matches_found_50": '50 Matches Found',
      "matches_found_0": '0 Matches Found',

      // ### Pagina Informacion del reclutador
      // ```dart
      "delete_confirmation_question":
          'Are you sure you want to delete this vacancy?',
      "delete_irreversible_warning":
          'This action cannot be undone. The vacancy will be permanently removed from the platform. All history, matches, scheduled interviews, and any links to ongoing selection processes will be lost.',
      "confirm_delete_button": 'Delete',
      "cancel_button": 'Cancel',

      // ### Pagina Perfil reclutador
      // ```dart
      "save": 'Save',
      "what`s_the_vacancy_name?": "What's the name of the vacancy?",
      "14/30 characters": '14/30 characters',
      "category_prompt": 'What is the job category?',
      "state_prompt": 'Which state is the vacancy located in?',
      "state": 'Mexico City',
      "municipality_prompt": 'Which municipality is the vacancy located in?',
      "municipality": 'Coyoacán',
      "colony_prompt": 'Which neighborhood is the vacancy located in?',
      "colony": 'Romero de Terreros',
      "basic_info_instruction":
          'Complete the basic information to begin creating your vacancy.',
      "progress_percentage": '0%',
      "continue_button": 'Continue',

      // ### Pagina Sueldo y prestaciones
      // ```dart
      "job_information": 'Job Information',
      "Define how the work for the vacancy will be organized":
          'Define how the work for the vacancy will be organized',
      "progress_20_percent": '20%',
      "When is the start date for the vacancy?":
          'When is the start date for the vacancy?',
      "When will your vacancy posting end?":
          'When will your vacancy posting end?',
      "June 30, 2025": 'June 30, 2025',
      "Your position will be active for 90 days from the start date. After that, it will close automatically. But don't worry! You can reopen it whenever you want.":
          'Your vacancy will be active for 90 days from the start date. After that, it will automatically close. But don’t worry! You can reopen it whenever you want.',
      "What will the job description be for this vacancy?":
          'What will the work modality be for this vacancy?',
      "hybrid": 'Hybrid',
      "What are the working hours for this vacancy?":
          'What are the working hours for this vacancy?',
      "full_time": 'Full Time',
      "What is the work shift for this vacancy?":
          'What is the work shift for this vacancy?',
      "morning_shift": 'Morning Shift',

      // ### Pagina Descripcion del puesto
      // ```dart
      "salary_section_title": 'Salary, Benefits, and Perks',
      "salary_instruction":
          'Specify the offered salary, along with the benefits and perks included in the vacancy.',
      "progress_60_percent": '60%',
      "minimum_salary": 'Minimum',
      "\$10,000 MXN": '\$10,000 MXN',
      "maximum_salary": 'Maximum',
      "\$15,000 MXN": '\$15,000 MXN',
      "salary_range_separator": 'to',
      "payment_frequency_prompt": 'What will be the Payment Frequency?',
      "payment_frequency_value": 'Weekly (every week)',
      "benefits_prompt": 'What benefits and perks does this vacancy offer?',
      "Social_Security\nVacations\nChristmas_bonus\nVacation_bonus\nFood_vouchers\nHome office\nPaid courses\nFlexible hours":
          'Social Security\nVacations\nChristmas Bonus\nVacation Bonus\nFood Vouchers\nHome Office\nPaid Courses\nFlexible Hours',
      "benefits_character_count": '125/2000 characters',
      "requirements_prompt": 'What requirements must the candidate meet?',
      "Bachelor's Degree in Graphic Design. Intermediate English. Mastery of Adobe (Illustrator, Photoshop, InDesign, After Effects). Proficiency in Office (Word, Excel, PowerPoint). Intermediate-advanced knowledge of WordPress and basic HTML skills. Familiarity with printing techniques (Flexography). Creative, organized, with attention to detail and the ability to work in a team.":
          'Bachelor\'s Degree in Graphic Design.\nIntermediate English.\nProficiency in Adobe (Illustrator, Photoshop,\nInDesign, After Effects).\nKnowledge of Office (Word, Excel, PowerPoint).\nIntermediate-Advanced knowledge of WordPress and basic HTML skills.\nFamiliarity with printing techniques\n(Flexography).\nCreative, organized, detail-oriented,\nand able to work in a team.',
      "requirements_character_count": '382/2000 characters',

      // ### Pagina Habilidades
      // ```dart
      "progress_80_percent": '80%',
      "required_skills": 'Required Skills',
      "Select the skills that best describe the ideal candidate for this position":
          'Select the skills that best describe the ideal candidate for this position',
      "filter_by_skill_type": 'Filter by skill type',
      "human_skills": 'Human Skills',
      "technical_skills": 'Technical Skills',
      "0/10 selected": '0/10 Selected',
      "resilience": '💪 Resilience',
      "critical_thinking": '💡 Critical Thinking',
      "problem_solving": '🧠 Problem Solving',
      "empathy": '🕊️ Empathy',
      "assertive_communication": '🗣️ Assertive Communication',
      "stress_management": '🧘‍️ Stress Management',
      "proactivity": '🚀 Proactivity',
      "teamwork": '🤝 Teamwork',
      "active_listening": '💬 Active Listening',
      "programming": '💻 Programming',
      "graphic_design": '🎨 Graphic Design',
      "ai_usage": '💻 Use of Artificial Intelligence',
      "self_discipline": '🏆 Self-Discipline',
      "time_management": '⏰ Time Management',
      "adaptability": '🔄 Adaptability',
      "result_oriented": '🎯 Results-Oriented',
      "negotiation": '🧩 Negotiation Skills',
      "database_management": '🖥️ Database Management',
      "technical_support": '🔧 Technical Support & Maintenance',
      "data_analysis": '📈 Data Analysis',
      "machine_learning": '🧠 Machine Learning / AI',
      "software_engineering": '⚙️ Software Engineering',
      "project_management": '🏗️ Project Management',
    };

    const Map<String, String> spanish = {
      "awais": "awais khan",
      "hello": '¡Hola mundo!',
      'choose_one': 'Elige uno:',
      'i_am_candidate': 'Soy candidato',
      'i_am_company_or_recruiter': 'Soy empresa o reclutador',
      'header_part1': 'La ',
      'header_part2': '1.ª APP',
      'header_part3': ' laboral',
      'header_part4': ' creada para jóvenes',
      'header_part5': ' jóvenes',
      // Candidate Screens
      'candidate_onboard_title_1': 'Bienvenido a Talenty',
      'candidate_onboard_desc_1':
          'Conecta con las mejores oportunidades a un solo swipe y haz match con empresas en tiempo real.',
      'candidate_onboard_title_2': 'Entrevistas inmediatas',
      'candidate_onboard_desc_2':
          'Gracias a nuestra función de videoconferencia integrada, podrás tener entrevistas inmediatas, sin esperas ni procesos largos.',
      'candidate_onboard_title_3': 'Encuentra vacantes',
      'candidate_onboard_desc_3':
          'Con Talenty, presenta tu perfil, conversa con reclutadores al instante y da el siguiente paso en tu carrera desde cualquier lugar. ¡Tu futuro comienza con un match!',
      'candidate_onboard_title_4': 'Haz match al instante',
      'candidate_onboard_desc_4':
          'Con solo un swipe, haz match con empresas que buscan tu talento y accede a entrevistas inmediatas por videollamada. ¡Bienvenid@ a Talenty!',
      // Recruiter Screens
      'recruiter_onboard_title_1': 'Bienvenido a Talenty',
      'recruiter_onboard_desc_1':
          'En TALENTY podrás crear vacantes, visualizar y gestionar candidatos, agendar entrevistas, dar seguimiento al proceso de selección y conectar con los mejores perfiles para tu empresa. Todo lo que necesitas para facilitar y optimizar tu proceso de contratación, en un solo lugar.',
      'recruiter_onboard_title_2': 'Publica Vacantes',
      'recruiter_onboard_desc_2':
          'Publica ofertas de empleo y accede a una red de jóvenes talentosos listos para unirse a tu empresa.',
      'recruiter_onboard_title_3': 'Realiza Videollamadas',
      'recruiter_onboard_desc_3':
          'Realiza videollamadas al instante y evalúa a los postulantes de forma rápida y sencilla.',
      'recruiter_onboard_title_4': 'Postulaciones',
      'recruiter_onboard_desc_4':
          'Revisa cuántas postulaciones ha recibido cada empleo y optimiza tu proceso de contratación.',
      // Continue Button
      'btn_continue': 'Continuar',
      // Login screen (original Spanish)
      'login_tagline_candidate': 'Tu talento. Tu match. Tu empleo, hoy.',
      'login_tagline_recruiter':
          'Tu puente entre el talento joven y el mundo laboral.',
      'login_title': 'Iniciar Sesión',
      'btn_candidate': 'Soy candidato',
      'btn_recruiter': 'Soy empresa o reclutador',
      'label_email': 'Correo',
      'label_required': '*obligatorio',
      'hint_email': 'Ingresa tu correo',
      'label_password': 'Contraseña',
      'hint_password': 'Ingresa tu Contraseña',
      'enterValidEmail': 'Por favor ingresa un correo válido',
      'invalidEmail': 'Dirección de correo inválida',
      'enterValidPassword': 'Por favor ingresa una contraseña',
      'enterValidConfirmPassword':
          'Por favor ingrese una contraseña de confirmación',
      'invalidPassword': 'La contraseña debe tener al menos 8 caracteres',
      'btn_google': 'Iniciar sesión con Google',
      'btn_apple': 'Iniciar sesión con Apple',
      'no_account': '¿No tienes una cuenta? ',
      'action_create_account': 'Crear cuenta',
      'action_register_company': 'Registra a tu empresa.',
      'login_recruiter_prefix': 'Si eres un ',
      'login_recruiter_highlight': 'reclutador',
      'login_recruiter_suffix':
          ', pide a tu empresa que te asigne las credenciales, e ingrésalas para acceder a tu cuenta de reclutador.',
      // Register Account
      'register_company_title': 'Crear cuenta de empresa',
      'register_company_description':
          'Crea la cuenta de la empresa ingresando un correo electrónico y una contraseña segura. Solo las empresas pueden registrarse en esta sección.',
      'register_company_password_info':
          'Crea una contraseña segura de al menos 8 caracteres, incluyendo mayúsculas, minúsculas, números y símbolos.',
      'register_company_confirm_password_label': 'Confirmar Contraseña',
      'register_company_confirm_password_hint': 'Confirma tu contraseña',
      // OTP Screen
      'otp_verify_title': 'Verifica tu correo',
      'otp_instruction': 'Ingresa el código que mandamos a ',
      'otp_resend_timer': 'Reenviar código en ',
      'passwordsDoNotMatch': 'Las contraseñas no coinciden',
      'please_enter_6_digit_code':
          'Por favor, introduzca el código completo de 6 dígitos',
      // NotificationPermissionScreen
      'notif_title': 'Mantente informado en todo momento',
      'notif_body':
          'Activa las notificaciones para mantenerte al día con novedades importantes, recordatorios y actualizaciones de tu cuenta.',
      'btn_allow': 'Permitir',
      'btn_not_now': 'Ahora no',
      // CameraPermissionScreen
      'camera_title': 'Permiso para acceder a tu cámara',
      'camera_body_part1':
          'Necesitamos acceso a tu cámara para que puedas tomar fotos directamente desde la app. ',
      'camera_body_mandatory': 'Este permiso es obligatorio',
      'camera_body_part3':
          ', ya que utilizaremos las imágenes únicamente para funciones relacionadas con tu perfil o actividad dentro de la plataforma.',
      // ImagePermissionScreen
      'image_title': 'Permiso para acceder a tu galería',
      'image_body_part1':
          'Necesitamos acceso a tu galería para que puedas subir imágenes desde tu dispositivo. ',
      'image_body_mandatory': 'Este permiso es obligatorio',
      'image_body_part3':
          ', ya que utilizaremos tus fotos únicamente para funciones relacionadas con tu perfil o actividad dentro de la app.',
      // … Register Company Screen …
      'percent_0': '0%',
      'register_company_title_process': 'Registrar Empresa',
      'register_company_description_process':
          'Revisa y gestiona toda la información recopilada por tus reclutadores. '
          'Visualiza el historial de vacantes creadas por tu equipo, distribuye '
          'nuevas oportunidades de forma eficiente y mantén el control total del '
          'proceso de contratación. Usa estos datos para tomar decisiones más '
          'efectivas y optimizar cada etapa del proceso desde un solo lugar.',
      'buisness_information': "Información Empresarial",
      'buisness_description':
          "Completa los datos básicos para comenzar a crear la cuenta de la empresa.",
      'your_company_name': "¿Cuál es el nombre de la empresa?",
      'enter_company_name': "¿Escribe el nombre de la empresa?",
      'enter_your_company_name': "¿Ingresa el nombre de tu empresa?",
      'enter_your_company_descrip': "¿Ingresa la descripción de tu empresa?",

      'help _message': "¿Mensaje de ayuda?",
      'describe_the_company?': "¿Cómo describirías a la empresa?",
      'help_message': "¿Mensaje de ayuda?",
      'best_travel_experiences':
          "¿Ej: Somos la única empresa que garantiza las mejores experiencias de viaje...",
      'uplod_company_logo': "¿Sube el logotipo de la empresa",
      'uplod_your_logo_in_png_or_jpg_format':
          "¿Sube tu logo en formato png o jpg (opcional)",
      'uplod_company_cover_image': "¿Sube una imagen de portada de la empresa",

      // … Business Information screen…
      'buisness_info_description':
          'Complete la información oficial de su empresa para continuar con el registro.',
      'company_belong': "¿A qué industria pertenece la empresa?",

      'select_option': "Selecciona una opción",
      'company_part_public_or_private_sector':
          "¿La empresa pertenece al sector público o privado?",
      'select _option': "Selecciona una opción",
      'employs_curently_?': "¿Cuántos empleados tiene la empresa actualmente?",
      'country_registration_rc':
          "¿Cuál es el registro federal de contribuyentes (RFC) de la empresa?",
      'rfc_number': "Ej: XEXX010101ABC ",
      "field_required": "El campo es obligatorio",
      'invalid_rfc_format': 'Formato RFC inválido. Ejemplo: ABC800101XYZ',

      'invalid_imss_format': 'Formato IMSS inválido. Ejemplo: A1234567890',

      'company_registration_message':
          "Clave de identificación única asignada a personas y empresas para fines fiscales, tributarios y legales",
      'company_registration_number_imss':
          "¿Cuál es el número de registro patronal (IMSS) de la empresa?",
      'unique_identifier':
          "Identificador único asignado a una empresa necesario para registrar empleados y cumplir obligaciones laborales.",
      'corporate_name_comapany':
          "¿Cuál es la razón social de la empresa o el nombre completo de la persona física con actividad empresarial?",
      'corporate_name_example':
          "Ej: Soluciones Integrales del Pacífico, S.A. de C.V.",
      'corporate_name_description':
          "Nombre legal con el que está registrada tu empresa, se usa en facturación, contratos y trámites fiscales.",
      // … Business location screen…
      'buisness_location': 'Ubicacion Empresarial',
      'company_location': "Ubicación de la empresa",
      'enter_location':
          "Ingresa la ubicación donde se encuentra el corporativo principal de tu empresa.",
      'fedral_company_located':
          "¿En qué entidad federativa se encuentra la empresa?",
      'select_an_option': 'Selecciona una opción',
      'where_company_located':
          '¿Cuál es la alcaldía o municipio donde se encuentra la empresa?',
      'out_side_number': 'Número Exterior',

      'inner_side_number': 'Número Interior',
      'optional': '(Opcional)',
      'which_neighbour_vacancy_located':
          '¿En qué colonia se encuentra la vacante?',

      'name_person': 'Ej: Romero de Terreros',
      'company_street_located':
          '¿En qué calle se encuentra ubicada la empresa?',
      'e_g_0930': "Ej: 09430",
      'company_zip_code': '¿Cuál es el código postal de la empresa?',
      'omega': 'Ej: Omega',

      ///
      /// 33.33% company screen
      ///
      'complete_your_company_info':
          'Completa la información oficial de tu empresa para continuar con el registro.',

      ///
      /// Buisness profile
      ///
      "buisness_profile": "Perfil Empresarial",
      "buisness_profile_description":
          "El perfil empresarial puede gestionar todos los perfiles que se encuentren bajo su administración. Además, tiene la capacidad de crear vacantes, consultar información relevante del proceso de contratación y supervisar todas las actividades asociadas.",

      "buisness_profile_info": "Información del Perfil Empresarial",
      "buisness_profile_info_description":
          "Completa tu perfil empresarial con tus datos básicos para que los candidatos te conozcan.",
      "buisness_profile_info_enter_name": "Nombre(s)",
      "buisness_profile_info_enter_write_your_name": "Escribe tu(s) nombre(s)",
      "buisness_profile_info_enter_surname": "Apellidos",
      "buisness_profile_info_paternal_name": "Apellido paterno",
      "buisness_profile_info_mother_name": "Apellido materno",
      "buisness_profile_info_postion_hold_in_company":
          "¿Qué cargo ocupas en la empresa?",
      "buisness_profile_info_administrative_minister":
          "Ex: Administrative assistant",
      "buisness_profile_info_describe_your_self_professionally":
          "¿Cómo te describirías profesionalmente?",
      "buisness_profile_info_describe_your_self_professionally_example":
          "Ej: Soy profesional en asistencia administrativa, con experiencia en gestión de oficinas, coordinación de agendas y apoyo operativo.",

      ///
      //       # Completa perfil reclutador - Section

      // ### Pagina informacion del reclutador - 50% Pt-1
      // ```dart
      'time_label': '9:41',
      'complete_profile': 'Completa tu perfil',
      'accept_and_continue': 'Aceptar y continuar',
      'complete_profile_description':
          'Completa tu perfil con tus datos básicos para que los candidatos te conozcan.',
      'fifty_percent': '50%',
      'talenty': 'Talenty',
      'first_names': 'Nombre(s)',
      'jessica': 'Jessica',
      'last_names_label': 'Apellidos',
      'gonzales': 'Gonzáles',
      'cruz': 'Cruz',
      'What position do you hold in the company?':
          '¿Qué cargo ocupas en la empresa?',
      'E.g.: administrative assistant': 'Ej: Asistente administrativo',
      'How would you describe yourself professionally?':
          '¿Cómo te describirías profesionalmente?',
      'E.g.: I am a professional in administrative assistance, with experience in office management, agenda coordination and operational support.':
          'Ej: Soy profesional en asistencia administrativa, con \nexperiencia en gestión de oficinas, coordinación de \nagendas y apoyo operativo.',
      '0/500 characters': '0/500 caracteres',
      "description_limit_exceeded":
          "La descripción no puede exceder los 500 caracteres",
      "Description cannot exceed 500 characters'"
              'by_continue':
          'Al continuar, confirmo que he leído y acepto los ',
      'terms_and_condition': ' Términos y Condiciones',
      'talenty_as_well': ' de Talenty, así como las ',
      'privacy_policy': 'Políticas de Privacidad.',

      // ### Pagina informacion del reclutador - 50% Pt-2
      // ```dart
      'Human Resources': 'Recursos Humanos',
      'I am a Human Resources professional with experience in recruiting and talent development. I focus on creating positive work environments.':
          'Soy  profesional en Recursos Humanos con experiencia en reclutamiento y desarrollo de talento. Me enfoco en crear ambientes laborales positivos.',
      '144/500 characters': '144/500 caracteres',

      // ### Pagina informacion del reclutador - 100% Pt-1
      // ```dart
      'upload your photography': 'Sube tu fotografia',
      'Photography for your profile': 'Fotografía para tu perfil',
      'upload_photo_complete_your_profile':
          'Puedes subir una foto para que tu perfil luzca completo. Recuerda elegir una imagen clara y presentable.',
      'confirm_button': 'Confirmar',

      // ### Pagina informacion del reclutador - 100% popup
      // ```dart
      'We recommend using a presentable, well-lit photograph.':
          'Te recomendamos utilizar una fotografía presentable y bien iluminada.',
      'choose_from_library': 'Elegir de la biblioteca',
      'take_photo': 'Tomar foto',

      // ### Pagina informacion del reclutador - 100% Pt-2 photo
      // ```dart
      'loading': 'Cargando',

      // ### Pagina informacion del reclutador - 100% Pt-3
      // ```dart
      'change_photo': 'Cambiar foto',

      // # Menu reclutador - Section
      // ### Pagina Tutorial 1
      // ```dart
      'home': 'Inicio',
      'tips': 'Tips',
      'chats': 'Chats',
      'more': 'Más',
      'You don`t have any active vacancies yet. Create one now to view them and start receiving applications.':
          'Aún no tienes vacantes activas. Crea una ahora para visualizarlas y empezar a recibir postulaciones.',
      'Create vacancy': 'Crear Vacante',
      'It all starts with a connection.': 'Todo empieza con una conexión.',
      'My vacancies': 'Mis Vacantes',
      'Your categories': 'Tus Categorías',
      'Your_vacancies': 'Tus Vacantes',
      // 'Create vacancy': 'Crear Vacante', // Removed duplicate key
      'Create a vacancy in just a few steps and find the ideal candidate for your company.':
          'Crea una vacante en pocos pasos y encuentra al candidato ideal para tu empresa.',

      // ### Pagina Tutorial 2
      // ```dart
      'Search engine': 'Buscador',
      'Use the search engine to quickly find your created vacancies.':
          'Utiliza el buscador para encontrar rápidamente tus vacantes creadas.',

      // ### Pagina Tutorial 3
      // ```dart
      'notifications': 'Notificaciones',
      'You have a new notification! Check the details in the app and stay up to date with updates.':
          '¡Tienes una nueva notificación! Revisa los detalles en la app y mantente al tanto de las actualizaciones',

      // ### Pagina Tutorial 4
      // ```dart
      'navigation_bar': 'Barra de Navegación',
      'Easily navigate the app, access your Profile, discover Tips, communicate through the chat, and return to Home with a single tap.':
          'Navega fácilmente por la app accede a tu Perfil, descubre Tips, conversa en el Chat y vuelve al Home con un solo toque.',

      // # Primera vez reclutador - Section
      // ### Pagina Home sin vacante
      // ```dart
      'Post your vacancy on TALENTY and multiply your chances of finding the ideal candidate.':
          'Publique su vacante en TALENTY y multiplique sus oportunidades de encontrar al candidato ideal.',

      'Everything stars with a match': 'Todo empieza con un match.',

      'Your vacancies': 'Tus Vacantes',

      // ### Pagina Notificaciones - Pt 1
      // ```dart
      '0 New': '0 Nuevos',

      'You don`t have any new notifications':
          'Aún no tienes notificaciones nuevas.',

      // ### Pagina  Notificaciones - Pt 2
      // ```dart
      'Account Settings': 'Configuración de cuenta',
      'Change your email or update your password securely.':
          'Modifica tu correo electrónico o actualiza tu contraseña de forma segura.',
      'Change email': 'Cambiar correo',
      'Current email': 'Correo actual',
      'Enter password': 'Ingresa tu contraseña',
      'New email': 'Nuevo correo',
      'Confirm password': 'Confirma tu contraseña',
      'Change password': 'Cambiar contraseña',
      'Current password': 'Contraseña actual',
      'New password': 'Nueva contraseña',
      'Create a strong password of at least 8 characters, including uppercase, lowercase, numbers, and symbols.':
          'Crea una contraseña segura de al menos 8 caracteres, incluyendo mayúsculas, minúsculas, números y símbolos.',
      'Confirm new password': 'Confirmar nueva contraseña',

      // ### Pagina Verificar email
      // ```dart
      'Verify your email': 'Verifica tu correo',
      'Enter the code we sent to tucorreo@gmail.com':
          'Ingresa el código que mandamos a tucorreo@gmail.com',
      'Resend code in': 'Reenviar código en',

      //   // Página eliminar de favoritos - popup
      //   'Done! Your password has been successfully changed. For security reasons, be sure to use your new password the next time you log in.':
      //     '¡Listo! Tu contraseña ha sido cambiada correctamente. Por seguridad, asegúrate de usar tu nueva contraseña la próxima vez que inicies sesión.',
      //   'Aceptar': 'Aceptar',

      // // ### Pagina Chats activos
      // // ```dart
      // 'You don`t have any new chats': 'Aún no tienes chats nuevos',
      // 'Your vacancies': 'Tus vacantes',

      // // ### Pagina Tips reclu
      // // ```dart
      'For your next interview:': 'Para tu próxima entrevista:',
      'Get ready for your next interview:': 'Prepárate para la entrevista',
      'Do your research about the company before talking to them.':
          'Investiga acerca de la empresa antes de hablar con éllos.',
      'Learn more': 'Conoce más',
      'Research the company': 'Investiga la empresa',
      'Learn about its history, values, and key products.':
          'Conoce su historia, valores y productos clave.',
      'Internet from \$400': 'Internet desde \$400',
      'Discover our packages starting at \$400 and connect to the best internet in Mexico.':
          'Descubre nuestros paquetes desde \$400 y conéctate al mejor internet de México',
      'Develop your networking:': 'Desarrolla tu networking:',
      'Prepare a question': 'Prepara una pregunta',
      'Show interest by asking about the position.':
          'Demuestra interés preguntando sobre el puesto.',
      'Dress appropriately': 'Viste apropiadamente',
      'Wear formal or professional clothing depending on the role.':
          'Usa ropa formal o profesional según el rol.',
      'With this series of videos, you`ll be guaranteed success in your next job interview.':
          'Con ésta serie de vídeos tendrás un éxito asegurado en tu próxima entrevista de trabajo.',
      '10 videos': '10 Videos',
      '25 minutes': '25 mins',
      'Develop your CV as a professional:':
          'Elabora tu CV como un profesional:',
      'The importance of a CV': 'La importancia de un CV',
      'Choose a simple and easy-to-read design, and it is important to add your updated data.':
          'Elige un diseño simple y fácil de leer, además, es importante añadir tus datos actualizados',
      'Detail your skills': 'Detalla tus habilidades',
      'Use keywords like "organized" or "proactive." Show that you`re unique!':
          'Usa palabras clave como “organizado” o “proactivo”. ¡Muestra que eres único!',
      'Find here a collection of tips, best practices, and personalized recommendations to help you get the most out of the platform.':
          'Encuentra aquí una recopilación de consejos, buenas prácticas y recomendaciones personalizadas para ayudarte a sacar el mayor provecho de la plataforma.',
      // ```
      // ### Pagina Calendario
      // ```dart
      'Calendar': 'Calendario',
      'April': 'Abril',
      'SUN': 'DOM',
      'MON': 'LUN',
      'TUE': 'MAR',
      'WED': 'MIE',
      'THU': 'JUE',
      'FRI': 'VIE',
      'SAT': 'SAB',
      'This calendar will show all the dates on which you have an assigned appointment.':
          'En este calendario se mostrarán todas las fechas en las que tengas una cita asignada.',

      // ### Pagina Editar nombre
      // ```dart
      'Eliminar Cuenta': 'Delete Account',
      'Continuar': 'Continue',
      'Al eliminar tu cuenta, se borrarán de forma permanente todos tus datos personales, historial de actividad, conversaciones, vacantes creadas (si aplica) y cualquier información asociada a tu perfil.':
          'By deleting your account, all your personal data, activity history, conversations, job postings (if applicable), and any information associated with your profile will be permanently erased.',
      'Qué sucede cuando eliminas tu cuenta?':
          'What happens when you delete your account?',
      'Se eliminará tu perfil completo, incluidos tu nombre, correo electrónico, foto y cualquier otra información personal.\nTodas tus conversaciones, matches, postulaciones, entrevistas agendadas y vacantes creadas (en caso de ser reclutador) serán eliminadas sin posibilidad de recuperación.\nSi tienes suscripciones activas, estas se cancelarán automáticamente.\nEn caso de que estés participando en procesos de selección, las empresas dejarán de ver tu perfil y no podrán contactarte.':
          'Your entire profile, including your name, email, photo, and any other personal information, will be removed.\nAll your conversations, matches, applications, scheduled interviews, and job postings (if you’re a recruiter) will be deleted with no possibility of recovery.\nIf you have active subscriptions, those will be canceled automatically.\nIf you are participating in any selection processes, companies will no longer see your profile and will not be able to contact you.',
      '¿Puedo reactivar mi cuenta después?':
          'Can I reactivate my account afterward?',
      'No. Esta acción no se puede deshacer. Si decides volver en el futuro, deberás crear una cuenta nueva desde cero, sin historial previo.':
          'No. This action cannot be undone. If you decide to come back in the future, you must create a new account from scratch, with no prior history.',
      '¿Qué pasa con mis datos?': 'What happens to my data?',
      'Todos los datos se eliminan conforme a nuestras políticas de privacidad y normativas de protección de datos. Puedes consultar más detalles en nuestra sección de [Política de Privacidad].':
          'All data is deleted in accordance with our privacy policy and data protection regulations. You can find more details in our [Privacy Policy] section.',

      // ### Pagina Desbloquear popup
      // ```dart
      '¿Estás seguro de que deseas eliminar tu cuenta?':
          'Are you sure you want to delete your account?',
      'Esta acción es definitiva.': 'This action is final.',
      'Eliminar': 'Delete',
      'Cancelar': 'Cancel',
      // ```
      // ### Pagina Menu reclutador
      // ```dart
      'Jessica González Cruz Perez': 'Jessica González Cruz Perez',
      'Ver Perfil': 'View Profile',
      'Mi Cuenta': 'My Account',
      'Mi calendario': 'My Calendar',
      'Privacidad y Seguridad': 'Privacy and Security',
      'Configuración de cuenta': 'Account Settings',
      'Aviso de privacidad': 'Privacy Notice',
      'Términos y condiciones': 'Terms and Conditions',
      'Administración de cuenta': 'Account Management',
      'Eliminar cuenta': 'Delete Account',
      'Cerrar sesión': 'Log Out',
      'Inicio': 'Home',
      'Tips': 'Tips',
      'Chats': 'Chats',
      'Más': 'More',
      // ```
      // # Primera vez reclutador last screens
      // ### Pagina Perfil reclutador
      // ```dart
      'Puesto': 'Position',
      'Recursos_Humanos': 'Human_Resources',
      'Empresa': 'Company',
      'Viajes_PREMIUM': 'Viajes_PREMIUM',
      'Correo': 'Email',
      'jessicagonzalez@viajespremium.com': 'jessicagonzalez@viajespremium.com',
      'Soy_profesional_en_Recursos_Humanos_con_experiencia_en_reclutamiento_y_desarrollo_de_talento._Me_enfoco_en_crear_ambientes_laborales_positivos_':
          'I am_a_Human_Resources_professional_with_experience_in_recruitment_and_talent_development.I_focus_on_creating_positive_work_environments.',
      // ```
      // ### Pagina Editar nombre
      // ```dart
      'Editar_Información': 'Edit_Information',
      'Nombre(s)': 'Name(s)',
      'Escribe_tu(s)_nombre(s)': 'Enter_your_Name(s)',
      'Apellidos': 'Last_Name(s)',
      'Apellido_paterno': 'Paternal_Last_Name',
      'Apellido_materno': 'Maternal_Last_Name',

      // ```
      // ### Pagina Editar descripcion
      // ```dart
      '¿Qué_cargo_ocupas_en_la_empresa?':
          'What position do you hold at the company?',
      'Ej:_Asistente_administrativo': 'Eg: Administrative Assistant',
      '¿Cómo_te_describirías_profesionalmente?':
          'How would you describe yourself professionally?',
      'Ej:_Soy_profesional_en_asistencia_administrativa,_con_\nexperiencia_en_gestión_de_oficinas,_coordinación_de_\nagendas_y_apoyo_operativo.':
          'Eg: I am a professional in administrative assistance, with \nexperience in office management, agenda coordination, and operational support.',
      '0/500_caracteres': '0/500 characters',

      // ### Pagina Vacantes
      // ```dart
      'Vacantes': 'Vacancies',
      'Nosotros': 'About us',
      'Empleados': 'Employees',
      'Viajes_Premium': 'Viajes Premium',
      'Industria_Turística': 'Tourism Industry',
      'Diseñador_Web': 'Web Designer',
      'Coyoacán,_CDMX': 'Coyoacán, CDMX',
      'Buscamos_un_diseñador_web_creativo_y_detallista_para_diseñar_interfaces_atractivas,_funcionales_y_...':
          'We are looking for a creative and detail-oriented web designer to design attractive, functional, and ...',
      'Hace_2_semanas': '2 weeks ago',
      '20_Matches': '20 Matches',
      '10,000_-_15,000': '10,000 - 15,000',
      'Presencial': 'Onsite',

      // ### Pagina Poner foto overlay
      // ```dart
      'We_recommend_using_a_presentable_and_well-lit_photograph.':
          'Te recomendamos utilizar una fotografía presentable y bien iluminada.',
      'Choose_from_library': 'Elegir de la biblioteca',
      'Take_photo': 'Tomar foto',

      // ### Pagina informacion del reclutador - Photo
      // ```dart
      'Photo_for_your_profile': 'Fotografia para tu perfil',
      'You_can_upload_a_photo_so_that_your_profile_looks_complete._Remember_to_choose_a_clear_and_presentable_image.':
          'Puedes subir una foto para que tu perfil luzca completo. Recuerda elegir una imagen clara y presentable.',
      'Confirm': 'Confirmar',
      'Change_photo': 'Cambiar foto',

      // # Crear vacante reclutador
      // ### Pagina informacion Basica
      // ```dart
      'basic_information': 'Información Básica',

      'Fill_in_the_basic_data_to_start_creating_your_vacancy.':
          'Completa los datos básicos para comenzar a crear tu vacante.',
      'What_is_the_name_of_the_vacancy?': '¿Cuál es el nombre de la vacante?',
      'Eg_Administrative_Assistant': 'Ej: Asistente administrativo',
      'What_is_the_subcategory_of_the_vacancy?':
          '¿Cuál es la subcategoría de la vacante?',
      'Eg:_Web_Design': 'Ej: Diseño Web',
      'What_is_the_required_education_level?':
          '¿Cuál es la escolaridad requerida?',
      'Select_an_option': 'Selecciona una opción',
      'In_which_state_is_the_vacancy_located?':
          '¿En qué entidad federativa se encuentra la vacante?',
      'Which_borough_or_municipality_is_the_vacancy_located_in?':
          '¿Cuál es la alcaldía o municipio donde se encuentra la vacante?',
      'In_which_neighborhood_is_the_vacancy_located?':
          '¿En qué colonia se encuentra la vacante?',
      'Eg:_Romero_de_Terreros': 'Ej: Romero de Terreros',

      // ### Pagina informacion del empleo
      // ```dart
      'Define_how_the_work_will_be_organized_for_the_vacancy':
          'Define cómo se organizará el trabajo para la vacante',
      'When_is_the_vacancy_start_date?':
          '¿Cuándo es la fecha de inicio de la vacante?',
      'Eg:_March_08,_2025': 'Ej: Marzo 08, 2025',
      'What_will_be_the_work_modality_for_the_vacancy?':
          '¿Cuál será la modalidad de trabajo de la vacante?',
      'Onsite': 'Presencial',
      'Remote': 'Remoto',
      'Hybrid': 'Hibrido',
      'What_is_the_work_schedule_for_this_vacancy?':
          '¿Cuál es la jornada laboral de esta vacante?',
      'What_is_the_work_shift_for_this_vacancy?':
          '¿Cuál es el tuno laboral de esta vacante?',
      'Morning_shift': 'Turno matutino',
      'Evening_shift': 'Turno vespertino',
      'Mixed_shift': 'Turno mixto',
      'Night_shift': 'Turno nocturno',
      'Rotating_shift': 'Turno rotativo',
      'Flexible_shift': 'Turno flexible',
      'Weekend_shift': 'Turno de fin de semana',

      // ### Pagina informacion del empleo Pt2
      // ```dart
      'March_30,_2025': 'Marzo 30, 2025',
      'When_will_your_vacancy_posting_end?':
          '¿Cuándo finalizará la publicación de tu vacante?',
      'June_30,_2025': 'El 30 junio del 2025',
      'Your_vacancy_will_be_active_for_90_days_from_the_start_date.Afterwards_it_will_close_automatically.But_don’t_worry!_You_can_reopen_it_whenever_you_want.':
          'Tu vacante estará activa por 90 días a partir de la fecha de inicio.Después se cerrará automáticamente.¡Pero no te preocupes! Puedes volver a abrirla cuando quieras.',
      // ### Pagina Popup - Guardar proceso
      // ```dart
      'Save_process': 'Guardar proceso',
      'Your_information_will_be_saved_so_you_can_complete_the_process_later.':
          'Tu información quedará guardada para que completes el proceso más tarde.',
      'Cancel': 'Cancelar',

      // ### Pagina informacion del reclutador
      // ```dart
      'Job_Details': 'Detalles del Empleo',
      'Save': 'Guardar ',
      'Add_the_detailed_job_information.':
          'Agrega la información detallada del empleo. ',
      'When_can_the_candidate_start?': '¿Cuándo puede comenzar el candidato?',
      'Does_this_vacancy_require_previous_work_experience?':
          '¿Esta vacante requiere experiencia laboral previa?',
      'Which_will_be_the_working_days?': '¿Cuáles serán los días laborales?',

      'What_is_the_schedule_of_the_vacancy?':
          '¿Cuál es el horario de la vacante?',
      'Start_time': 'Horario de entrada',
      'Hours': 'Horas',
      'Minutes': 'Minutos',
      'End_time': 'Horario de Salida',
      'Do_you_have_additional_specifications_about_the_schedule?':
          '¿Tienes especificaciones adicionales sobre el horario?',
      'Eg:_The_working_days_are_Monday_to_Friday_from_8:00_am_to_9:00_pm_and_Saturdays_from_8:00_am_to_1:00_pm':
          'Ej: Los días de trabajo son de lunes a viernes de 8:00 am a 9:00 pm y sábados de 8:00 am a 01:00 pm',
      '0/200_characters': '0/200 caracteres',

      // ### Pagina Sueldo y prestaciones
      // ```dart
      'Salary,_Benefits_and_Perks': 'Sueldo, Beneficios y Prestaciones',

      'Specify_the_offered_salary_as_well_as_the_benefits_and_perks_included_in_the_vacancy.':
          'Especifica el sueldo ofrecido, así como los beneficios y prestaciones incluidos en la vacante.',
      'Continue': 'Continuar',
      'Minimum': 'Mínimo',
      'to': 'a',
      'What_will_be_the_Payment_Frequency?':
          '¿Cuál será la Frecuencia de Pago?',
      'What_benefits_and_perks_does_this_vacancy_offer?':
          '¿Qué beneficios y prestaciones ofrece esta vacante?',
      'Write_the_benefits_and/or_perks_of_your_vacancy.  \nSocial_security\nVacation\nChristmas_bonus\nVacation_bonus':
          ' Escribe los beneficios y/o prestaciones de tu vacante.\nSeguro social\nVacaciones\nAguinaldo\nInfonavit\nPrima vacacional',
      '0/2000_characters': '0/2000 caracteres',
      'What_requirements_must_the_candidate_meet?':
          '¿Qué requisitos debe cumplir el candidato?',
      'Write_the_requirements_for_your_vacancy.               \nPrevious_experience_in_administrative_tasks \nProficiency_in_Office_suite \nOrganizational_and_attention_to_detail_skills\nGood_spelling_and_writing':
          'Escribe los requisitos de tu vacante. \nExperiencia previa en labores administrativas \nManejo de paquetería Office \nHabilidades de organización y atención al detalle\nBuena ortografía y redacción',

      // ###  Habilidades
      // ```dart
      '💪_Resilience': '💪 Resiliencia',
      '💡_Critical_thinking': '💡 Pensamiento crítico',
      '🧠_Problem_solving': '🧠 Resolución de problemas',
      '🕊️_Empathy': '🕊️ Empatía',
      '🗣️_Assertive_communication': '🗣️ Comunicación asertiva',
      '🧘‍️_Stress_management': '🧘‍️ Manejo del estrés',
      '🚀_Proactivity': '🚀 Proactividad',
      '🤝_Teamwork': '🤝 Trabajo en equipo',
      '💬_Active_listening': '💬 Escucha activa',
      '💻_Programming': '💻 Programación',
      '🎨_Graphic_design': '🎨 Diseño gráfico',
      '💻_Use_of_Artificial_Intelligence':
          '💻 Uso de la Inteligencia Artificial',
      '🌐_Web_design': '🌐 Diseño web',
      '🏆_Self-discipline': '🏆 Autodisciplina',
      '⏰_Time_management': '⏰ Gestión del tiempo',
      '🔄_Adaptability': '🔄 Adaptabilidad',
      '🎯_Results_orientation': '🎯 Orientación a resultados',
      '🧩_Negotiation_skills': '🧩 Capacidad de negociación',
      '🖥️_Database_management': '🖥️ Manejo de bases de datos',
      '🔧_Maintenance_and_technical_support':
          '🔧 Mantenimiento y soporte técnico',
      '📈_Data_analysis': '📈 Análisis de datos',
      '🧠_Machine_Learning_/_AI': '🧠 Machine Learning / IA',
      '⚙️_Software_engineering': '⚙️ Ingeniería de software',
      '🏗️_Project_management': '🏗️ Gestión de proyectos',

      // ### Pagina Habilidades
      // ```dart
      'Required_Skills': 'Habilidades Requeridas',
      'Select_the_skills_that_best_describe_the_ideal_candidate_for_this_vacancy.':
          'Selecciona las habilidades que mejor describan al candidato ideal para esta vacante.',
      'Filter_by_skill_type': 'Filtra por tipo de habilidad',
      'Human_skills': 'Habilidades humanas',
      'Technical_skills': 'Habilidades técnicas',

      // ### Pagina Descripcion del sueldo
      // ```dart
      'Describe_the_type_of_job_you_are_offering_in_a_clear_and_respectful_manner.':
          'Describe el tipo de empleo que estás ofreciendo de manera clara y respetuosa.',
      'Before_continuing,_make_sure_that_your_content_complies_with_the_following_rules:\nIt_must_not_violate_any_law.\nIt_must_not_contain_offensive,_discriminatory,_or_inappropriate_language.\nIt_must_not_include_false,_misleading,_or_incomplete_information.\nThe_content_must_be_clear,_truthful,_and_professional.':
          'Antes de continuar, asegúrate de que tu contenido cumpla con las siguientes normas:\nNo debe infringir ninguna ley.\nNo debe contener lenguaje ofensivo, discriminatorio o inapropiado.\nNo debe incluir información falsa, engañosa o incompleta.\nEl contenido debe ser claro, veraz y profesional.',
      'How_would_you_describe_this_position?':
          '¿Cómo describirías este puesto?',
      'Eg:_We_are_looking_for_a_responsible_and_organized_Administrative_Assistant_to_support_operational_and_office_tasks._Their_main_role_will_be_to_manage_documentation,_coordinate_schedules,_answer_calls,_and_provide_support_to_the_team_in_daily_administrative_activities...':
          'Ej: Buscamos un Asistente Administrativo responsable y organizado para apoyar en tareas operativas y de oficina. Su función principal será gestionar documentación, coordinar agendas, atender llamadas, y brindar soporte al equipo en actividades administrativas diarias...',

      // ### Pagina Resumen de datos
      // ```dart
      'Edit_vacancy': 'Editar vacante',
      'Vacancy_photo': 'Foto de la vacante',
      'Vacancy_name': 'Nombre de la Vacante',
      'Web_designer': 'DISEÑADOR WEB',
      'Category': 'Categoría',
      'Art_and_design': 'Arte y Diseño',
      'State': 'Entidad federativa',
      'Mexico_City': 'Ciudad de México',
      'Municipality_or_borough': 'Municipio o alcaldía',
      'Coyoacán': 'Coyoacán',
      'Neighborhood': 'Colonia',
      'Romero_de_Terreros': 'Romero de Terreros',
      'Job_information': 'Información del empleo',
      'Vacancy_start_and_end_date':
          'Fecha de inicio y finalización de la vacante',
      'From_March_30,_2025_to_June_30,_2025':
          'Del 30 de marzo del 2025 al 30 de junio del 2025',
      'Vacancy_modality': 'Modalidad de la vacante',
      'Vacancy_working_hours': 'Jornada de la vacante',
      'Full_time': 'Tiempo completo',
      'Vacancy_shift': 'Turno de la vacante',
      'Part_time': 'Medio tiempo',
      'Job_details': 'Detalles del empleo',
      'Candidate_incorporation': 'Incorporación del candidato',
      'Immediate_incorporation': 'Incorporación inmediata',
      'Assigned_working_days': 'Días de trabajo asignados',
      'Entry_time.': 'Horario de entrada.',
      '09:00__AM': '09:00  AM',
      'Exit_time.': 'Horario de salida.',
      '07:00__PM': '07:00  PM',
      '8_hour_shift': 'Turno 8 horas',
      'Previous_work_experience': 'Experiencia laboral previa',
      'No': 'No',
      'Salary': 'Sueldo',
      'Between_10,00_MXN_to_15,000_MXN': 'Entre 10,00 MXN a 15,000 MXN',
      'Payment_frequency': 'Frecuencia de pago',
      'Biweekly_(every_fortnight)': 'Quincenal (cada quincena)',
      'Benefits_and_perks': 'Beneficios y prestaciones',
      'Write_the_benefits_and/or_perks_of_your_vacancy.  \nMedical_insurance.\nPaid_vacations.\nFlexible_schedule.\nTraining_and_professional_development\nPerformance_bonuses.\nCommissions.\nChristmas_bonus.\nSavings_fund.':
          ' Escribe los beneficios y/o prestaciones de tu vacante.  \nSeguro médico.\nVacaciones pagadas.\nHorario flexible.\nCapacitación y desarrollo profesional\nbonos de desempeño.\nComisiones.\nAguinaldo.\nFondo de ahorro.',
      'Requirements': 'Requisitos',
      'Write_the_requirements_of_your_vacancy.               \nBachelor’s_in_Graphic_Design.\nIntermediate_English.\nProficiency_in_Adobe_(Illustrator,_Photoshop,_InDesign,_After_Effects).\nProficiency_in_Office_(Word,_Excel,_PowerPoint).\nIntermediate-advanced_knowledge_of_WordPress_and_basic_HTML.\nFamiliarity_with_printing_techniques_(Flexography).\nCreative,_organized,_detail-oriented,_team_player.':
          'Escribe los requisitos de tu vacante.               \nLicenciatura en Diseño Gráfico.\nInglés Intermedio.\nDominio de Adobe (Illustrator, Photoshop, \nInDesign, After Effects).\nManejo de Office (Word, Excel, Power Point).\nConocimiento intermedio-avanzado de WordPress \ny nociones básicas de HTML.\nFamiliaridad con técnicas de impresión \n(Flexografía).\nCreativo, organizado, con atención a los detalles \ny habilidad para trabajar en equipo.',
      'Skills': 'Habilidades',
      '5/10_Selected_skills': '5/10 Habilidades seleccionadas',
      'Vacancy_description': 'Descripción de la vacante',
      'Description': 'Descripción',
      'We_are_looking_for_a_creative_designer_with_experience_in_graphic_and_visual_design._The_ideal_candidate_must_have_skills_in_using_tools_such_as_Adobe_Photoshop,_Illustrator,_and_Figma,_and_be_able_to_create_attractive_visual_concepts_for_different_platforms._The_ability_to_work_independently_and_as_part_of_a_team,_adapting_to_the_project’s_needs_while_maintaining_a_consistent_brand_aesthetic,_will_be_valued.':
          'Buscamos un diseñador creativo con experiencia en \ndiseño gráfico y visual. El candidato ideal debe tener \nhabilidades en el uso de herramientas como Adobe \nPhotoshop, Illustrator y Figma, y ser capaz de crear \nconceptos visuales atractivos para diferentes plataformas. Se valorará la capacidad de trabajar demanera autónoma y en equipo, adaptándose a las necesidades del proyecto y manteniendo siempre una estética coherente con la marca.',
      'Preview': 'Vista Previa',
      'Publish_vacancy': 'Publicar vacante',
      'Data_summary': 'Resumen de Datos',
      'Verify_that_all_entered_information_is_correct_before_proceeding.':
          'Verifica que toda la información ingresada esté correcta antes de avanzar.',

      // ### Pagina Visualizacion de vacante
      // ```dart
      'This_is_how_candidates_will_see_your_vacancy':
          'Así es como los candidatos verán tu vacante',
      'View_Profile': 'Ver Perfil',
      'Web_Designer': 'Diseñador web',
      '\$10,000_-_\$15,000_MXN': '\$10,000 - \$15,000 MXN',
      'Romero_de_Terreros,_Coyoacán,_Mexico_City':
          'Romero de Terreros, Coyoacán, Ciudad de México',
      'Full_time,_10_hour_shift': 'Tiempo completo,  Turno de 10 horas',
      'Modality:_Onsite': 'Modalidad: Presencial',
      'Working_days:_Monday_to_Saturday_from_09:00_to_19:00_hrs':
          'Días laborales: Lunes a sábados de 09:00 a 19:00 hrs',
      'Incorporation:_Can_start_immediately.':
          'Incorporación: Puede incorporarse de inmediato.',
      'Payment_frequency:_Biweekly_(every_fortnight)':
          'Frecuencia de pago: Quincenal (cada quincena)',
      'Previous_experience:_No': 'Experiencia previa: No',
      'We_are_looking_for_a_creative_designer_with_experience_in_graphic_and_visual_design._The_ideal_candidate_must_have_skills_in_using_tools_such_as_Adobe_Photoshop,_Illustrator,_and_Figma,_and_be_able_to_create_attractive_visual_concepts_for_different_platforms._The_ability_to_work_independently_and_as_part_of_a_team,_adapting_to_project_needs_and_maintaining_a_consistent_brand_aesthetic,_will_be_valued.':
          'Buscamos un diseñador creativo con experiencia en diseño gráfico y visual. El candidato ideal debe tener habilidades en el uso de herramientas como Adobe Photoshop, Illustrator y Figma, y ser capaz de crear conceptos visuales atractivos para diferentes plataformas. Se valorará la capacidad de trabajar de manera autónoma y en equipo, adaptándose a las necesidades del proyecto y manteniendo siempre una estética coherente con la marca.',
      'Required_skills': 'Habilidades requeridas ',
      'Medical_insurance.\nPaid_vacations.\nFlexible_schedule.\nTraining_and_professional_development\nPerformance_bonuses.\nCommissions.\nChristmas_bonus.\nSavings_fund.':
          'Seguro médico.\nVacaciones pagadas.\nHorario flexible.\nCapacitación y desarrollo profesional\nbonos de desempeño.\nComisiones.\nAguinaldo.\nFondo de ahorro.',

      'Bachelor’s_degree_in_Graphic_Design.\nIntermediate_English.\nProficiency_in_Adobe_(Illustrator,_Photoshop,_InDesign,_After_Effects).\nOffice_skills_(Word,_Excel,_PowerPoint).\nIntermediate-advanced_knowledge_of_WordPress_and_basic_HTML.\nFamiliarity_with_printing_techniques_(Flexography).\nCreative,_organized,_detail-oriented,_team_player.':
          'Licenciatura en Diseño Gráfico.\nInglés Intermedio.\nDominio de Adobe (Illustrator, Photoshop, InDesign, After Effects).\nManejo de Office (Word, Excel, Power Point).\nConocimiento intermedio-avanzado de WordPress y nociones básicas de HTML.\nFamiliaridad con técnicas de impresión (Flexografía).\nCreativo, organizado, con atención a los detalles y habilidad para trabajar en equipo.',
      'Schedule_specifications': 'Especificaciones del horario ',
      'Monday_to_Friday_from_9:00_am_to_7:00_pm,_Saturday_from_9:00_am_to_1:00_pm':
          'Lunes a viernes de 9:00 am a 7:00 pm, sábado de \n9:00 am a 1:00 pm',
      // ### Pagina vacantes
      // ```dart
      'Vacancies': 'Vacantes',
      'About_Us': 'Nosotros',
      'Employees': 'Empleados',
      'Tourism_Industry': 'Industria Turística',
      'We_are_looking_for_a_creative_and_detail-oriented_web_designer_to_design_attractive,_functional,_and_...':
          'Buscamos un diseñador web creativo y detallista para diseñar interfaces atractivas, funcionales y ...',
      '2_weeks_ago': 'Hace 2 semanas',

      // ### Pagina nosotros
      // ```dart
      'At_Viajes_Premium®,_we_are_the_only_company_that_guarantees_the_best_travel_experiences._With_19_years_in_the_market,_we_offer_you_magical_and_unforgettable_experiences_in_a_wide_variety_of_destinations_in_Mexico_and_around_the_world._We_are_constantly_expanding,_working_to_incorporate_new_destinations_to_bring_you_even_more_exceptional_experiences.':
          'En Viajes Premium®, somos la única empresa que garantiza las mejores experiencias de viaje. Con 19 años en el mercado, te ofrecemos vivencias mágicas e inolvidables en una amplia variedad de destinos en México y alrededor del mundo. Estamos en constante expansión, trabajando en la incorporación de nuevos destinos para brindarte experiencias aún más excepcionales.',
      'Location': 'Ubicación',
      'Omega_306,_Romero_de_Terreros,_Coyoacán,_04310_Mexico_City,_CDMX':
          'Omega 306, Romero de Terreros, Coyoacán, 04310 Ciudad de México, CDMX',
      'Sector': 'Sector',
      'Private': 'Privado',
      '1-10_Employees': '1-10 empleados',
      'company_name': 'Razón Social',
      'Soluciones_Integrales_del_Pacífico,_S.A._de_C.V.':
          'Soluciones Integrales del Pacífico, S.A. de C.V.',

      // ### Pagina empleados
      // ```dart
      'Jessica_Gonzáles_Cruz': 'Jessica Gonzáles Cruz',
      'Human_Resources': 'Recursos Humanos',

      // ### Pagina Visualizacion de vacante Pt 2
      // ```dart
      'Full_time,_10-hour_shift': 'Tiempo completo,  Turno de 10 horas',

      'We_are_looking_for_a_creative_designer_with_experience_in_graphic_and_visual_design._The_ideal_candidate_should_have_skills_in_using_tools_such_as_Adobe_Photoshop,_Illustrator_and_Figma,_and_be_able_to_create_attractive_visual_concepts_for_different_platforms._The_ability_to_work_independently_and_as_part_of_a_team,_adapting_to_project_needs_while_maintaining_a_coherent_brand_aesthetic,_will_be_valued.':
          'Buscamos un diseñador creativo con experiencia en diseño gráfico y visual. El candidato ideal debe tener habilidades en el uso de herramientas como Adobe Photoshop, Illustrator y Figma, y ser capaz de crear conceptos visuales atractivos para diferentes plataformas. Se valorará la capacidad de trabajar de manera autónoma y en equipo, adaptándose a las necesidades del proyecto y manteniendo siempre una estética coherente con la marca.',
      'Medical_insurance.\nPaid_vacations.\nFlexible_schedule.\nTraining_and_professional_development,\nPerformance_bonuses.\nCommissions.\nChristmas_bonus.\nSavings_fund.':
          'Seguro médico.\nVacaciones pagadas.\nHorario flexible.\nCapacitación y desarrollo profesional,\nbonos de desempeño.\nComisiones.\nAguinaldo.\nFondo de ahorro.',

      'Bachelor’s_degree_in_Graphic_Design.\nIntermediate_English.\nProficiency_in_Adobe_(Illustrator,_Photoshop,_InDesign,_After_Effects).\nOffice_suite_proficiency_(Word,_Excel,_PowerPoint).\nIntermediate-advanced_knowledge_of_WordPress_and_basic_HTML.\nFamiliarity_with_printing_techniques_(Flexography).\nCreative,_organized,_detail-oriented,_team_player.':
          'Licenciatura en Diseño Gráfico.\nInglés Intermedio.\nDominio de Adobe (Illustrator, Photoshop, InDesign, After Effects).\nManejo de Office (Word, Excel, Power Point).\nConocimiento intermedio-avanzado de WordPress y nociones básicas de HTML.\nFamiliaridad con técnicas de impresión (Flexografía).\nCreativo, organizado, con atención a los detalles y habilidad para trabajar en equipo.',

      // # Vacante - section
      // ### Pagina Home
      // ```dart
      "section_description":
          'En esta sección podrás ver todas las vacantes que has creado tú mismo.',
      "your_categories": 'Tus Categorías',
      "your_vacancies": 'Tus Vacantes',
      "my_vacancies": 'Mis Vacantes',
      "all": 'Todos',
      "art_and_design": 'Arte y Diseño',
      "programming_and_technology": 'Programación y Tecnología',
      "create_vacancy": 'Crear vacante',
      "vacancy": 'Vacante',
      "web_designer": 'Diseñador Web',
      "active_vacancy": 'Vacante Activa',
      "start_label": 'Inicio:',
      "start_date": 'Marzo/30/2025',
      "validity": 'Vigencia:',
      "June/30/2025": 'Junio/30/2025',
      "14_matches_found": '14 Match obtenidos',
      "explore_candidates": 'Explorar candidatos',
      "vacancy_in_edit_mode": 'Vacante en Edición',
      "Home": 'Inicio',

      // ### Ajuste vacante Popup
      // ```dart
      "renew_vacancy": 'Renovar Vacante',
      "pause_vacancy": 'Pausar Vacante',
      "finish_vacancy": 'Finalizar Vacante',
      "delete_vacancy": 'Eliminar Vacante',
      // ```

      // ### Pagina Informacion del reclutador
      // ```dart
      "web_design": 'Diseño web',
      "programming_intern": 'Becario programación',
      "vacancy_deleted": 'Vacante Eliminada',
      "matches_found_50": '50 Match obtenidos',
      "matches_found_0": '0 Match obtenidos',
      // ```
      // ### Pagina Informacion del reclutador
      // ```dart
      "delete_confirmation_question":
          '¿Seguro que quieres eliminar esta vacante?',
      "delete_irreversible_warning":
          'Esta acción no se puede deshacer. La vacante será eliminada permanentemente de la plataforma. Se perderá todo su historial, los matches realizados, las entrevistas agendadas y cualquier vínculo con procesos de selección en curso.',
      "confirm_delete_button": 'Eliminar',
      "cancel_button": 'Cancelar',

      // ```

      // ### Pagina Perfil reclutador
      // ```dart
      "save": 'Guardar',
      "what`s_the_vacancy_name?": '¿Cuál es el nombre de la vacante?',
      "14/30 characters": '14/30 caracteres',
      "category_prompt": '¿Cuál es la categoría del empleo?',
      "state_prompt": '¿En qué entidad federativa se encuentra la vacante?',
      "state": 'Ciudad de México',
      "municipality_prompt":
          '¿Cuál es la alcaldía o municipio donde se encuentra la vacante?',
      "municipality": 'Coyoacán',
      "colony_prompt": '¿En qué colonia se encuentra la vacante?',
      "colony": 'Romero de Terreros',
      "basic_info_instruction":
          'Completa los datos básicos para comenzar a crear tu vacante.',
      "progress_percentage": '0%',
      "continue_button": 'Continuar',
      // ```
      // ### Pagina Sueldo y prestaciones
      // ```dart
      "job_information": 'Información del Empleo',
      "Define how the work for the vacancy will be organized":
          'Define cómo se organizará el trabajo para la vacante',
      "progress_20_percent": '20%',
      "When is the start date for the vacancy?":
          '¿Cuándo es la fecha de inicio de la vacante?',
      "When will your vacancy posting end?":
          '¿Cuándo finalizará la publicación de tu vacante?',
      "June 30, 2025": '30 junio del 2025',
      "Your position will be active for 90 days from the start date. After that, it will close automatically. But don't worry! You can reopen it whenever you want.":
          'Tu vacante estará activa por 90 dias a partir de la fecha de inicio. Despues se cerrará automáticamente. ¡pero no te preocupes! Puedes volver a abrirla cuando quieras.',
      "What will the job description be for this vacancy?":
          '¿Cuál será la modalidad de trabajo de la vacante?',
      "hybrid": 'Híbrido',
      "What are the working hours for this vacancy?":
          '¿Cuál es la jornada laboral de esta vacante?',
      "full_time": 'Tiempo Completo',
      "What is the work shift for this vacancy?":
          '¿Cuál es el tuno laboral de esta vacante?',
      "morning_shift": 'Turno Matutino',
      // ```

      // ### Pagina Descripcion del puesto
      // ```dart
      // The content of the page with 40% has already been discribed in the last screens
      // ```

      // ### Pagina Descripcion del puesto
      // ```dart
      "salary_section_title": 'Sueldo, Beneficios y Prestaciones',
      "salary_instruction":
          'Especifica el sueldo ofrecido, así como los beneficios y prestaciones incluidos en la vacante.',
      "progress_60_percent": '60%',
      "minimum_salary": 'Mínimo',
      "\$10,000 MXN": '\$10,000 MXN',
      "maximum_salary": 'Máximo',
      "\$15,000 MXN": '\$15,000 MXN',
      "salary_range_separator": 'a',
      "payment_frequency_prompt": '¿Cuál será la Frecuencia de Pago?',
      "payment_frequency_value": 'Semanal (cada semana)',
      "benefits_prompt": '¿Qué beneficios y prestaciones ofrece esta vacante?',
      "Social_Security\nVacations\nChristmas_bonus\nVacation_bonus\nFood_vouchers\nHome office\nPaid courses\nFlexible hours":
          'Seguro social\nVacaciones\nAguinaldo\nInfonavit\nPrima vacacional\nVales de despensa\nHome office\nCursos pagados\nHorarios flexibles',
      "benefits_character_count": '125/2000 caracteres',
      "requirements_prompt": '¿Qué requisitos debe cumplir el candidato?',
      "Bachelor's Degree in Graphic Design. Intermediate English. Mastery of Adobe (Illustrator, Photoshop, InDesign, After Effects). Proficiency in Office (Word, Excel, PowerPoint). Intermediate-advanced knowledge of WordPress and basic HTML skills. Familiarity with printing techniques (Flexography). Creative, organized, with attention to detail and the ability to work in a team.":
          'Licenciatura en Diseño Gráfico.\nInglés Intermedio.\nDominio de Adobe (Illustrator, Photoshop, \nInDesign, After Effects).\nManejo de Office (Word, Excel, Power Point).\nConocimiento intermedio-avanzado de WordPress \ny nociones básicas de HTML.\nFamiliaridad con técnicas de impresión \n(Flexografía).\nCreativo, organizado, con atención a los detalles y \nhabilidad para trabajar en equipo.',
      "requirements_character_count": '382/2000 caracteres',
      // ```
      // ### Pagina Habilidades
      // ```dart
      "progress_80_percent": '80%',
      "required_skills": 'Habilidades Requeridas',
      "Select the skills that best describe the ideal candidate for this position":
          'Selecciona las habilidades que mejor describan al candidato ideal para este puesto',
      "filter_by_skill_type": 'Filtra por tipo de habilidad',
      "human_skills": 'Habilidades humanas',
      "technical_skills": 'Habilidades técnicas',
      "0/10 selected": '0/10 Seleccionados',
      "resilience": '💪 Resiliencia',
      "critical_thinking": '💡 Pensamiento crítico',
      "problem_solving": '🧠 Resolución de problemas',
      "empathy": '🕊️ Empatía',
      "assertive_communication": '🗣️ Comunicación asertiva',
      "stress_management": '🧘‍️ Manejo del estrés',
      "proactivity": '🚀 Proactividad',
      "teamwork": '🤝 Trabajo en equipo',
      "active_listening": '💬 Escucha activa',
      "programming": '💻 Programación',
      "graphic_design": '🎨 Diseño gráfico',
      "ai_usage": '💻 Uso de la Inteligencia Artificial',
      "self_discipline": '🏆 Autodisciplina',
      "time_management": '⏰ Gestión del tiempo',
      "adaptability": '🔄 Adaptabilidad',
      "result_oriented": '🎯 Orientación a resultados',
      "negotiation": '🧩 Capacidad de negociación',
      "database_management": '🖥️ Manejo de bases de datos',
      "technical_support": '🔧 Mantenimiento y soporte técnico',
      "data_analysis": '📈 Análisis de datos',
      "machine_learning": '🧠 Machine Learning / IA',
      "software_engineering": '⚙️ Ingeniería de software',
      "project_management": '🏗️ Gestión de proyectos',
    };

    return {'en': english, 'es': spanish};
  }
}
