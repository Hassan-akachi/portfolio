import 'package:flutter/material.dart';

import '../main.dart';
import '../model/portfolio_app_data.dart';
import '../model/tech_stack.dart';

List<PortfolioAppData> portfolioApps = [
  PortfolioAppData(
    name: 'CV',
    icon: Icons.description,
    description: 'View my curriculum vitae',
    downloadUrl: 'https://docs.google.com/document/d/1J05cmPVZt4TQpEg81f0XIcm4i7QILgHhy3Fw_8hqtFc/edit?usp=drive_link',
  ),

  PortfolioAppData(
    name: 'Patient Management System(Web Project)',
    icon: Icons.cloud,
    description: 'Full-stack web application',
    downloadUrl: "https://github.com/Hassan-akachi/patient-management"
  ),

  PortfolioAppData(
    name: 'IoT Water quality Monitoring System',
    icon: Icons.build,
    description: 'https://github.com/Hassan-akachi/IOT-WATER-QUALITY-MONITORING-SYSTEM',
    downloadUrl: "https://github.com/Hassan-akachi/IOT-WATER-QUALITY-MONITORING-SYSTEM"
  ),

  PortfolioAppData(
    name: 'Database',
    icon: Icons.storage,
    description: 'Database design and optimization',
  ),

  PortfolioAppData(
    name: 'Ultimate Convert',
    image: "assets/images/ultConvertLogo.png",
    description: 'https://github.com/Hassan-akachi/convert_unit_currency',
    downloadUrl: ""
  ),

  PortfolioAppData(
    name: 'Awesome WallPapers',
   image: "assets/images/wallpaperLogo.jpg",
    description: 'https://github.com/Hassan-akachi/wallpaper_app',
    downloadUrl: "https://github.com/Hassan-akachi/wallpaper_app/releases"
  ),

  PortfolioAppData(
    name: 'Blurb9Naija',
    image: "assets/images/Blurb9naijaLogo.png",
    description: 'https://play.google.com/store/apps/details?id=com.blurbnaija.app',
    downloadUrl: "https://play.google.com/store/apps/details?id=com.blurbnaija.app"
  ),
  PortfolioAppData(
    name: 'FlashLearner',
   image: "assets/images/flashlearner.png",
    description: 'https://play.google.com/store/apps/details?id=com.iafsawii.flashlearners.jambcbt',
    downloadUrl: "https://play.google.com/store/apps/details?id=com.iafsawii.flashlearners.jambcbt"
  ),
  PortfolioAppData(
    name: 'BrickBreaker',
   image: "assets/images/BrickBreakerLogo.png",
    description: 'https://github.com/Hassan-akachi/brick_breaker',
    downloadUrl: "https://drive.google.com/file/d/1gM7xeGseI89t-ap5guB1udHit2B09rBv/view?usp=drive_link"
  ),
  PortfolioAppData(
    name: 'Tesla',
    image: "assets/images/tesla.jpg",
    description: 'https://github.com/Hassan-akachi/Animated-Tesla-UI-Car-App-using-Flutter',
    downloadUrl: "https://drive.google.com/file/d/19eiHk-IrO5l3PHB8M0klR-QevS202jbv/view?usp=drive_link"
  ),
  PortfolioAppData(
    name: 'Tetris',
    image:"assets/images/tetrisLogo.png" ,
    description: 'https://github.com/Hassan-akachi/tetris',
    downloadUrl: "https://drive.google.com/file/d/137iDITgPOq77nM2pPBE0jxuNuU0uz2rS/view?usp=drive_link"
  ),

];


List<PortfolioAppData> bottomNavIcons=[
  PortfolioAppData(
    name: 'Github',
    image: "assets/images/github.png",
    description: 'Check out my repositories',
  ),PortfolioAppData(
    name: 'Contact',
    image: "assets/images/contacts.png",
    description: 'E-mail and Phone Address',
  ),PortfolioAppData(
    name: 'Stack',
    icon: Icons.person,
    description: 'Development and operations automation',
  ),
];

List<TechStack> techStacks = [
  TechStack(name: 'Flutter', category: 'Mobile Development', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKzBfvk0zqCWyWaixxSsBH2k3r6y_SbNVa_MITY5Eo46dhKLVV4E5HDZ-OXItfiOLoeXo&usqp=CAU"),
  TechStack(name: 'Dart', category: 'Programming Language', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbfwl7RGtZhY9GNrLHquRe94O8P9DBMAumna_yJRdggT3kz5yZCjilki7Dm1ShdP1Zx0w&usqp=CAU"),
  TechStack(name: 'Python', category: 'Programming Language', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0vGRa7kzf57wN_vfV9p9E0n_negrKRi3weBvAhfE3MM_h68orHZNt8Kri6A1EL4a8MUQ&usqp=CAU"),
  TechStack(name: 'C++', category: 'Programming Language', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkaGC91r4t-DslmFFUQRnfaAX_uUDnLELOCgXI-_HP3WcGGMEFf0pZ2NBY0t8-m28SCOU&usqp=CAU"),
  TechStack(name: 'Java', category: 'Web Development', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSghdWGl00O5hS7sDlc98yJT_gszgNh1wwUlQ&s"),
  TechStack(name: 'Spring Boot', category: 'Backend Development', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKaLH1_Qz5AxMNgkuNObCA5EPmz__XZYBPPw&s"),
  TechStack(name: 'Firebase', category: 'Database/Cloud', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThRTfkei28uwg1prMgu6qbbxkx9y_5IFJN9g&s"),
  TechStack(name: 'Git', category: 'Version Control', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2aRJR6dWUGsjhkUzKkGp-3787npBEJcJblg&s"),
  TechStack(name: 'Docker', category: 'DevOps', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLlZJAlEkU-Nb1I7lGheQVMXaBXphuA3oR4A&s"),
  TechStack(name: 'AWS', category: 'Cloud Services', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf8ZwQVJ4EjnO8oWqjAZGEy-IbyqfLCcmYHg&s"),
  TechStack(name: 'Arduino', category: 'Soft Skills', imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeXtOGOpaVhOkDTft1xonx9oHLp1HQStNYLA&s"),
  TechStack(name: 'PCB Design', category: 'Soft Skills', imageUrl: "https://t4.ftcdn.net/jpg/02/57/78/67/360_F_257786794_rwx4KFap2WdJiiqHDcL8ixNYsGL2xcXf.jpg"),
  TechStack(name: 'Circuit Design', category: 'Soft Skills', imageUrl: "https://t4.ftcdn.net/jpg/02/57/78/67/360_F_257786794_rwx4KFap2WdJiiqHDcL8ixNYsGL2xcXf.jpg"),
];
