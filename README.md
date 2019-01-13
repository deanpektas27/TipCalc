# Pre-work - TipCalc

TipCalc is a tip calculator application for iOS.

Submitted by: Dean Pektas

Time spent: 10 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [x] UI animations
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/SHcZ7pI.gif' title='img' width='200' alt='Video Walkthrough' />
<img src='https://i.imgur.com/mFu8xCB.gif' title='img' width='200' alt='Video Walkthrough' />
GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app:
- Passing userDefault data between pages in the storyboard was a task I wasn't quite comfortable with in the beginning of development and ended up being the longest process I went through.
- Creating animation, such as for the textfield sliding across the screen when it notices text (or lack thereof) was interesting because of how its coordinate system works. Telling it to go 100 pixels to the left when numbers are entered and 100 pixels back when its removed did not give my desired result. Reversing the order to its original position meant giving the translationX parameter a value of 0.
## License

Copyright 2019 Dean Pektas

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
