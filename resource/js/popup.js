const productList = document.getElementById("productList");
let products = [];

// Fetch product list from API
document.getElementById("fetchProducts").addEventListener("click", async () => {
  try {
    const response = await fetch("http://127.0.0.1:8000/api/products"); // Replace with your API endpoint
    const data = await response.json();
    if (!data.success) throw new Error("API returned an error.");


    products = data.data;


    productList.innerHTML = "";

    if (products.length === 0) {

      const emptyMessage = document.createElement("li");
      emptyMessage.style = "text-align: center; color: gray; padding: 10px;";
      emptyMessage.textContent = "Product list is empty.";
      productList.appendChild(emptyMessage);

      // Disable the upload button
      document.getElementById("uploadProduct").disabled = true;
    } else {
      // Enable the upload button
      document.getElementById("uploadProduct").disabled = false;

      products.forEach((product, index) => {
        const listItem = document.createElement("li");
        listItem.style =
            "display: flex; align-items: center; justify-content: space-between; padding: 10px; border-bottom: 1px solid #ddd;";

        listItem.innerHTML = `
          <span style="margin-right: 10px;">${index + 1}.</span>
          <img src="${product.image_url}" alt="${product.name}" style="width: 50px; height: 50px; object-fit: cover; border-radius: 5px; margin-right: 10px;">
          <div>
              <div style="font-weight: bold;">${product.name}</div>
              <div style="font-size: 12px; color: gray;">Stock: ${product.availability}</div>
          </div>
        `;

        productList.appendChild(listItem);
      });
    }

    console.log("Fetched Products:", products);
  } catch (error) {
    console.log("Error:", error.message);
    alert("Error fetching products!");
  }
});

//upload Product here
document.getElementById("uploadProduct").addEventListener("click", async () => {
  if (products.length === 0) {
    alert("No products to upload! Please fetch the product list first.");
    return;
  }

  const productIds = products.map(product => product.id).join(','); // Join the product IDs into a string

  try {
    const response = await fetch("http://127.0.0.1:8000/api/catalog/add-product", {
      method: "POST",
      body: JSON.stringify({
        product_ids: productIds, // Passing product_ids as a string
      }),
      headers: {
        "Content-Type": "application/json",
      }
    });

    const data = await response.json();
    if (!data.success) throw new Error("Failed to upload products");

    console.log("Fetched Products:", data.data);
    alert("Products uploaded successfully!");
  } catch (error) {
    console.log(error);
    alert("Error uploading products!");
  }
});