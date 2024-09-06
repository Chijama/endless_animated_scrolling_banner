# Endless Animated Scrolling Banner

This project is a simple endless animated scrolling banner built using Flutter. It allows for continuous scrolling of text or widgets, ideal for applications where dynamic, visually appealing content needs to be displayed in an endless loop.

Feel free to use this in your Flutter projects and customize it as needed. It’s simple to integrate and fully adaptable to a variety of use cases.

## Features
 * Continuous scrolling of any widget
 * Fully customizable speed, direction, and content
 * Lightweight and efficient, making it suitable for all Flutter projects
 * Easy to implement and extend

## Example Usage
This demonstrates how you can create multiple types of banners with different content and scrolling speeds. You can customize these banners further by adjusting the speed, content, or style to fit your project needs.
### 1. 
``` 
EndlessScrollingAnimatedBanner(
  scrollSpeed: 3.5,  // Controls the scrolling speed
  bannerBuilder: (scrollController) => SimpleBanner(
    scrollController: scrollController,
    listOfStrings: const [
      "plan ",
      "design ",
      "implement ",
      "test",
      "deploy ",
      "maintain"
    ],
  ),
),
 ```
/// Vidie Illustration

https://github.com/user-attachments/assets/8d603efa-d40a-4b6a-8788-ebf2614e9414

 

### 2. In Progress
```
EndlessScrollingAnimatedBanner2(
  scrollSpeed: 10,  // Faster scrolling speed for this banner
  bannerBuilder: (offSet) => WarningBanner(
    offset: offSet,
    listOfStrings: const ["WARNING", "DO NOT CROSS"],
  ),
),
 ```
/// Video 2

## Contributing
If you’d like to contribute to this project, feel free to open a Pull Request. Contributions are welcome, whether it’s adding new features, fixing bugs, or improving documentation.

Steps to contribute: 
1. Fork this repository
2. Create a new branch (git checkout -b feature/new-feature)
3. Make your changes
4. Commit the changes (git commit -m 'Add new feature')
5. Push to the branch (git push origin feature/new-feature)
6. Open a Pull Request

## Issues
If you encounter any problems or have suggestions, please create an issue in the Issues section. I’ll do my best to address them as soon as possible!

## Contact
Feel free to reach out if you have any questions or feedback. My Contact info is on my profile.
