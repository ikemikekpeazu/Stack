# 📱 Stack

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
1. Clone the Repository
2. Open the Project in Xcode
3. Select an iOS Simulator and Run
4. For face ID on the simulator, make sure that FaceID is enrolled by going to Features ->FaceID -> Enrolled. To then unlock with FaceID, go to Features -> FaceID -> Matching Face. (To disable FaceID in the app, you can just change the hasAuthenticated @State variable in the HomeView to true.)

## Requirements
- Xcode 26+
- iOS 17+
- Swift 6

## 🎥 Live Demo

https://youtube.com/shorts/jsie1w1w9Jk?feature=share

<br>
