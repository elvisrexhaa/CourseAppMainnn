
 **WELCOME TO EDUKEY!!!**

Follow the following steps to get started with eduKey.

1) Clone this repository or download the file and open it through xcode.
2) Run the code through the simulator
3) Upon loading, a splashscreen will be shown: "CLICK GET STARTED BUTTON"
4) After that, a new screen is shown with smooth animations and transitions in between which is the Home View.
5) Finally enjoy your time exploring the wonders of eduKey (search/enrol in courses) quickly access enrolled course through profile view and more!


NOTE: **Please make sure to download all mp4 files & courseLottie to prevent any errors from occurring**
(YOU MAY HAVE TO CREATE A FOLDER FOR EACH INSIDE XCODE)


Overview of eduKey:

This application will allow the user to view numerous courses through a nice intuivie UI design. The user can view additional information about the
course when they click on one of them. This will show further details such as full description of course and video modules related to them.
If the user is interested in that course then they can click the enrol button which will append the course to the users profile for
quick access.

Reasoning behind algorithmic solution:

1) Reduce network calls as it receives data staright from the cache -> data can be loaded quicker & less bandwidth is required
2) Improve application performance -> smoother user experience with reduced loading times due to accessing data from local storage is faster than
   fetching it from a remote server.
3) Reduced server load -> fewer requests are being made to fetch the same data repeatedly and thus scaling the server infrastructure more efficiently.

Additionally, if there were 100s of courses I would go about using lazy stacks & peforming api requests through async/await method to improve users expereince with the UI. This ensures any method performed with async/await is executed in the background thread.
