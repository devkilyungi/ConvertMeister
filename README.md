**Intro:**

ConvertMeister is a versatile unit conversion app designed to simplify everyday tasks involving unit conversions. Whether you're converting lengths, temperatures, volumes, or data units, ConvertMeister provides a user-friendly interface and robust functionality to meet your needs.

**Features:**

- **Unit Categories:** Groups similar units together to make selection easier.
- **Segmented Controls:** Easily select input and output units using intuitive segmented controls.
- **Numerical Input:** Input numerical values conveniently via a text field.
- **Conversion Results:** View accurate conversion results in real-time.
- **Dark Mode Support:** Enhance user experience with a dark theme option.
- **Error Handling:** The app ensures only numeric values are computed.

**Main Technologies:**

`Swift`
`SwiftUI`

**Process of Making the App:**

I started by finding UI inspiration. I like the Samsung stock Calculator conversion design so I drew inspiration from that.

I then created the application project in xcode. Next, I created the layout over a few iterations until I got what I wanted. Next, I started on the logic: I focused on making sure length conversions were working properly, then I added support for time, temperature, volume and data.

Next I tried to improve my code as it was very long and repetetive. I already had the `ConversionType` enum, so I created a `ConversionUnit` protocol that all my unit types could conform to. I didn't know about `associatedtype` and `typealias` so I tried various solutions unsuccessfully until I saw it while searching for solutions on Google. Having figured that out, at least I believe I was able to, I created individual unit enums with computed properties and grouped their subtypes withing their bodies.

Finally, I separated everthing into groups and files to minimize the code that was in `ContentView`.

The most challenging part, which I eventually abandoned, was trying to use one binding to hold the currently selected conversion type; length, time, etc. I resorted to have individual state variables to hold the current input and output for each type and listen for changes on each of those types.

**How Can It Be Improved:**

- **Localization:** It would be great if the app supported multiple languages for broader accessibility.
- **History Log:** An interesting feature would be to keep track of past conversions for reference. I will be looking into this in the future when I check out CoreData.
- **Favorites:** Something I thought of as an afterthought is the ability to save frequently used conversions for quick access.

**Demo Images and Video:**

🎥 - [Demo Video](./assets/demo_video.mov)

📸 - [Demo Images: Light theme](./assets/home_light.png)

📸 - [Demo Images: Dark theme](./assets/home_dark.png)
