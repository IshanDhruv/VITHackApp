Introduction

COVID-19 (Coronavirus) has caused a pandemic that has affected thousands of peoples, who are either sick or are being killed due to the spread of this disease. This, being a new viral disease affecting humans for the first time, vaccines are not yet available. Thus, the emphasis is on taking extensive precautions such as extensive hygiene protocol, social distancing, and wearing of masks, and so on. This virus is spreading exponentially region wise. Countries are banning gatherings of people to the spread and break the exponential curve. Many countries are locking their population and enforcing strict quarantine to control the spread of the havoc of this highly communicable disease.
Solution

In this present day scenario, it is of utmost importance that every individual is informed about the most recent updates by the government and the Health advisory information that is released. Awareness and easy access to information is not only a great convenience but also can be life-saving in some cases. Every citizen should also be aware of the real-time situation in and around our localities or hometowns to better manage the coronavirus health crisis. This app provides a comprehensive solution for the same.

The app that we provide will

    Provide Notification & Advisory from the government.
    Contact & Helpline Information for each of the states and union territories of India.
    A Hospital dashboard which will show the number of beds available
    Visualized information regarding the number of cases(deaths), using graphs.

With the help of these features, the user can have all this information at the tip of their fingertips wherever they go.
Future Updates and what we want to build

    Regular notification updates for positive cases and the hospital status (user can select 2 closest/feasible hospitals to get periodic updates)

    Geo-Location features
        Adding markers for Hospitals nearby on the map, displaying the number of beds available and other necessary information. This would allow the user to find the most suitable hospital for their needs.
        Mark hotspots based upon the location.
    Forum: Space where the users get information from COVID experienced patients and learn about certain remedies, to-do’s, solutions, etc.
        Maintain the authenticity of the forum answers and solutions posted on them, we will use Forum Guidelines, and proven techniques such as assigning Admins to certain topics. Admins can be selected using the number of upvotes on a particular solution, and total upvotes to the profile.
        Users will get the option to post their queries regarding the disease, query specific to some topic and get answers from other users/admins.
    We have planned to integrate Artificial Intelligence. So it will be like if you encounter a serious circumstance and needs to be hospitalized immediately than there may be a dilemma that will it be better to go to nearby infirmaries which may or may not be maintained or we should try going some more distance and give preference to safety. So using ML we can predict that the hospital nearby is safe or it will confer the location of the safe place at the most approaching likely distance.

The google drive link under the video link consists of all video presentations and the app APK
API for Graphs data:

https://covid19-vithack.herokuapp.com/posts
UI/UX Prototype:

https://www.figma.com/file/GdkvIA8QHIprLn6oQI1yjU/COVID-19-VIThack?node-id=0%3A1

INSTRUCTIONS


    The main navigation of the app is a bottom navbar.
    The app consists of 4 pages:
        Contact and Helpline information
        Notification and advisory from the government
        Hospital dashboard
        Comparison graph for the number of deceased
    Each page has a scrollable table for the data.
    The hospital dashboard has two options- one for the hospital beds and another for medical college beds. It also has an extra option to view table by a filter on the number of rows visible, in order to load as much information as required.
    Certain pages have tables that are paginated to reduce load time when switching from screen to screen. This process also saves the user’s data as the entire data is not loaded every time
    Everything on the screen is rendered pixel by pixel in the form of widgets. These pixels can then be rendered to bytes which can be stored by converting to a base 64 string. This is the logic used for the conversion of the graph into a png image that the user can then download.
    The app asks for permission to internal storage when the download graph button is clicked for the first time. This storage permission is required to save the image in the gallery.
