#  SketchVsQuartz
### Explore rendering differences between Sketch and iOS

## Background
This project was created to accompany my post on Medium titled "Why Your App Looks Better in Sketch". The post can be found at the link below:

[Medium Post](https://medium.com/@nathangitter/why-your-app-looks-better-in-sketch-3a01b22c43d7)

## Running the App
The app is best seen on a real device, although the simulator works as well.

To run the app on a real device, you may need to specify a development team. To do this, select the blue project file at the top of the project navigator, and choose a development team from the dropdown under General > Signing.

Currently, the layout is broken on iPhone SE sized devices. Please use an iPhone X, iPhone 8, or iPhone 8+ sized device.

## App Structure
The app has three tabs: type, shadows, and gradients. Each tab has a corresponding view controller: `TypeViewController`, `ShadowsViewController`, and `GradientsViewController`, respectively. The layout for each view controller is set in the storyboard (Main.storyboard).

## How it Works
A screenshot from Sketch is embedded in a `UIImageView` on each view controller. By default, this image is hidden (`alpha = 0`). When the user touches the screen, the Sketch image is shown, and the real elements are hidden.

Images from Sketch are 375x400 @ 3x for a final resolution of 1125x1200. This means the images are optimized for iPhone X, but should display reasonably well on other device sizes.

Each view controller is set up in the exact same way, so it should be fairly straightforward to make modifications.

## Questions / Comments
If you have any feedback, feel free to reach out. You can find me on Twitter here: [http://twitter.com/@nathangitter](http://twitter.com/@nathangitter)
