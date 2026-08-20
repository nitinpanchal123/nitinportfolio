class Profile {
  static const name = 'Nitin Mistry';
  static const firstName = 'Nitin';
  static const lastName = 'Mistry';
  static const title = 'Flutter & Android Developer';
  static const location = 'Ahmedabad, Gujarat';
  static const email = 'nitingc111@gmail.com';
  static const phone = '+91 63527 14264';
  static const phoneUri = 'tel:+916352714264';
  static const linkedin = 'https://linkedin.com/in/nitin-mistry-270a1a183';
  static const resumeAsset = 'assets/docs/Nitin-Mistry-Resume.pdf';
  static const downloads = '1.5M+';
  static const summary =
      'Results-driven mobile developer with six years shipping Flutter and native Android apps used by millions. I lead full SDLCs — architecture, features, REST APIs, and store releases — across fintech, utility, e-commerce, and community products.';
}

class Stat {
  const Stat(this.value, this.label);
  final String value;
  final String label;
}

const stats = [
  Stat('6+', 'Years shipping'),
  Stat('1.5M+', 'Downloads'),
  Stat('12', 'Apps built'),
  Stat('2', 'Stores'),
];

class Project {
  const Project({
    required this.slug,
    required this.title,
    required this.role,
    required this.tech,
    required this.stores,
    required this.image,
    required this.summary,
    required this.points,
    this.downloads,
    this.screenshots = const [],
    this.playUrl,
    this.icon,
    this.featured = false,
  });

  final String slug;
  final String title;
  final String role;
  final String tech;
  final String stores;
  final String image;
  final String summary;
  final List<String> points;
  final String? downloads;
  final List<String> screenshots;
  final String? playUrl;
  final String? icon;
  final bool featured;
}

const projects = [
  Project(
    slug: 'shyam-textile',
    title: 'Shyam Corp Production System',
    role: 'Developer & Lead',
    tech: 'Flutter',
    stores: 'Phones & tablets',
    image: 'assets/images/shyam-textile.jpg',
    featured: true,
    summary:
        'End-to-end production app for a textile mill — nine departments, digital batch cards, chemical costing, and live shop-floor tracking.',
    points: [
      'Architecture, features, and REST API integration for daily departmental use',
      'Digital batch cards, real-time tracking, and chemical costing workflows',
      'Designed for both phones and tablets used on the mill floor',
    ],
  ),
  Project(
    slug: 'call-assistant',
    title: 'Call Assistant — Fake Call',
    role: 'Developer & Lead',
    tech: 'Android · Java',
    downloads: '1M+',
    stores: 'Google Play',
    image: 'assets/images/play/fakecall/shot-3.jpg',
    icon: 'assets/images/play/fakecall/icon.png',
    playUrl:
        'https://play.google.com/store/apps/details?id=com.techinnate.android.fakecallme',
    screenshots: [
      'assets/images/play/fakecall/shot-3.jpg',
      'assets/images/play/fakecall/shot-4.jpg',
      'assets/images/play/fakecall/shot-5.jpg',
      'assets/images/play/fakecall/shot-6.jpg',
    ],
    summary:
        'Schedule a realistic incoming call on demand or at a set time — past a million downloads on Google Play.',
    points: [
      'Architected the scheduling engine and native Android call experience',
      'Owned the full SDLC through Play Store release and post-launch support',
    ],
  ),
  Project(
    slug: 'sms-forwarder',
    title: 'SMS Auto Forwarder',
    role: 'Developer & Lead',
    tech: 'Android',
    downloads: '500k+',
    stores: 'Google Play',
    image: 'assets/images/play/smsforwarder/shot-1.jpg',
    icon: 'assets/images/play/smsforwarder/icon.png',
    playUrl:
        'https://play.google.com/store/apps/details?id=com.techinnate.android.smsforwarder',
    screenshots: [
      'assets/images/play/smsforwarder/shot-1.jpg',
      'assets/images/play/smsforwarder/shot-3.jpg',
      'assets/images/play/smsforwarder/shot-4.jpg',
      'assets/images/play/smsforwarder/shot-5.jpg',
    ],
    summary:
        'Rule-based SMS automation with auto-forwarding and message management — half a million users on Play.',
    points: [
      'Built the rule engine, automation, and message management flows',
      'Tuned performance for always-on background forwarding',
    ],
  ),
  Project(
    slug: 'rajputs-club',
    title: 'Rajputs Club',
    role: 'Developer & Lead',
    tech: 'Flutter',
    downloads: '10k+',
    stores: 'Play Store & App Store',
    image: 'assets/images/play/rajputs/shot-1.jpg',
    icon: 'assets/images/play/rajputs/icon.png',
    playUrl: 'https://play.google.com/store/apps/details?id=com.rajputsclub',
    screenshots: [
      'assets/images/play/rajputs/shot-1.jpg',
      'assets/images/play/rajputs/shot-2.jpg',
      'assets/images/play/rajputs/shot-3.jpg',
      'assets/images/play/rajputs/shot-4.jpg',
    ],
    summary:
        'A community platform for business leads, job listings, and cultural history — published on both Android and iOS.',
    points: [
      'Lead generation, jobs, and cultural content (history, gotras, kingdoms)',
      'Cross-platform Flutter release on both major stores',
    ],
  ),
  Project(
    slug: 'payg',
    title: 'PayG — Bills, Shop, Booking',
    role: 'Developer / Lead',
    tech: 'Flutter',
    downloads: '10k+',
    stores: 'Google Play',
    image: 'assets/images/play/paygcustomer/shot-1.jpg',
    icon: 'assets/images/play/paygcustomer/icon.png',
    playUrl:
        'https://play.google.com/store/apps/details?id=com.paygdigitals.paygcustomer',
    screenshots: [
      'assets/images/play/paygcustomer/shot-1.jpg',
      'assets/images/play/paygcustomer/shot-2.jpg',
      'assets/images/play/paygcustomer/shot-3.jpg',
      'assets/images/play/paygcustomer/shot-4.jpg',
    ],
    summary:
        'Consumer PayG for bills, shopping, and bookings — shipped alongside the business and RMS apps.',
    points: [
      'Daily spend, recharges, bookings, and credit-style money flows',
      'Part of the PayG suite also live as PayG for Business and PayG RMS',
    ],
  ),
  Project(
    slug: 'click4bima',
    title: 'Click4bima',
    role: 'Developer & Lead',
    tech: 'Flutter',
    stores: 'Google Play',
    image: 'assets/images/play/click4bima/shot-2.jpg',
    icon: 'assets/images/play/click4bima/icon.png',
    playUrl: 'https://play.google.com/store/apps/details?id=app.click4bima.com',
    screenshots: [
      'assets/images/play/click4bima/shot-2.jpg',
      'assets/images/play/click4bima/shot-6.jpg',
      'assets/images/play/click4bima/shot-1.jpg',
    ],
    summary:
        'Digital insurance for vehicle, health, and term plans — quotes and purchase on the phone.',
    points: [
      'Led Flutter development for quote-to-policy flows',
      'Vehicle, health, and term coverage in one app',
    ],
  ),
  Project(
    slug: 'bharat-darshan',
    title: 'Bharat Darshan',
    role: 'Developer & Lead',
    tech: 'Flutter',
    stores: 'Google Play',
    image: 'assets/images/play/bharatdarshan/shot-2.jpg',
    icon: 'assets/images/play/bharatdarshan/icon.png',
    playUrl:
        'https://play.google.com/store/apps/details?id=org.bharatdarshanapp',
    screenshots: [
      'assets/images/play/bharatdarshan/shot-2.jpg',
      'assets/images/play/bharatdarshan/shot-1.jpg',
      'assets/images/play/bharatdarshan/shot-3.jpg',
    ],
    summary:
        'One-stop discovery for temples, pandits, shops, and history across India.',
    points: [
      'Led the Flutter app from architecture through Play Store release',
      'Directory and cultural discovery in a single product',
    ],
  ),
  Project(
    slug: 'auto-reply',
    title: 'Auto Reply',
    role: 'Developer & Lead',
    tech: 'Android',
    downloads: '10k+',
    stores: 'Google Play',
    image: 'assets/images/play/autoreply/shot-1.jpg',
    icon: 'assets/images/play/autoreply/icon.png',
    playUrl:
        'https://play.google.com/store/apps/details?id=com.techinnate.android.autoreply',
    screenshots: [
      'assets/images/play/autoreply/shot-1.jpg',
      'assets/images/play/autoreply/shot-2.jpg',
      'assets/images/play/autoreply/shot-3.jpg',
      'assets/images/play/autoreply/shot-4.jpg',
    ],
    summary: 'Hands-free auto replies for WhatsApp and Facebook Messenger.',
    points: [
      'Rule-based replies across popular messengers',
      'Shipped as a live Play Store utility',
    ],
  ),
  Project(
    slug: 'myrajasthan',
    title: 'MyRajasthan Club',
    role: 'Developer & Lead',
    tech: 'Flutter',
    stores: 'Play Store & App Store',
    image: 'assets/images/myrajasthan.jpg',
    summary:
        'Business listings and local search built for the global Rajasthan community.',
    points: [
      'Directory and discovery tailored to a worldwide community',
      'Published on Android and iOS',
    ],
  ),
  Project(
    slug: 'moko-music',
    title: 'MOKO Music',
    role: 'Developer & Lead',
    tech: 'Android',
    stores: 'Google Play',
    image: 'assets/images/moko-music.jpg',
    summary:
        'A music streaming app focused on Afro and Caribbean culture — live on Google Play.',
    points: [
      'Native Android streaming experience with a culture-first catalog',
      'Led development through store release',
    ],
  ),
];

class ExtraProject {
  const ExtraProject({
    required this.title,
    required this.meta,
    required this.blurb,
    this.playUrl,
    this.icon,
  });

  final String title;
  final String meta;
  final String blurb;
  final String? playUrl;
  final String? icon;
}

const extraProjects = [
  ExtraProject(
    title: 'PayG for Business',
    meta: 'Flutter · 10k+ · Play Store',
    blurb: 'Merchant-side PayG — collections, bookings, and shop tools.',
    playUrl: 'https://play.google.com/store/apps/details?id=com.paygdigitals.payg',
    icon: 'assets/images/play/payg/icon.png',
  ),
  ExtraProject(
    title: 'PayG RMS',
    meta: 'Flutter · Play Store',
    blurb: 'Reseller management for the PayG network.',
    playUrl: 'https://play.google.com/store/apps/details?id=com.paygdigitals.rms',
    icon: 'assets/images/play/paygrms/icon.png',
  ),
  ExtraProject(
    title: 'Bid My Drugs',
    meta: 'Flutter',
    blurb: 'Medicine price comparison and discovery.',
  ),
  ExtraProject(
    title: 'GiftGenie',
    meta: 'Flutter',
    blurb: 'Gift recommendations and important-date reminders.',
  ),
];

class Job {
  const Job({
    required this.company,
    required this.role,
    required this.dates,
    required this.tenure,
    required this.points,
  });

  final String company;
  final String role;
  final String dates;
  final String tenure;
  final List<String> points;
}

const experience = [
  Job(
    company: 'Shyam Corp. Pvt. Ltd.',
    role: 'Flutter Developer',
    dates: 'Aug 2024 — Jul 2026',
    tenure: '2 years',
    points: [
      'Built and maintained the Shyam Textile production Flutter app used daily across the mill.',
      'Led end-to-end development — architecture, features, and REST API integration.',
      'Worked with internal teams to ship a fast, scalable Android solution for the shop floor.',
    ],
  ),
  Job(
    company: 'Xsilica Software Solutions',
    role: 'Flutter Developer',
    dates: 'Mar 2022 — Jan 2024',
    tenure: '1 yr 11 mo',
    points: [
      'Engineered production Flutter apps serving tens of thousands of users in fintech and community domains.',
      'Led architecture, feature work, REST APIs, and Play Store / App Store releases.',
      'Applied Firebase and Azure for auth, realtime data, and cloud backends.',
    ],
  ),
  Job(
    company: 'Incope Data Solutions LLP',
    role: 'Flutter Developer',
    dates: 'Nov 2021 — Feb 2022',
    tenure: '4 mo',
    points: [
      'Shipped Flutter features and REST integrations for data-driven products.',
      'Raised code quality through state management and performance tuning.',
    ],
  ),
  Job(
    company: 'TechInnate Solutions OPC Pvt. Ltd.',
    role: 'Flutter Developer',
    dates: 'Feb 2020 — Nov 2021',
    tenure: '1 yr 10 mo',
    points: [
      'Designed and launched Android apps later expanded to Flutter — 1.5M+ combined downloads.',
      'Served as developer and lead, owning the SDLC from requirements through Play Store release.',
      'Built utility and messaging apps with automation rules, scheduling, and third-party integrations.',
    ],
  ),
  Job(
    company: 'AARK Infosoft Pvt. Ltd.',
    role: 'Android Developer',
    dates: 'Apr 2019 — Feb 2020',
    tenure: '11 mo',
    points: [
      'Built native Android apps in Java with the Android SDK — UI, core features, and API connectivity.',
      'Learned full-cycle mobile architecture and store deployment from the ground up.',
    ],
  ),
];

class SkillGroup {
  const SkillGroup(this.title, this.items);
  final String title;
  final List<String> items;
}

const skillGroups = [
  SkillGroup('Languages & frameworks', ['Flutter', 'Dart', 'Java', 'Android SDK']),
  SkillGroup('Mobile craft', [
    'Cross-platform Flutter',
    'Native Android',
    'Play Store & App Store',
    'Performance tuning',
  ]),
  SkillGroup('Backend & cloud', [
    'REST APIs',
    'Firebase',
    'Microsoft Azure',
    'Cloud integration',
  ]),
  SkillGroup('Practice', [
    'GitLab',
    'State management',
    'SDLC leadership',
    'Technical analysis',
  ]),
];

class Education {
  static const degree = 'Bachelor of Computer Application (BCA)';
  static const focus = 'Computer Programming';
  static const school =
      'Shri Chimanbhai Patel Post Graduate Institute of Computer Applications (SPI), Ahmedabad';
}
