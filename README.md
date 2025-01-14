# Product Uploader Chrome Extension

## Introduction

The Product Uploader Chrome extension allows users to efficiently fetch product lists from APIs and upload those products. This tool streamlines product management with a user-friendly interface and automated data handling.

### Key Features:

- **Fetch Product List**: Dynamically retrieve product data from an API and display it in the extension popup.
- **Upload Product IDs**: Send selected product IDs to the server for processing with a single click.
- **Dynamic UI Update**: View product details, including ID and name, within the popup interface.
- **Error Handling**: Receive success or error messages based on upload operations.
- **Easy Integration**: Works seamlessly with API endpoints for fetching and uploading product data.

---

## Features

- **Retrieve Products**: Import product details from an API with minimal effort.
- **Interactive UI**: View and select products dynamically within the extension.
- **API Communication**: Easily interact with backend APIs for product data handling.
- **Batch Processing**: Upload multiple product IDs in one go.
- **Developer Mode Compatibility**: Designed for easy installation and testing via Chrome's developer mode.
---

## Requirements

Before using the Product Uploader Chrome Extension, you need to set up a Facebook Developer account and obtain the necessary credentials.

### 1. **Create a Facebook Developer Account**
- Visit the [Facebook Developer Portal](https://developers.facebook.com/).
- Sign in with your Facebook account and create a new developer account if you don’t have one already.

### 2. **Set Up Commerce Manager**
- Go to the [Commerce Manager](https://www.facebook.com/commerce_manager).
- Create a new catalog if you don’t have one.
- You’ll need to have access to this catalog in order to interact with Facebook’s product data.

### 3. **Obtain Credentials**
- **App ID**: Create an app under your Facebook Developer account. You can find the App ID in your Facebook App's settings.
- **Catalog ID**: After creating your catalog, you’ll find the Catalog ID in the Commerce Manager.
- **Access Token**: Go to the Access Token Tool in the Facebook Developer portal and generate an access token for your app.

### 4. **Set Up Environment Variables**
Once you have your **App ID**, **Catalog ID**, and **Access Token**, you need to add them to your `.env` file:

    ```env
    FACEBOOK_APP_ID=your_facebook_app_id
    FACEBOOK_CATALOG_ID=your_facebook_catalog_id
    FACEBOOK_ACCESS_TOKEN=your_facebook_access_token
---
## Project Structure

    ```plaintext
    project-directory/
    ├── manifest.json
    ├── popup.html
    ├── resource/js/popup.js
    ├── resource/js/background.js
    ├── resource/images/icon.png
    ├── resource/css/style.css
    ├── backend
    
### 3. **For backend Setup**


To set up the backend for the Product Uploader, follow these steps:

1. **Go to the Backend Directory**
  Navigate to the backend directory of your project:
      ```bash
      cd backend
      Update Composer Run the following command to update the dependencies using Composer:
      ```bash
      composer update / composer install
      Generate the .env File If the .env file does not exist, generate it by copying the example file:
      ```bash
      cp .env.example .env
      Start the Server Run the following command to start the backend server:
      ```bash
      php artisan serve
### 1. **Get Product List**

#### URL
    GET api/products
#### Response
    ```json
    {
        "success": true,
        "message": "Products retrieved successfully",
        "data": [
            {
                "id": 3,
                "name": "Office Chair",
                "description": "Ergonomic office chair with lumbar support.",
                "price": "129.99",
                "availability": "in stock",
                "image_url": "http://127.0.0.1:8000/uploads/image_3.png",
                "created_at": "2025-01-14 14:50:01",
                "updated_at": "2025-01-14 08:50:08"
            },
            {
                "id": 1,
                "name": "Modern Sofa",
                "description": "A stylish modern sofa for your living room.",
                "price": "499.99",
                "availability": "in stock",
                "image_url": "http://127.0.0.1:8000/uploads/image_1.png",
                "created_at": "2025-01-14 14:50:01",
                "updated_at": "2025-01-14 08:50:08"
            }
        ]
    }

### 3. Installation:

- Unzip the respective extension zip.
- Open "Extentions" menu under "Tools" from Chrome browser menu bar.
- Enable "Developer Mode" option from right top corner.
- Click on "Load Unpacked" button and upload unzipped folder.

> That's it, now you can see a name of you extension list is "Product Import & Upload on Facebook" .
