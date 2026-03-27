import OpenAI from "openai";

const client = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

const headers = {
  "Content-Type": "application/json",
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "Content-Type",
  "Access-Control-Allow-Methods": "OPTIONS,POST"
};

function response(statusCode, body) {
  return {
    statusCode,
    headers,
    body: JSON.stringify(body)
  };
}

function validate(body) {
  const required = ["childName", "childAge", "topic", "theme", "parentGoal", "length"];
  for (const key of required) {
    if (!body[key]) return `Missing field: ${key}`;
  }
  if (body.childAge < 2 || body.childAge > 7) {
    return "childAge must be between 2 and 7";
  }
  return null;
}

async function generateCoverImage(story, body) {
  const imagePrompt = `
Create a warm, child-safe storybook illustration for ages 2 to 7.

Style:
- soft storybook illustration
- pastel colors
- rounded friendly shapes
- gentle lighting
- calm bedtime feel
- no text in image
- no scary elements
- no brands
- no realistic faces

Story topic: ${body.topic}
Story theme: ${body.theme}
Child age: ${body.childAge}
Child name: ${body.childName}

Story title: ${story.title}
Story summary:
${story.story_text}

Make one simple cover illustration that matches the story.
`;

  const imageResult = await client.images.generate({
    model: "gpt-image-1",
    prompt: imagePrompt,
    size: "1024x1024"
  });

  const imageBase64 = imageResult.data?.[0]?.b64_json;

  if (!imageBase64) {
    return [];
  }

  return [
    {
      scene_id: 1,
      caption: `Cover image for ${story.title}`,
      image_base64: imageBase64
    }
  ];
}

export async function handler(event) {
  if (event.httpMethod === "OPTIONS") {
    return { statusCode: 200, headers, body: "" };
  }

  try {
    const body = JSON.parse(event.body || "{}");
    const validationError = validate(body);
    if (validationError) {
      return response(400, { error: validationError });
    }

    const prompt = `
You create stories for children ages 2 to 7.

Rules:
- Keep content warm, gentle, safe, and age-appropriate.
- No violence, fear, unsafe behavior, romance, marketing, brands, or links.
- Use simple vocabulary.
- The story must support this parent goal: ${body.parentGoal}.
- Topic: ${body.topic}.
- Theme: ${body.theme}.
- Child name: ${body.childName}.
- Child age: ${body.childAge}.
- Length: ${body.length}.
- Return only schema-valid JSON.
`;

    const result = await client.responses.create({
      model: "gpt-5.4-mini",
      input: prompt,
      text: {
        format: {
          type: "json_schema",
          name: "kid_story",
          strict: true,
          schema: {
            type: "object",
            additionalProperties: false,
            properties: {
              title: { type: "string" },
              target_age: { type: "string" },
              topic: { type: "string" },
              moral: { type: "string" },
              story_text: { type: "string" },
              focus_words: {
                type: "array",
                items: { type: "string" }
              },
              parent_followup_questions: {
                type: "array",
                items: { type: "string" },
                minItems: 2,
                maxItems: 3
              }
            },
            required: [
              "title",
              "target_age",
              "topic",
              "moral",
              "story_text",
              "focus_words",
              "parent_followup_questions"
            ]
          }
        }
      }
    });

    const story = JSON.parse(result.output_text);

    if (typeof story.story_text !== "string" || story.story_text.length > 1500) {
      return response(502, { error: "Generated story failed safety length checks" });
    }

    const images = await generateCoverImage(story, body);

    return response(200, {
      ...story,
      images
    });
  } catch (error) {
    console.error(error);
    return response(500, {
      error: "Failed to generate story",
      details: error?.message ?? "Unknown error"
    });
  }
}