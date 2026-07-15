# 100 Days of Swift — Dia 18

Fonte: https://www.hackingwithswift.com/100/18

---

## Pagina do dia

	100 Days of Swift – Day 18 – Hacking with Swift
							Forums
							Learn
								 Start Here
								 Latest Articles
								 What's new in Swift?
								 100 Days of SwiftUI
								 100 Days of Swift
								 Swift Knowledge Base
								 SwiftUI by Example
								 Swift in Sixty Seconds
								 Hacking with Swift
								 YouTube videos
								 Swift Playgrounds
								 Get the iOS App
							Careers
								 Start Here
								 Swift Career Accelerator
								 Interview Questions
								 Interactive Review
								 Test your Swift
							Store
								 Subscribe to Hacking with Swift+
								 Browse Swift Courses
								 Book bundles
								 Frequently Asked Questions
								 Lifetime Update Policy
								 Frequent Flyer Club
								 Reader Reviews
								 Refund Policy
							About
								 About Hacking with Swift
								 Swift Community Awards
								 Hacking with Swift Live
								 Conference Talks
								 Affiliate Program
								 Newsletter
								 Sponsor the site
														SUBSCRIBE
			WWDC26: Save 50% on my books and bundles! >>
                DAY 18
                                         Project 1, part three
                                        Now that our app is complete, it’s time for a quick recap what you learned, a short test to make sure you’ve understood what was taught, then your first challenges – exercises designed to get you writing your own code as quickly as possible.
I do not provide the answers to these challenges. This is intentional: I want you to figure it out by yourself rather than just looking at someone else’s work. Trying things out for yourself, making mistakes, and finding solutions is key to learning – as Maya Angelou once said, “nothing will work unless you do.”
Today you should work through the wrap up chapter for project 1, complete its review, then work through all three of its challenges. 
Wrap up
Review for Project 1: Storm Viewer
Once you’re done, tell other people: you’ve completed your first iOS project, you’ve passed the test, and you’ve even extended it with your own code.
You should be proud of what you’ve accomplished – good job!
                                        Need help? Tweet me @twostraws!
                     
    SPONSORED You know how to code. Now learn how to ship. My new app focuses on everything around your app that actually determines success, bringing together your App Store listing, competitor research, pricing, reviews, analytics, marketing, and launch workflow so you're never figuring it out alone.
    Download Kickstart here
                    100 Days of Swift
                    The 100 Days of Swift is a free collection of videos, tutorials, tests, and more to help you learn Swift faster. Click here to learn more, or watch the video below.
                    Back to 100 Days of Swift
			Click here to visit the Hacking with Swift store >>
							Twitter
							Mastodon
							Email
							Sponsor the site
							About            
							Glossary            
							Code License            
							Privacy Policy            
							Refund Policy            
							Update Policy            
							Code of Conduct
						Swift, SwiftUI, the Swift logo, Swift Playgrounds, Xcode, Instruments, Cocoa Touch, Touch ID, AirDrop, iBeacon, iPhone, iPad, Safari, App Store, watchOS, tvOS, visionOS, Mac and macOS are trademarks of Apple Inc., registered in the U.S. and other countries. Pulp Fiction is copyright &copy; 1994 Miramax Films.
						Hacking with Swift is &copy;2025 Hudson Heavy Industries.
             
                You are not logged in
                Log in or create account
             
			Link copied to your pasteboard.
		function toggleReadStatus(status) {
			$.ajax({
				type: "POST",
				url: "/read-status",
				data: { "url": "/100/18", "status": status },
			});
			$(".readStatusButton").hide();
			$(".readStatusChanged").show();
		}
		$(function() {
			$('#page-rating').barrating('show', {
				theme: 'css-stars',
				onSelect: function(value, text, event) {
					if (typeof(event) !== 'undefined') {
						// rating was selected by a user
						var rating = $(event.target).data("rating-value");
						$.ajax({
							type: "POST",
							url: "/rating",
							data: { "url": window.location.pathname, "rating": rating },
						});
						$("#page-rating-start").hide();
						$("#page-rating-end").show();
					} else {
						// rating was selected programmatically
						// by calling `set` method
					}
				}
			});
					});


---

## Subtopico: /articles/272/swift-career-accelerator

Fonte: https://www.hackingwithswift.com/articles/272/swift-career-accelerator

	Go further, faster with the Swift Career Accelerator – Hacking with Swift
							Forums
							Learn
								 Start Here
								 Latest Articles
								 What's new in Swift?
								 100 Days of SwiftUI
								 100 Days of Swift
								 Swift Knowledge Base
								 SwiftUI by Example
								 Swift in Sixty Seconds
								 Hacking with Swift
								 YouTube videos
								 Swift Playgrounds
								 Get the iOS App
							Careers
								 Start Here
								 Swift Career Accelerator
								 Interview Questions
								 Interactive Review
								 Test your Swift
							Store
								 Subscribe to Hacking with Swift+
								 Browse Swift Courses
								 Book bundles
								 Frequently Asked Questions
								 Lifetime Update Policy
								 Frequent Flyer Club
								 Reader Reviews
								 Refund Policy
							About
								 About Hacking with Swift
								 Swift Community Awards
								 Hacking with Swift Live
								 Conference Talks
								 Affiliate Program
								 Newsletter
								 Sponsor the site
														SUBSCRIBE
			WWDC26: Save 50% on my books and bundles! >>
                            Go further, faster with the Swift Career Accelerator
                            Your complete Swift journey: from first job to leadership, all in one powerful program
                            Paul Hudson    November 10th 2025
     @twostraws
                            Unleash your full potential as a Swift developer with the all-new Swift Career Accelerator: the most comprehensive, career-transforming learning resource ever created for iOS development.
Whether you’re just starting out, looking to land your first job, or aiming to become a lead developer, this program offers everything you need to level up – from mastering Swift’s latest features to conquering interview questions and building robust portfolios.
So, if you're ready for a guided journey that will elevate your skills and accelerate your career, read on…
Your complete pathway
The Swift Career Accelerator aims to give you a complete pathway to take your career forward, no matter what your level is right now.
It does this by bringing together for the first time the world's largest collection of Swift development resources in one place, then carefully organizes it across five career stages so that everyone at every level has something to take them forward…
Level 1: Kickstart your career and land your first job
If you’re just starting out, Level 1 is designed to help you build the foundation for a successful career in Swift development. Along with my popular 100 Days of SwiftUI and Ultimate Portfolio App courses, you’ll gain exclusive access to my brand-new Take Home Test course. You’ll master essential skills like Git source control and dive into critical data structures like queues, stacks, and trees.
But that’s just the beginning. You’ll also get a wealth of new interview questions with expert answers, step-by-step guidance on crafting a standout resume, and practical tips for launching your first apps on the App Store. Everything you need to land that first job and start building your future is right here.
Level 2: Strengthen your skills and advance as a developer
Once you've found your first job, it's time to build on that foundation and take your skills to the next level. Here you'll move on to more detailed topics such as generics, concurrency, Swift Package Manager, and protocol-oriented programming, giving you the skills you need to develop competence and confidence. 
You'll also explore a variety of core Computer Science topics such as Big O notation for analyzing time/space complexity, polymorphism, hashing and encryption, binary search, and networking. On top of that, you'll master Apple-specific topics such as Xcode power tips, getting the most from Apple's documentation, and more.
Level 3: Elevate your expertise and move up to a senior role
As you prepare to move into senior roles, the Swift Career Accelerator is ready to help. Here you'll progress onto more advanced topics such as memoization, retain cycles, memory leaks, continuous integration, all with the goal of helping you write smarter, more maintainable code.
But technical skills are just the beginning. We'll also explore a wide range of other skills that senior developers rely on, like regular expressions, the macOS terminal, advanced Git techniques, and more. With a curriculum that rivals a university-level education, you’ll gain the confidence and competence to thrive in senior development roles and take on more complex challenges.
Level 4: Learn what it takes to lead teams
When you’re ready to take on the challenge of leading your own team, the Swift Career Accelerator has everything you need to succeed.
You'll learn how to handle large-scale project refactors, how to design scalable software architectures, how to handle thorny issues such as actor reentrancy, code smells, and managing legacy code and technical debt.
Beyond coding, you’ll develop the leadership skills that set great lead developers apart. From creating technical roadmaps and implementing agile methodologies to building strong teams and fostering community involvement, this level ensures you’re prepared to lead both technically and strategically.
So what's level 5?
I said there are five levels, and above there are only four. Is level 5 some kind of Senior Guru Rockstar Architect?
No.
Level 5 is my personal favorite level: hobbyists and indie developers who love writing code for the joy of learning and building. This level is all about creativity and exploration, offering a range of app projects across various Apple platforms, interesting algorithms to explore, and key coding techniques that will boost your confidence and elevate your skills.
Plus, I’ll be curating the very best from the other four levels just for you, including Xcode tips and tricks, fun coding challenges, and must-read book reviews. It’s a space designed for everyone who wants to keep growing, experimenting, and enjoying the art of coding – indie developers, hobbyists, and beyond.
How much does it cost?
The Swift Career Accelerator is built on over a decade of work from me, bringing together material from across my full range of books and courses. It’s a truly massive resource, featuring brand-new tutorials, extensively updated material, and everything meticulously organized to help you succeed at every stage of your Swift journey.
But here's the best part: the entire Swift Career Accelerator is free for everyone who has subscribed to Hacking with Swift+ for at least 18 months.
That means you'll have access to all five levels of curriculum – you don't need to choose just one. Feel free to explore and move between them whenever you like, as you continue building your skills!
Subscribe today
Frequently asked questions
Q. Are the tutorials text or video?
A. Every tutorial comes as both text and video, so you can use whichever you prefer.
Q. Is this available for teams?
A. Yes! Hacking with Swift+ has a team licensing option, and any team with at least three members gets immediate access to the Swift Career Accelerator and the full online reading library. Visit Hacking with Swift+ for more information.
Q. What else does Hacking with Swift+ get me, apart from the Swift Career Accelerator?
A. Hacking with Swift+ has a huge collection of other benefits, including ad-free browsing across the site, access to my monthly live streams, a free ticket to my Unwrap Live event every year, a year-round discount on buying my books, and more.
Q. I subscribed for a couple of years then stopped. If I resubscribe do I start at zero months again?
A. The answer is a massive no: all that matters is your total subscription length. You can start and stop as often as you want, as long as the total number of all your months is at least 18.
Q. I don't subscribe at all. How can I get all this immediately?
A. There's a 2-year subscription option for Hacking with Swift+, which immediately gives you access to all my books, the complete Swift Career Accelerator, and all the other benefits of Hacking with Swift+.
Q. I've only subscribed for a few months. How can I get the Swift Career Accelerator now?
A. You can upgrade an existing monthly or annual subscription term through Gumroad – switching to the two-year subscription immediately unlocks it all, and you just pay the difference from your existing subscription.
Subscribe today
    SPONSORED You know how to code. Now learn how to ship. My new app focuses on everything around your app that actually determines success, bringing together your App Store listing, competitor research, pricing, reviews, analytics, marketing, and launch workflow so you're never figuring it out alone.
    Download Kickstart here
                        BUY OUR BOOKS
                    More articles
                    RSS feed
                                    Introducing Kickstart: the app that helps indie developers ship
                                    Teach your AI to write Swift the Hacking with Swift way
                                    Agent skills in Xcode: How to install and use them today
                                    SwiftUI Agent Skill - Write better code with Claude, Codex, and other AI tools
                                    What to fix in AI-generated Swift code
                                    One Swift mistake everyone should stop making today
                                    Level up your SwiftUI
                                    What&#039;s new in SwiftUI for iOS 26
                  Was this page useful? Let us know!
                      1
                      2
                      3
                      4
                      5
                                Average rating: 4.0/5
                    Thank you!
    {
      "@context": "http://schema.org",
      "@type": "Article",
      "author": "Paul Hudson",
      "datePublished": "2024-09-19",
      "dateModified": "2025-11-10",
      "headline": "Go further, faster with the Swift Career Accelerator",
      "image": {
        "@type": "imageObject",
        "url": "https://www.hackingwithswift.com/uploads/swift-career-accelerator.jpg"
        },
        "aggregateRating": {
            "@type": "AggregateRating",
            "ratingValue": "4.0",
            "worstRating": "1.0",
            "bestRating": "5.0",
            "reviewCount": "15"
        },
      "publisher": {
        "@type": "Organization",
        "name": "Hacking with Swift",
        "logo": {
          "@type": "imageObject",
            "url": "https://www.hackingwithswift.com/files/logo-large.png"
          }
        }
      }
			Click here to visit the Hacking with Swift store >>
							Twitter
							Mastodon
							Email
							Sponsor the site
							About            
							Glossary            
							Code License            
							Privacy Policy            
							Refund Policy            
							Update Policy            
							Code of Conduct
						Swift, SwiftUI, the Swift logo, Swift Playgrounds, Xcode, Instruments, Cocoa Touch, Touch ID, AirDrop, iBeacon, iPhone, iPad, Safari, App Store, watchOS, tvOS, visionOS, Mac and macOS are trademarks of Apple Inc., registered in the U.S. and other countries. Pulp Fiction is copyright &copy; 1994 Miramax Films.
						Hacking with Swift is &copy;2025 Hudson Heavy Industries.
             
                You are not logged in
                Log in or create account
             
			Link copied to your pasteboard.
		function toggleReadStatus(status) {
			$.ajax({
				type: "POST",
				url: "/read-status",
				data: { "url": "/articles/272/swift-career-accelerator", "status": status },
			});
			$(".readStatusButton").hide();
			$(".readStatusChanged").show();
		}
		$(function() {
			$('#page-rating').barrating('show', {
				theme: 'css-stars',
				onSelect: function(value, text, event) {
					if (typeof(event) !== 'undefined') {
						// rating was selected by a user
						var rating = $(event.target).data("rating-value");
						$.ajax({
							type: "POST",
							url: "/rating",
							data: { "url": window.location.pathname, "rating": rating },
						});
						$("#page-rating-start").hide();
						$("#page-rating-end").show();
					} else {
						// rating was selected programmatically
						// by calling `set` method
					}
				}
			});
					});


---

## Subtopico: /read/1/7/wrap-up

Fonte: https://www.hackingwithswift.com/read/1/7/wrap-up

	Wrap up - a free Hacking with Swift tutorial
							Forums
							Learn
								 Start Here
								 Latest Articles
								 What's new in Swift?
								 100 Days of SwiftUI
								 100 Days of Swift
								 Swift Knowledge Base
								 SwiftUI by Example
								 Swift in Sixty Seconds
								 Hacking with Swift
								 YouTube videos
								 Swift Playgrounds
								 Get the iOS App
							Careers
								 Start Here
								 Swift Career Accelerator
								 Interview Questions
								 Interactive Review
								 Test your Swift
							Store
								 Subscribe to Hacking with Swift+
								 Browse Swift Courses
								 Book bundles
								 Frequently Asked Questions
								 Lifetime Update Policy
								 Frequent Flyer Club
								 Reader Reviews
								 Refund Policy
							About
								 About Hacking with Swift
								 Swift Community Awards
								 Hacking with Swift Live
								 Conference Talks
								 Affiliate Program
								 Newsletter
								 Sponsor the site
														SUBSCRIBE
			WWDC26: Save 50% on my books and bundles! >>
                                < Previous: Final tweaks: hidesBarsOnTap and large titles
                                 
                                Table of Contents >
                    Wrap up
This has been a very simple project in terms of what it can do, but you've also learned a huge amount about Swift, Xcode and storyboards. I know it's not easy, but trust me: you've made it this far, so you're through the hardest part.
To give you an idea of how far you've come, here are just some of the things we've covered: table views and image views, app bundles, FileManager, typecasting, view controllers, storyboards, outlets, Auto Layout, UIImage, and more.
Yes, that's a huge amount, and to be brutally honest chances are you'll forget half of it. But that's OK, because we all learn through repetition, and if you continue to follow the rest of this series you'll be using all these and more again and again until you know them like the back of your hand.
Review what you learned
Anyone can sit through a tutorial, but it takes actual work to remember what was taught. It’s my job to make sure you take as much from these tutorials as possible, so I’ve prepared a short review to help you check your learning.
Click here to review what you learned in project 1.
Challenge
This has the beginnings of a useful app, but if you really want your new knowledge to sink in you need to start writing some new code yourself – without following a tutorial, or having an answer you can just look up online.
So, each time you complete a project I’ll be setting you a challenge to modify it somehow. Yes, this will take some work, but there is no learning without struggle – all the challenges are completely within your grasp based on what you’ve learned so far.
For this project, your challenges are:
Use Interface Builder to select the text label inside your table view cell and adjust its font size to something larger – experiment and see what looks good.
In your main table view, show the image names in sorted order, so “nssl0033.jpg” comes before “nssl0034.jpg”.
Rather than show image names in the detail title bar, show “Picture X of Y”, where Y is the total number of images and X is the selected picture’s position in the array. Make sure you count from 1 rather than 0.
Hints
It is vital to your learning that you try the challenges above yourself, and not just for a handful of minutes before you give up.
Every time you try something wrong, you learn that it’s wrong and you’ll remember that it’s wrong. By the time you find the correct solution, you’ll remember it much more thoroughly, while also remembering a lot of the wrong turns you took.
This is what I mean by “there is no learning without struggle”: if something comes easily to you, it can go just as easily. But when you have to really mentally fight for something, it will stick much longer.
But if you’ve already worked hard at the challenges above and are still struggling to implement them, I’m going to write some hints below that should guide you to the correct answer.
If you ignore me and read these hints without having spent at least 30 minutes trying the challenges above, the only person you’re cheating is yourself.
Still here? OK. Let’s take a look at the challenges…
Use Interface Builder to select the text label inside your table view cell and adjust its font size to something larger – experiment and see what looks good.
This ought to be easy enough: open Main.storyboard, then use the document outline to select the table view, select the Picture cell inside it, select the Content View inside that, and finally select the Title label. In the attributes inspector you’ll find a number of options – try to figure out which one controls the font size.
In your main table view, show the image names in sorted order, so “nssl0033.jpg” comes before “nssl0034.jpg”.
These pictures may or may not already be sorted for you, but your challenge here is to make sure they are always sorted. We’ve covered sorting arrays previously, and you should remember there’s a sort() method you can use.
However, the question is: where should it be called? You could call this method each time you append an “nssl” picture to the pictures array, but that just causes extra work. Where could you put a call to sort() so its done only once, when the images have all been loaded?
Rather than show image names in the detail title bar, show “Picture X of Y”, where Y is the total number of images and X is the selected picture’s position in the array. Make sure you count from 1 rather than 0.
In this project you learned how to create properties like this one:
var selectedImage: String?
You also learned how to set those properties from somewhere else, like this:
vc.selectedImage = pictures[indexPath.row]
This challenge requires you to make two new properties in DetailViewController: one to contain the image’s position in the array, and one to contain the number of pictures.
For example, you might add these two properties to DetailViewController:
var selectedPictureNumber = 0
var totalPictures = 0
You can then use those for the title in the navigation bar by using string interpolation. Remember, string interpolation looks like this:
title = "This image is \(selectedImage)"
How can you use that with selectedPictureNumber and totalPictures?
Once that’s done, you need to pass in some values for those properties. We create DetailViewController here:
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
        vc.selectedImage = pictures[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
That sets the selectedImage property using one of the strings from the pictures array. Which string? Well, we use indexPath.row for that, because that tells us which table view cell was selected.
So, we can use indexPath.row to set the selectedPictureNumber property in DetailViewController – just make sure you add 1 to it so that it counts from 1 rather than 0.
As for the totalPictures property in DetailViewController, which needs to contain the total number of pictures in our array. We already wrote code to read the size of the array inside the numberOfRowsInSection method – how can you use similar code to set totalPictures?
    SPONSORED You know how to code. Now learn how to ship. My new app focuses on everything around your app that actually determines success, bringing together your App Store listing, competitor research, pricing, reviews, analytics, marketing, and launch workflow so you're never figuring it out alone.
    Download Kickstart here
Share your success!
One of the most effective motivators of success is sharing your progress with other people – when you tell folks what you're doing and what you've learned, it encourages you to come back for more, which in turn will help you reach your app development goals faster.
So, now that you've done all the hard work it's time to share your success: tell folks that you've completed this project, either by clicking the button below to start composing a tweet, or by writing your own message from scratch. This will definitely encourage you to keep learning, but it will also help other folks discover my work – thank you!
Tweet!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs'); 
                                < Previous: Final tweaks: hidesBarsOnTap and large titles
                                 
                                Table of Contents >
                                        Table of Contents
                        BUY OUR BOOKS
                  Was this page useful? Let us know!
                      1
                      2
                      3
                      4
                      5
                                Average rating: 4.7/5
                    Thank you!
    {
      "@context": "http://schema.org",
      "@type": "Article",
      "author": "Paul Hudson",
      "datePublished": "2021-03-11",
      "headline": "Wrap up",
      "image": {
        "@type": "imageObject",
        "url": "https://www.hackingwithswift.com/files/logo-large.png"
        },
        "aggregateRating": {
            "@type": "AggregateRating",
            "ratingValue": "4.7",
            "worstRating": "1.0",
            "bestRating": "5.0",
            "reviewCount": "121"
        },
      "publisher": {
        "@type": "Organization",
        "name": "Hacking with Swift",
        "logo": {
          "@type": "imageObject",
            "url": "https://www.hackingwithswift.com/files/logo-large.png"
          }
        }
      }
			Click here to visit the Hacking with Swift store >>
							Twitter
							Mastodon
							Email
							Sponsor the site
							About            
							Glossary            
							Code License            
							Privacy Policy            
							Refund Policy            
							Update Policy            
							Code of Conduct
						Swift, SwiftUI, the Swift logo, Swift Playgrounds, Xcode, Instruments, Cocoa Touch, Touch ID, AirDrop, iBeacon, iPhone, iPad, Safari, App Store, watchOS, tvOS, visionOS, Mac and macOS are trademarks of Apple Inc., registered in the U.S. and other countries. Pulp Fiction is copyright &copy; 1994 Miramax Films.
						Hacking with Swift is &copy;2025 Hudson Heavy Industries.
             
                You are not logged in
                Log in or create account
             
			Link copied to your pasteboard.
		function toggleReadStatus(status) {
			$.ajax({
				type: "POST",
				url: "/read-status",
				data: { "url": "/read/1/7/wrap-up", "status": status },
			});
			$(".readStatusButton").hide();
			$(".readStatusChanged").show();
		}
		$(function() {
			$('#page-rating').barrating('show', {
				theme: 'css-stars',
				onSelect: function(value, text, event) {
					if (typeof(event) !== 'undefined') {
						// rating was selected by a user
						var rating = $(event.target).data("rating-value");
						$.ajax({
							type: "POST",
							url: "/rating",
							data: { "url": window.location.pathname, "rating": rating },
						});
						$("#page-rating-start").hide();
						$("#page-rating-end").show();
					} else {
						// rating was selected programmatically
						// by calling `set` method
					}
				}
			});
					});

