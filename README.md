# 100 Days of Swift

A personal learning journey through Paul Hudson's [100 Days of Swift](https://www.hackingwithswift.com/100) course. All projects are built entirely in **View Code** — no Interface Builder, no Storyboards — based on a course adaptation created using Claude Code as a tool for tutorials adaptation and a custom skill built specifically for this workflow.

---

## Projects

### Project 1 — Storm Viewer (Days 16–18)

Storm Viewer is a simple iOS app that loads a collection of storm photographs from the app bundle and displays them in a scrollable list. Tapping any row navigates to a full-screen detail view where the image can be seen in its entirety.

The project introduces the foundational UIKit navigation model: a `UITableViewController` as the root screen embedded in a `UINavigationController`, with a `UIViewController`-based detail screen pushed onto the stack on selection. Images are discovered at runtime using `FileManager` to scan the bundle directory, and loaded on demand with `UIImage`. Key view code adaptations include configuring the window and navigation hierarchy in `SceneDelegate`, building the detail screen's `UIImageView` programmatically, and wiring cell selection without Storyboard segues.

---
