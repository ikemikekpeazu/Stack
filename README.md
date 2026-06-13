# 📱 Stack
(Soon to be in App Store, currently in App Store Review)
---

Stack is a sleek, minimalist iOS savings tracker designed to help you effortlessly log, categorize, and monitor your financial progress in seconds. Built with a fast, numpad-first interface and powerful filtering, it gives you a clear, at-a-glance view of your growing savings over time.
 <p align="center">
<img width="200" alt="01" src="https://github.com/user-attachments/assets/077bd83c-a77d-4e80-9886-6fdada3d99f9" />
<img width="200" alt="02" src="https://github.com/user-attachments/assets/8acda6a9-f2f2-4a1c-840f-b30ab52e5e77" />
<img width="200" alt="03" src="https://github.com/user-attachments/assets/9abcfb0b-47c6-43f7-b724-e3cc48ba4814" />
<img width="200" alt="04" src="https://github.com/user-attachments/assets/a62fa6fb-fc77-47b2-9073-11576926cf78" />
</p>

## 💻 Technologies/Architecture

- `Swift`
- `SwiftUI`
- `Combine`: Handles all asynchronous data streams and network requests
- `Core Data` : Manages the local persistence of user savings, titles, and categories.
- `MVVM Architecture`: Clean separation of concerns between Data, Logic, and UI.


## 🚀 Features

- **Instant Savings Logging:** Users can quickly record savings amounts using a custom, high-response numerical keypad.
- **Smart Categorization:** Organize financial entries with specific categories such as Food, Transportation, Clothes, Fun, and Subscriptions to see exactly where you save.
- **Dynamic Filtering:**  View savings breakdowns by time range (Today, This Week, This Month, This Year, All Time) or by specific categories.
- **Advanced Savings Management:**
  - Comprehensive History: View a complete list of all saved entries with titles, dates, and category icons.
  - Search & Filter: Effortlessly find specific entries using a search bar or filter the entire list by timeframe (Today, This Week, This Month, This Year, All Time, or custom) and category.
  - Edit & Delete: Maintain accurate records with the ability to modify or remove existing entries through an intuitive swipe or detail menu.
- **Persistent Storage:** Local data management ensures your savings history is saved and accessible every time you open the app.
- **Clean Minimalist Interface:** Beautiful aesthetics for both light mode and dark mode designed for a distraction-free financial overview.
 

## Setup Instructions
The app will be in the app store soon (still in review currently), but here are steps/requirements to run locally.
1. Clone the Repository
2. Open the Project in Xcode
3. Select an iOS Simulator and Run


## Requirements
- Xcode 26+
- iOS 17+
- Swift 6

## 🎥 Live Demo



<br>

## 🛠️ Creation Process

**Background:**

To give a bit of backstory on the creation of this app, this was probably the first app idea that I had in mind to create when I first started learning iOS. I noticed while I was in school that I would make these little purchases – maybe buying a snack here or there, ordering clothes, or taking an Uber instead of the subway. And in the moment, the purchases felt seemingly innocuous, but I would look at my account at the end of the month and see that they could add up to something significant. 

So I realized something. The main reason why saving can be so challenging is that there’s no direct reward after the fact. If I buy a snack or a piece of clothing, or an event ticket, or an uber, I feel the benefit of that purchase pretty much immediately. However, if I forgo that purchase, yes I saved the money, but nothing immediately happens. The reward in that scenario I guess is that I have more money in their bank account, but that’s not something that I would be aware of, unless I checked my bank account after every instance of deciding not to buy something. And also, if the purchase is really small, like a candy bar that sits under the table of the cashier, then it might not make a large enough change that one would notice. And then over a longer period, say a month, there’s no way for someone to remember all the times they’ve forgone a small purchase like that and what amount of savings it would ultimately add up to. So that’s why I created Stack. Because using the app, with each saving, the user can enter it into the app and see their amount saved go up. So it makes it much easier for one to see over time how much their small decisions have saved them, whereas one’s bank account doesn’t necessarily show that.

**Design Process:**

When thinking about how I would design the app, I wanted to design to feel super simple and light – where a user could quickly add their savings and see their savings. I knew that I didn’t want to have too many colors. I decided to use a blue theme throughout, since blue is my favorite color and the color blue also evokes a sense of trust, security, and reliability. So blue was the only color in the app outside of black, white, and system grays. The front screen was really just something that I envisioned in my head for the app.

<img width="200" alt="HomeScreen" src="https://github.com/user-attachments/assets/fd233f1e-8831-4e9a-9a8d-2c84fd47b547" />

So the front screen has the amount saved, allows the user to toggle time frames, and then there’s a button to add savings, and a button to view more details.

For the Add Savings button, I wanted it to pull up a sheet because I thought that would feel the most fluid. For the add saving screen itself, I knew that I wanted it to be something where the user could add a saving in just a couple presses. I’ve always really liked the Cash App design/flow for adding an amount, and how the keypad is just there to immediately begin typing:

<img width="200" alt="CashAppHomeScreen" src="https://github.com/user-attachments/assets/f73150a5-2ffc-46af-b105-8d04f6095804" />

I wanted to implement this into my app as well, but the challenge was that, in my app, the user didn’t just have to enter an amount, they had to enter a title for the saving, category for the saving, and date – so I couldn’t just fit all of that information into the front screen of add savings screen while still having the full key pad. What CashApp does is that after the user enters an amount on that keypad, it pulls up a sheet for the user to add additional info. But my add savings screen was already within a sheet, so adding a sheet on top of a sheet I thought would be a bit heavy and confusing. So what I did was I kept the full key pad for when the user enters the amount, and then when the user hits next, the keypad folds closed and gives space to add additional information along with an add button that appears under it. If the user wants to edit their amount again, they can press the back button and the keypad reappears. 

<img width="200" alt="EnterAmountScreen" src="https://github.com/user-attachments/assets/9dc751e0-a4fc-4762-99dc-589a4163aa43" />
<img width="200" alt="DetailScreen1" src="https://github.com/user-attachments/assets/cec7659e-c62b-416d-8f77-270803fb75ea" />
<img width="200" alt="Add flow" src="https://github.com/user-attachments/assets/b671624f-d330-4250-9e97-2eac2d4da792" />

I also coded this screen in a way that there’s default entries for title, category and date, so maybe if the user is in a pinch somewhere and just wants to add a saving quickly and then edit it later, they can quickly type in the amount, and then hit enter and it gets added to their list:

<img width="200" alt="untitled" src="https://github.com/user-attachments/assets/6a7b281f-54c8-447a-9749-0ff07894e8da" />

For the View Savings screen with the more detailed view of all the savings, I thought a lot about the design of this screen as well. I used Mobbin to look at a bunch of different types of list screens for financial apps and see what resonated with me. I used Figma a bit as well to lay out multiple screens in parallel. I liked the list screen in the Wanderlog app and how it had a total section at the top along with a list section/card at the bottom. I also thought that the design of the list items and the icons was very clean:

<img width="200" alt="Wanderlog" src="https://github.com/user-attachments/assets/dd15d779-f734-4cdc-ac14-bff427eedbff" />


I knew that I wanted a search bar at the top so I also looked into how people implemented that. Here are some key ones that I looked at from different apps:

<img width="200" alt="Ubank" src="https://github.com/user-attachments/assets/41515ac3-b12c-4323-8fe1-56bde436420c" />

<img width="200" alt="1Password" src="https://github.com/user-attachments/assets/20233ac0-3970-412f-8b7f-95ebe581b212" />

<img width="200" alt="TheAthletic" src="https://github.com/user-attachments/assets/bd793717-07b5-45af-8b8e-70624e41b374" />

Taking these designs as inspiration, I then created my own. I knew that I wanted a total number in the top left so that the user could see their totals, along with a toggle for time frames in the top right. And then right under that, I had the black portion with the savings. I rounded the top corners of it to give it more of a card feel sitting on top of the light blue. Then I had Savings as the title in the left along with a category toggle filter in the right. Search bar right under it, and then the list of savings. For the design of an individual list item, I took a lot of inspiration from Wanderlog since I really just liked how that one was laid out. I chose to have the date be a little longer and include the year so that the user could more precisely view savings from different years if they wanted to. From this app screen, I also got inspiration to add a hovering add saving button on the bottom. And all those things combined created a comprehensive screen where the user can complete all actions necessary within the app: they can view their savings totals in detail, they can see all their savings in detail, and they can add savings.

<img width="200" alt="ListScreen" src="https://github.com/user-attachments/assets/483b7927-2d22-4032-9974-f1ee80e4ab91" />

I also had a swipe to edit and delete feature. I initially had edit and delete on opposite sides but I decided to put them both on the same side since I thought that that would make it more efficient for the user since all of the options were in one place and also, it’s already iPhone users natural tendency to swipe left in order to delete something in a list, so I thought putting the edit button there along with it makes sure that it doesn’t get lost in the UI.

When the user presses delete, it deletes the item from the list. When the user presses edit, a sheet pops up. And when it pops up, it pops up with the same UI as the add savings screen, but, it pops up with the keypad folded closed and the additional info visible – and then if the user wants to edit the amount, they can press Edit Amount and open the keypad. So I thought this was cool because if gave like an accordion effect; user wants to add a saving, so they can add the amount then add additional info – user wants to edit a saving, so they can edit the additional info or go back and edit the amount. I think it also breeds familiarity for the user because the add screen and edit screen UI are basically identical, so they can focus less on presentation and more on entering the correct info.

<img width="200" alt="Edit flow" src="https://github.com/user-attachments/assets/da8ab14e-5468-4d39-af23-44e7ae265359" />

I also used Mobbin/Figma a lot for my empty states in the list, just to get a feel for what typical ones look like. My empty states also had to be different depending on whether there were no items in the list at all, if the user selected a filter combination with no savings, or if the user searched for something that brought up no titles:

<img width="200" alt="NoSavings" src="https://github.com/user-attachments/assets/22339544-ed5b-4c5f-afe3-9ee8ef72e093" />
<img width="200" alt="NoFilteredSavings1" src="https://github.com/user-attachments/assets/683bc91f-2d40-4f25-aa1b-c28b4bd6d187" />
<img width="200" alt="NoSearchedSavings" src="https://github.com/user-attachments/assets/646febd5-2b86-41e3-a01b-77062128fae3" />

## ⚙️ Technical Discussion of App

**Architecture:**

In terms of architecture, the app uses standard MVVM. I had a model for the individual savings, a viewModel to manage all the different logic with the savings(creating a list of them, adding up totals, filtering etc.) and then used view files to display the data. In order to have the users savings persist on device between sessions, I used Core Data to create a model of each saving. I had a savingEntity and then made attributes for amount, category, date, id, and title. I created a PersistenceController to house the NSPersistentContainer. I created a singleton of it then accessed it within the viewModel, and then had add, update, delete functions to manipulate the entities.

One issue that I was having in my app came from my initial Core Data setup within my app. So initially, I was using a fetchSavings() function within my viewModel to fetch savings right on the init, and then having an Published var array of savings that then flowed into the view list. But the problem I was having was that the view wasn’t updating/refreshing as quickly as necessary. I was testing the edit functionality, and I would edit an item, then press confirm and the item would still be showing the old info in the UI – and it was only when I would click away to another screen then come back that it would update. So I was troubleshooting this for a while, and the solution I came up with was to use an @FetchRequest directly on the view file. So what this does is that it lets the SwiftUI view subscribe directly to Core Data changes without needing the ViewModel to manually fetch and publish the data. So when objects are added/delete/edited, the fetch reruns automatically and the view refreshes automatically. This ultimately worked. The main tradeoff with it though was that it meant that I had to put more code into the view files, specifically code that was not entirely related to the pure action of just showing data – this was more of a data fetching thing. Here’s the code I put in the views:

<img width="512" height="48" alt="FetchRequest" src="https://github.com/user-attachments/assets/505c286f-0f33-44e9-afed-c5584e73e749" />

What I did though to try to still keep the MVVM and have as light a view file as possible was to still keep the functions/logic for adding, deleting, updating within the ViewModel file. So this gave me the benefits of having the @FetchRequest within the view while still keeping somewhat clean architecture.

So as I mentioned above with the design of the add saving screen, one of the challenges that I had to face was keeping the CashApp-like keypad while still making room for the additional saving information that the user needed to add. So had the keypad “open and close”.

<img width="200" alt="Add flow" src="https://github.com/user-attachments/assets/b671624f-d330-4250-9e97-2eac2d4da792" />

How I designed this in code was I created an amountEntered state variable to monitor whether the user had completed entering an amount, and I had the next button toggle that state variable when it was pressed. And I made the label of the button a ZStack with both the “Next” and “Back” texts on it, and then just flipped the opacities of the two depending on whether the amount was entered or not. So I had the keypad placed inside of an if statement that checked for if an amount was entered, and then put a transition on it. Getting the transition right was probably the hardest part, in terms of just getting everything to function smoothly. I tweaked it a bunch – I decided that what looked best was an asymmetric transition with .move’s from the top edge on both but with slight difference in duration depending on insertion or removal.

<img height="400" alt="NextButtonCode" src="https://github.com/user-attachments/assets/9c9cd170-feb2-4198-859c-e38818776a5e" />
<img width="800" alt="KeypadCode" src="https://github.com/user-attachments/assets/0fa32026-0ba4-4a3f-8479-d5181ad8d807" />

And then under the button, I had a VStack that contained HStacks with the areas to enter additional info. And then on the entire VStack, I had its opacity and offset change based on the amountEntered State variable so that it would appear as though it was coming onto the screen after the user entered an amount.
