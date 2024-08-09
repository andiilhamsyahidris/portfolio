import 'package:portfolio/presentation/resources/asset_res.dart';

class Constant {
  static const String email = "andiilhamsyahidris@gmail.com";
  static const String subjectEmail = "Peluang Bekerja Sama";
  static const String bodyEmail = """
    Halo Ilham!

    Saya menghubungimu karena
  """;
  static const String schemeEmailUri = "mailto";
  static const String empty = "";
}

class ProjectConstant {
  static const String keyTitleProject = "title";
  static const String keyDescProject = "desc";
  static const String keyDateProject = "date";
  static const String keyImageProject = "image";
  static const String keyTechProject = "tech";
  static const String keyTechName = "tech_name";
  static const String keyTechDesc = "tech_desc";
  static const String keyTechPackage = "tech_package";
  static const String keyPackageName = "package_name";
  static const String keyPackageDesc = "package_desc";

  static const List<Map<String, dynamic>> projects = [
    {
      keyImageProject: AppPngAssets.flyerMpDetection,
      keyTitleProject: "MP Detection",
      keyDescProject:
          "MP Detection is a mobile-based application that detects various pox diseases such as chickenpox, monkeypox, and measles using AI",
      keyDateProject: "June 2023",
      keyTechProject: [
        {
          keyTechName: "Framework Flutter",
          keyTechDesc:
              "This application uses the Flutter framework to run on both Android and iOS",
          keyTechPackage: [
            {
              keyPackageName: "State Management Provider",
              keyPackageDesc:
                  "This application uses Provider to manage the state within the app"
            },
            {
              keyPackageName: "HTTP",
              keyPackageDesc:
                  "This application uses HTTP to make requests to the server",
            },
            {
              keyPackageName: "Get it",
              keyPackageDesc: "This application uses Get_it for service locator"
            }
          ]
        },
        {
          keyTechName: "Flask",
          keyTechDesc:
              "This appllication uses the flask framework to handle backend app",
        },
        {
          keyTechName: "YOLOv7",
          keyTechDesc:
              "This application uses YOLOv7 algorithm to detect skin disease based on the image ",
        },
      ]
    },
    {
      keyImageProject: AppPngAssets.flyerPetaniTambak,
      keyTitleProject: "Petani Tambak",
      keyDescProject:
          "Petani Tambak is a mobile-based application that integrated with IoT for detect salinity, temperature and pH water on shrimp pond",
      keyDateProject: "December 2022",
      keyTechProject: [
        {
          keyTechName: "Framework Flutter",
          keyTechDesc:
              "This application uses the Flutter framework to run on both Android and iOS",
          keyTechPackage: [
            {
              keyPackageName: "BLoC",
              keyPackageDesc:
                  "This application uses BLoC to manage the state within the app",
            },
            {
              keyPackageName: "MQTT",
              keyPackageDesc:
                  "This application uses MQTT as a client to connect IoT into mobile app",
            },
            {
              keyPackageName: "Firebase Auth",
              keyPackageDesc:
                  "This application uses firebase to handle authentication",
            }
          ]
        },
        {
          keyTechName: "Sprint boot",
          keyTechDesc: "This application uses Spring boot to handle backend",
        },
        {
          keyTechName: "MQTT Message Broker",
          keyTechDesc:
              "This application uses MQTT as a messaging protocol for the IoT "
        }
      ]
    },
  ];
}

class EducationConstant {
  static const String keyImageEducation = "image";
  static const String keyTitleEducation = "education";
  static const String keyDateEducation = "date";
  static const String keyMajorEducation = "major";
  static const String keyGpaEducation = "gpa";

  static const Map<String, dynamic> educations = {
    keyImageEducation: AppPngAssets.flyerUnhas,
    keyTitleEducation: "Hasanuddin University",
    keyMajorEducation: "Information System",
    keyDateEducation: "July 2019 - June 2023",
    keyGpaEducation: "3.59"
  };
}

class SkillConstant {
  static const String keyTitleSkill = "skill";
  static const String keyCompanySkill = "company";
  static const String keyDescSkill = "desc";

  static const List<Map<String, dynamic>> skills = [
    {
      keyTitleSkill: "Flutter Developer Expert",
      keyCompanySkill: "Dicoding Indonesia",
      keyDescSkill:
          "A leading technology education platform that promotes broader access to digital literacy for everyone. Dicoding serves as an educational technology platform that helps produce globally standardized digital talent",
    },
  ];
}

class ExperienceConstant {
  static const String keyImageExperience = "image";
  static const String keyDescExperience = "desc";
  static const String keyCompanyExperience = "company";
  static const String keyDateExperience = "date";
  static const String keyPositionExperience = "position";

  static const List<Map<String, dynamic>> experiences = [
    {
      keyPositionExperience: "Mobile Developer",
      keyCompanyExperience: "GoTo Financial",
      keyDescExperience:
          "I am currently working at GoTo Financial as a Mobile Developer, responsible for developing applications with the implementation of digital signature features",
      keyDateExperience: "August 2024 - Now",
    },
    {
      keyImageExperience: AppPngAssets.flyerDigisign,
      keyPositionExperience: "Mobile Developer",
      keyCompanyExperience: "PT. Solusi Net Internusa",
      keyDescExperience:
          "When I worked at PT. Solusi Net Internusa as a Mobile Developer, I was responsible for developing applications focused on digital signature features",
      keyDateExperience: "December 2023 - July 2024",
    },
    {
      keyPositionExperience: "Mobile Developer",
      keyCompanyExperience: "PT. Hadin ITE Solution",
      keyDescExperience:
          "PT. Hadin ITE Solution is a company under the auspices of Hasanuddin University, focusing on technology development within the university environment",
      keyDateExperience: "September 2023 - October 2023"
    },
    {
      keyPositionExperience: "Mobile Developer",
      keyCompanyExperience: "NPE Digital Solution",
      keyDescExperience:
          "NPE Digital Solution is a software house company that my friends and I founded. We have worked on numerous applications for various clients, including ticket management, administrative management for Institut Teknologi Habibie, administrative management for the Faculty of Pharmacy at Hasanuddin University, and administrative management for the Faculty of Medicine at Universitas Muslim Indonesia Makassar",
      keyDateExperience: "August 2022 - May 2024",
    }
  ];
}
