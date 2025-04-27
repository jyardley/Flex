# Flex
Code for the take-home project for Flex

##Screenshots:
![image](https://github.com/user-attachments/assets/ad5b2db6-2f0b-4ca0-b745-df4148566ee9)
![image](https://github.com/user-attachments/assets/45ac37b9-9a57-4b91-aa1f-214ee9b9c0b2)




### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

The main areas that I focused on were the main core functionality and the error checking/handling, so that this app could, as long as the JSON data remained the same format/dictionary, could be used and handle any error. I focused mainly on core functionality for time reasons, though. 


### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

I spent about 3 to 3 1/2 days on this altogether due to the amount of research I had to do and debuging the app.


### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

In the beginning, I attempted to do an MVVM architecture using some code I had lying around, but that did not work for this particular application. I felt that maybe I'm missing something simple, so I actually tore down the code and looked around for other code online that might help.  I researched and found some code online that suited my purposes, and understand what I needed to do, but had to do major refactoring.     


### Weakest Part of the Project: What do you think is the weakest part of your project?

Presentation.  I went for simply going for the "meat and potatoes" of the app functionality and tried to make it look decent.  I would have liked to somehow grab the text from the source_URL automatically and display *that* instead of using a WKWebView with a rather clunky website.  Same with the YouTube Video, i.e., show only the video and not the whole site at that YouTube address via a WKWebView. 

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

I found that the specific format of the JSON threw me for a loop due to it being a *dictionary* and not simply an array of recipe entries. It actually produced some more complexity when checking for errors, as there would be a JSON comming back that seemed like everything was ok until you looked at the JSON itself and there *was* a dictionary there(a valid JSON), but the array value part of the dictionary was empty.  Also had to use Coding Keys to make sure things were being counted properly in the List AND to check if any fields comming back were empty or not. So that added more complexity to the project.

I feel that maybe this could have been MVVM architecture but I did the simplest thing for the task. Simplest is usually best.  I would have liked to try and put a ProgressView on the parts that were loading to give the user feedback on the Views being loaded, but according to my reasearch it seemed too complicated to do.  That would be a good major improvement.

Also, testing:  I only did UI testing to test static text due to the fact that all the other text on the app(the data that came back) were the only other things that were displayed and if that data ever changed, it would fail the tests.


To the Flex Team:

I very much hope I am hired for the Apprenticeship role and I feel I can add value to your team and company! Thank you immensly for this chance to become a part of it! 
