🎬 AI-Powered Movie Recommendation System

An AI-driven personalized movie recommendation backend built with Spring Boot and Gemini API, designed to generate intelligent movie suggestions based on user preferences, mood, genre, year range, and conversation history.

🚀 Features

🤖 AI-Powered Recommendations using Gemini API

🧠 Personalized Suggestions based on user chat history

🎭 Filters by genre, mood, and year range

💬 Chat history storage for context-aware responses

🗄️ Persistent storage using JPA & PostgreSQL

🌐 RESTful APIs for seamless frontend integration

🔐 External user ID mapping for secure user handling

🛠️ Tech Stack
Backend

Java 17

Spring Boot

Spring Web

Spring Data JPA

WebClient

Lombok

PostgreSQL

AI Integration

Google Gemini API

Frontend (Client)

React (Vite)

Deployed on Vercel

📐 Architecture Overview
Controller → Service → Repository → Database
                 ↓
              Gemini API


Controller: Handles HTTP requests from frontend

Service: Business logic & AI integration

Repository: Database operations

Gemini API: Generates movie recommendations

📦 Project Structure
com.Balu.Movie_Recommend
├── Controller
│   └── RecommendationController.java
├── Service
│   ├── RecommendationService.java
│   └── GeminiClientService.java
├── Entity
│   ├── AppUser.java
│   ├── ChatMessage.java
│   ├── MovieRecommendation.java
│   └── SenderType.java
├── DTO
│   └── RecommendationRequest.java
├── Repositories
│   ├── AppUserRepository.java
│   ├── ChatMessageRepository.java
│   └── MovieRecommendationRepository.java

🔄 Application Flow

Frontend sends user request (message, mood, genre, etc.)

Backend maps external user ID to internal database user

Recent chat history is fetched for personalization

A structured prompt is built and sent to Gemini API

Gemini returns movie suggestions in JSON format

Response is sanitized and parsed

Recommendations and chat history are stored in DB

Final movie list is returned to frontend

📥 Sample API Request

POST /api/recommendations

{
  "userExternalId": "user_123",
  "message": "Suggest emotional movies",
  "genre": "Drama",
  "yearFrom": 2000,
  "yearTo": 2022,
  "mood": "Sad"
}

📤 Sample API Response
[
  {
    "title": "The Pursuit of Happyness",
    "year": "2006",
    "genre": "Drama",
    "moodTag": "emotional",
    "posterUrl": "",
    "rating": 8.0
  }
]

🔐 Environment Configuration

Create an application.properties file:

spring.datasource.url=jdbc:postgresql://localhost:5432/movies
spring.datasource.username=your_db_username
spring.datasource.password=your_db_password

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

gemini.api.base-url=https://generativelanguage.googleapis.com/v1beta
gemini.model=gemini-1.5-flash
gemini.api.key=YOUR_GEMINI_API_KEY

🧠 Key Highlights

Handles non-standard AI responses by sanitizing JSON output

Uses chat context to improve AI personalization

Secure backend design with external ID mapping

Clean separation of concerns using layered architecture

🔮 Future Enhancements

User authentication (JWT / OAuth)

Recommendation caching

Movie poster enrichment via TMDB API

Recommendation feedback (like/dislike)

Analytics dashboard

👨‍💻 Author

Ashrith Balaji Gudla
Java Full Stack Developer
📧 Email: ashrithbalajigudla@gmail.com

⭐ If you like this project

Give it a ⭐ on GitHub and feel free to fork or contribute!
