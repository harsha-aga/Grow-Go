# Grow-Go
AI-powered iOS learning app for children (ages 2–7) featuring story generation, interactive learning, and real-time image creation using OpenAI.

# 🌈 GrowAndGo – AI Learning App for Kids

GrowAndGo is an AI-powered iOS application designed for children aged 2–7 to learn through interactive storytelling, visuals, and guided activities.

The app combines education and play by generating personalized stories, images, and learning prompts based on a child’s age, interests, and parental goals.

---

## ✨ Features

- 📚 AI-generated personalized stories
- 🎨 Real-time image generation for each story
- 🔊 Read-aloud functionality (text-to-speech)
- 🧠 Focus words and learning reinforcement
- 👨‍👩‍👧 Parent-guided learning goals
- 🎯 Topic-based education (numbers, letters, sharing, etc.)
- 🌈 Kid-friendly UI with playful design

---

## 🧱 Tech Stack

### iOS App
- SwiftUI
- MVVM Architecture
- Async/Await Networking
- AVSpeechSynthesizer (Text-to-Speech)

### Backend
- Node.js (Serverless-ready)
- OpenAI Responses API (structured JSON)
- OpenAI Image Generation (gpt-image-1)

---

## 🧠 How It Works

1. Parent inputs:
   - Topic (e.g., counting)
   - Theme (e.g., bedtime)
   - Learning goal

2. Backend:
   - Generates structured story using OpenAI
   - Generates matching illustration
   - Returns JSON response

3. App:
   - Displays story + image
   - Highlights focus words
   - Provides follow-up questions
   - Reads story aloud

---

## 🖼 Example Response

```json
{
  "title": "Maya Counts the Sleepy Stars",
  "story_text": "...",
  "images": [
    {
      "scene_id": 1,
      "caption": "Cover image",
      "image_base64": "..."
    }
  ]
}
