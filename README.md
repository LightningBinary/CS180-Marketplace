# CS180 Marketplace - Online Shopping Application

A client-server marketplace application built for **CS180 (Project 4 & 5)** at Purdue University.  
Sellers can list products and manage stores; customers can browse, search, purchase items, and manage shopping carts.

## Architecture

```
┌──────────────────┐       TCP (port 4242)       ┌──────────────────────┐
│   Marketplace    │ ──── Socket Connection ────▶ │       Server         │
│   (Client)       │ ◀─────────────────────────── │  (Multi-threaded)   │
│                  │                              │                      │
│  ┌────────────┐  │                              │  ┌────────────────┐  │
│  │ Customer   │  │                              │  │   Database     │  │
│  │ Client     │  │                              │  │  (UCanAccess)  │  │
│  └────────────┘  │                              │  └───────┬────────┘  │
│  ┌────────────┐  │                              │          │           │
│  │ Seller     │  │                              │          ▼           │
│  │ Client     │  │                              │  ┌──────────────┐   │
│  └────────────┘  │                              │  │ Database1.   │   │
└──────────────────┘                              │  │ accdb        │   │
                                                   │  │ (MS Access)  │   │
                                                   └──────────────────────┘
```

## Project Structure

```
CS180Project4-main/
├── src/                    # Java source files
│   ├── Server.java         # Multi-threaded TCP server
│   ├── Database.java       # JDBC database access layer
│   ├── Marketplace.java    # Entry point (login/signup)
│   ├── CustomerClient.java # Customer GUI client
│   ├── SellerClient.java   # Seller GUI client
│   └── CustGUI.java        # Alternative Swing GUI (unused)
├── libs/                   # External JAR dependencies
│   ├── ucanaccess-5.0.1.jar
│   ├── jackcess-3.0.1.jar
│   ├── hsqldb-2.5.0.jar
│   ├── commons-lang3-3.8.1.jar
│   └── commons-logging-1.2.jar
├── docs/                   # Documentation and reports
├── Database1.accdb         # Microsoft Access database
├── compile.bat             # Build script
├── run-server.bat          # Start the server
├── run-marketplace.bat     # Start the client
└── .gitignore
```

## Prerequisites

- **Java JDK 8 or later** (Java 11+ recommended)
- The project uses **UCanAccess** to connect to a Microsoft Access database (`.accdb`)

## Quick Start

### 1. Compile

```bash
compile.bat
```

### 2. Start the Server

Open one terminal window:
```bash
run-server.bat
```

The server will auto-detect `Database1.accdb` in the project root.  
If not found, a dialog will prompt you to enter the full path (using `//` separators, e.g., `C://path//to//Database1.accdb`).

### 3. Start the Marketplace Client

Open another terminal window:
```bash
run-marketplace.bat
```

You can now **sign up** or **log in** as a Customer or Seller.

## Features

### Customers
- 🔍 **Search** products by name or description
- 🛒 **View Market** — browse all available products
- 🛍️ **Add to Cart / Buy** — purchase immediately or save for later
- 📦 **View Cart** — review, modify, or check out cart items
- 📊 **Sort Products** — by price or quantity
- 📤 **Export Purchase History** — to CSV file

### Sellers
- 🏪 **View Products** — see products in your stores
- ➕ **Add Products** — list new items with description, price, quantity
- ❌ **Remove Products** — delist items from stores
- 💰 **View Sales** — check revenue and purchase history per store
- 🛒 **View Products in Cart** — see what customers have in carts
- 🏬 **Add Store** — create new stores for your marketplace
- 📥 **Import Products** — bulk import from file

## Database

The application uses **Microsoft Access** via **UCanAccess JDBC driver**.  
The database file `Database1.accdb` includes the following tables:

| Table             | Description                    |
|-------------------|--------------------------------|
| `Buyers`          | Customer account information   |
| `Sellers`         | Seller account information     |
| `Products`        | Product listings               |
| `Markets`         | Store/market information       |
| `Cart`            | Shopping cart items            |
| `PurchaseHistory` | Completed purchase records     |

## Original Team (CS180 Spring 2023)

- Owen Willis
- Jaime Rueda
- Libin Chen
- Thomas Eggers
