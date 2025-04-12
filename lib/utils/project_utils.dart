import 'package:flutter/material.dart';

class ProjectUtils {
  String image;
  String name;
  String description;
  String link;
  List<String> available;

  ProjectUtils({
    required this.image,
    required this.name,
    required this.description,
    required this.link, 
    required this.available
  });
}

List<ProjectUtils> mobileProject = [
  ProjectUtils(
    image: "assets/projects/thx.png",
    name: "Online Food Shop",
    description:
        "Lead a team of 4 members to create a mobile application called Tap Hoa Xanh to help users shop for food online.",
    link: "https://github.com/DaodaihaiCrays/BHX.git",
    available: [
      "assets/projects/android.png"
    ]
  ),

  ProjectUtils(
    image: "assets/projects/happy_food.png",
    name: "Happy Food",
    description:
        "Built a Flutter-based food ordering app with user and admin roles; users can browse dishes, manage cart and wallet, while admins can add new dishes by category.",
    link: "https://github.com/DaodaihaiCrays/food_shopping.git",
    available: [
      "assets/projects/android.png",
      "assets/projects/apple.png"
    ]
  )
];

class ProjectBEItem {
  String name;
  List<String> description;
  String link;
  List<String> technologies;

  ProjectBEItem({
    required this.name,
    required this.description,
    required this.link,
    required this.technologies,
  });
}

List<ProjectBEItem> beProjects = [
  ProjectBEItem(
    name: "Job Hunter", 
    description: [
      "I developed a backend system for recruitment management using Spring Boot, inspired by platforms such as TopCV.", 
      "Candidates can upload files and images, manage their resumes, while employers can post job listings and manage company profiles."
    ], 
    link: "https://github.com/DaodaihaiCrays/jobhunter_spring.git",
    technologies: [
      "assets/spring.svg",
      "assets/mysql.svg",
    ]
  ), 

  ProjectBEItem(
    name: "Movie Management", 
    description: [
      "Developed a microservice-based movie management system using Spring Boot, consisting of MovieService and GenreService.", 
      "Each movie belongs to a genre, and we can retrieve movie lists, genre lists, and movies by genre.",
      "GenreService calls the MovieService API via WebFlux to get a list of movies by genre when retrieving a genre."
    ], 
    link: "https://github.com/DaodaihaiCrays/movie_management.git",
    technologies: [
      "assets/spring.svg",
      "assets/mysql.svg",
    ]
  ), 

  ProjectBEItem(
    name: "Blogging System", 
    description: [
      "Developed a backend system for blog management using the Express.js framework, fully implementing CRUD (Create, Read, Update, Delete) operations for posts, users, and comments.", 
      "Users can upload their file, image on the system."
    ], 
    link: "https://github.com/DaodaihaiCrays/Blogging_system.git",
    technologies: [
      "assets/node-js.svg",
      "assets/mysql.svg",
    ]
  ), 

  ProjectBEItem(
    name: "Manage Event", 
    description: [
      "A Backend system for event management using Golang languages", 
      "I used the gin-gonic/gin framework to create APIs. Implemented full CRUD (Create, Read, Update, Delete) capabilities for event.",
      "Users can register and update their own events"
    ], 
    link: "https://github.com/DaodaihaiCrays/manage_event.git",
    technologies: [
      "assets/golang.svg",
      "assets/mysql.svg",
    ]
  ), 
];