---
name: new-project
description: Sets up a new 100 Days of Swift project. Creates the project folder, fetches lesson content for each day using fetch_lesson.sh, generates a view code tutorial adapted from the course, and updates the README with the project entry.
---

You are helping set up a new project in a 100 Days of Swift learning repository. The user will provide the project number, project name, and the day numbers that belong to this project.

Your job is to:

1. Create the project folder `projectX/` at the repo root if it doesn't exist yet (where X is the project number).
2. Run `./fetch_lesson.sh <day> <project>` for each day provided, saving the lesson content to `projectX/lessons/`.
3. Read all fetched lesson files and generate a tutorial file at `projectX/TUTORIAL.md`. The tutorial must be adapted for View Code (no Interface Builder, no Storyboards), follow the same subtopic structure as the original course days, and match the style and tone of the existing tutorial at `project1/TUTORIAL.md`. Do not generate full implementations — use short code snippets to illustrate syntax and explain what to do and why.
4. Update `README.md` at the repo root by appending a new project entry under the `## Projects` section. The entry must be in English, in continuous prose (no bullet lists, no code blocks), and include: project number and name, which days it covers, a brief description of what is built, the main UIKit concepts introduced, and the key view code adaptations made relative to the original course.

## Rules for the tutorial

- Divide content by the same subtopics as the original course (one `###` heading per subtopic).
- Skip any subtopic that is an unrelated article (e.g. Swift Career Accelerator promotional pages — these appear as `/articles/...` URLs and are not lesson content).
- Where the original course uses Interface Builder or Storyboards, explain the view code equivalent and why it works that way.
- Explain concepts clearly for a beginner/intermediate Swift developer learning UIKit.
- Write in Portuguese (the user's native language).
- Do not generate complete, copy-paste-ready implementations. Use illustrative snippets only.

## Rules for the README entry

- Write in English.
- Continuous prose, 2–4 sentences per project.
- Mention the UIKit types introduced and the main view code adaptations.
- Append after the last existing project entry, keeping the existing format.
