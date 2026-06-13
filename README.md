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
