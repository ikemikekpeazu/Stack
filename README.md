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
- `Core Data` : Manages the persistence of user-specific portfolio data
- `FileManager`: Used for efficient local caching of coin images
- `Swift Concurrency` for pull to refresh feature
- `Swift Charts` for dynamic price chart
- `URLSession`: Utilized for high-performance networking with JSON decoding.
- `Multi-threading`: Heavy tasks are offloaded to background threads to ensure app efficiency and smooth UI.
- `MVVM Architecture`: Clean separation of concerns between Data, Logic, and UI.
- `LocalAuthentication` for FaceID to access portfolio holdings

## 🚀 Features

- **Live Market Data:** Fetches real-time cryptocurrency prices, market cap, and volume using the CoinGecko API.
- **Global Market Stats:** A top-level dashboard displaying global market data such as Total Market Cap, 24h Volume, and BTC Dominance.
- **Portfolio Management:** Users can track their own holdings by adding coin amounts; the app automatically calculates total portfolio value and profit/loss margins.
- **Persistent Storage:** Utilizes Core Data to save user portfolio data locally, ensuring information is retained even after the app is closed.
- **CoinDetailView:** Users can tap on a coin in order to gain more info regarding that coin
  - Interactive price chart that allows users to see price data on a given coin over 1D, 1W, 1M, 3M, 6M, YTD, 1Y, 2Y, 5Y, and 10Y time frames
  - scrubbing feature that allows users to drag their finger acoss the chart to get more accurate date/price info
  - Overview section which contains a paragraph description of the coin along with some market statistics
  - Additional Details section which has other price info, such as 24h High's and Lows, along with links to the coins website and reddit page
- **Image Caching:** Implements a custom FileManager-based caching system to download and store coin logos locally, reducing API calls and improving performance.
- **Advanced Search & Filtering:**
  - Search coins by name or symbol
  - Sort coin data by price, rank, or holdings
  - Pull to refresh feature to allow users to update coin market data in real-time
- **FaceID**: Implements LocalAuthentication framework to offer users FaceID to secure their portfolio holdings

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
