# Aggies Connect

## Inspiration
  No matter what college a student attends, finding the people you connect with can sometimes take a while. Traditionally, students meet others in classes or the few clubs they join throughout their college career. While this is good, there are many others smaller groups around campus that could be something much more to the students, yet there is no way for an individual to advertise their group meeting. A lot of times its the small sporatic decisions that lead to meeting the most interesting people in your life.
  
  In addition, Texas A&M has a great program involving the Corps of Cadets where a student can request a cadet on duty to help them walk home if they do not feel comfortable doing so themselves. This process can be cumbersome and many times inefficient in certain situations when there is the technology available to solve it.
  
  ## Goals
  These two ideas are exactly what inspired Aggies Connect and the issues it solves:
  - Meeting individuals and groups of students bound by common interests
  - Find out about awesome events going on around campus
  - Helping students get home safely by giving the buddy system a technological overhaul
  - Forming study groups to earn better grades
  
  
  ## How it Works
  Aggie Connect (AC) is a cross-platform mobile application, successfully running on all IOS and Android devices, built on top of Google's reactive UI toolkit, flutter. Aggies Connect is a great way for any student, whether it's their first day on campus or even those looking for an addition to their sports team to find new members, but most importantly giving them an extra layer of safety. 

  Flutter was a perfect tool for this hackathon as it allowed for seamless intergration between the frontend and backend all while allowing for quick UI/UX development. The main interface of the application is a Google Maps view utilizing 4 total Google Cloud Platform APIs (listed below). The app opens up to an interactive map showing serveral points of interest where there are either students planning to meet or requesting someone to walk with. 
  
  All of the calls are made directly to Google's Firestore database to allow for quick updates. In addition, users have the option to submit a simple form for either requesting a walk or sending out a meeting time/event. The form takes in several credentials and displays them on the map when the user clicks on one of the markers. From there, the person who posted the event can be contacted for further information and details.
  
  ## Challenges
  Overall, the most tediuos part was setting up firestore to work on both Android and IOS, and after that creating the form for the events was a challenge. This was complex as the information had to be taken directly out of the text fields and converted into a Map that Firestore would accept.
  
  ## Accomplishments
  We set manageable goals at the beginning of the hackathon that we reached. The app work as intended and has a nice aesthetic to it. 
  
  ## What Next?
  We want to add a function that automatically deletes an event after a few hours which should not be too complicated. In addition, user authentication and messaging are the main aspects we want to add in the future in order to insure better security and transparency for the students' safety.
  
  ## Major Dependencies
  - Maps SDK for IOS
  - Maps SDK for Android
  - Geolocation API
  - Cloud Firestore
  - Flutter 
  - Location
  
 Full video demo: https://www.dropbox.com/s/r0ju6h80g79omem/ScreenRecording_01-27-2019%2010-26-01.MP4?dl=0

<a href="https://imgflip.com/gif/2s5uaw"><img src="https://i.imgflip.com/2s5uaw.gif" title="made at imgflip.com"/></a>

<a href="https://imgflip.com/gif/2s5udy"><img src="https://i.imgflip.com/2s5udy.gif" title="made at imgflip.com"/></a>

<a href="https://imgflip.com/gif/2s5uh8"><img src="https://i.imgflip.com/2s5uh8.gif" title="made at imgflip.com"/></a>

<a href="https://imgflip.com/gif/2s5uj6"><img src="https://i.imgflip.com/2s5uj6.gif" title="made at imgflip.com"/></a>


