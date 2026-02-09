import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_drawer.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const Color orange = Color(0xFFFF8C00);

  Future<void> _open(String url, BuildContext context) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not open the link")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final projects = <_Project>[
      _Project(
        title: "MarketHouse",
        subtitle: "E-commerce (Supermarket + Butchery)",
        description:
            "Full-stack project with product catalog, categories, offers, and admin/customer roles. "
            "Built with a clean UI and scalable backend structure.",
        tags: const ["React", "Node.js", "MySQL", "REST API"],
        githubUrl: "https://github.com/jihadyaghi/marketHouse",
        liveUrl: "", // حط رابط الديمو إذا عندك
      ),
      _Project(
        title: "UniTaxi",
        subtitle: "University ride-sharing platform",
        description:
            "A mobile-first platform concept for university students: booking rides, driver profiles, "
            "and future improvements like tracking and safety features.",
        tags: const ["Flutter", "Node.js", "MySQL"],
        githubUrl: "", // إذا عندك رابط GitHub
        liveUrl: "",
      ),
      _Project(
        title: "Smart Queue System",
        subtitle: "Queue / ticket management",
        description:
            "Queue management idea for shops (bakery, salon, etc.) with tickets, admin dashboard and live updates.",
        tags: const ["Flutter", "Firebase (planned)", "UI/UX"],
        githubUrl: "",
        liveUrl: "",
      ),
      _Project(
        title: "Portfolio",
        subtitle: "Personal portfolio (Flutter)",
        description:
            "Dark professional portfolio with About/Skills/Projects/Contact pages + backend email form.",
        tags: const ["Flutter", "Vercel", "Serverless API", "Resend"],
        githubUrl: "https://github.com/jihadyaghi", // عدّل للرابط الصحيح
        liveUrl: "",
      ),
    ];

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Projects", style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Header(),
                const SizedBox(height: 16),

                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: projects.map((p) {
                    return _ProjectCard(
                      project: p,
                      sayOpen: (url) => _open(url, context),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 18),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orange,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () => Navigator.pushReplacementNamed(context, "/contact"),
                      child: const Text("Contact Me", style: TextStyle(fontWeight: FontWeight.w900)),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () => _open("https://github.com/jihadyaghi", context),
                      child: const Text("My GitHub", style: TextStyle(fontWeight: FontWeight.w900)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    const orange = ProjectsPage.orange;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
        gradient: LinearGradient(
          colors: [
            orange,
            Colors.white,
          ],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects Showcase",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900,color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(
            "A selection of projects I built or currently working on. "
            "Each one focuses on clean design, scalability, and real-world structure.",
            style: TextStyle(color: Colors.grey, height: 1.7),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final _Project project;
  final void Function(String url) sayOpen;

  const _ProjectCard({
    required this.project,
    required this.sayOpen,
  });

  @override
  Widget build(BuildContext context) {
    const orange = ProjectsPage.orange;

    return Container(
      width: 520,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 26, offset: Offset(0, 14)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.only(top: 7),
                decoration: BoxDecoration(
                  color: orange,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: orange, blurRadius: 14)],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900 , color: Colors.black)),
                    const SizedBox(height: 4),
                    Text(project.subtitle,
                        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          Text(
            project.description,
            style: const TextStyle(color: Colors.grey, height: 1.6),
          ),

          const SizedBox(height: 12),

          // Tags
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: project.tags.map((t) => _Tag(text: t)).toList(),
          ),

          const SizedBox(height: 14),

          // Buttons
          Row(
            children: [
              if (project.githubUrl.trim().isNotEmpty)
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: () => sayOpen(project.githubUrl),
                    icon: const Icon(Icons.code_rounded, color: orange),
                    label: const Text("GitHub",
                        style: TextStyle(fontWeight: FontWeight.w900)),
                  ),
                ),
              if (project.githubUrl.trim().isNotEmpty && project.liveUrl.trim().isNotEmpty)
                const SizedBox(width: 10),
              if (project.liveUrl.trim().isNotEmpty)
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: () => sayOpen(project.liveUrl),
                    icon: const Icon(Icons.open_in_new_rounded),
                    label: const Text("Live Demo",
                        style: TextStyle(fontWeight: FontWeight.w900)),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag({required this.text});

  @override
  Widget build(BuildContext context) {
    const orange = ProjectsPage.orange;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: orange,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: orange, blurRadius: 14)],
            ),
          ),
          const SizedBox(width: 8),
          Text(text,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

class _Project {
  final String title;
  final String subtitle;
  final String description;
  final List<String> tags;
  final String githubUrl;
  final String liveUrl;

  _Project({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tags,
    required this.githubUrl,
    required this.liveUrl,
  });
}
