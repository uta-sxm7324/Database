function addProduct() {
    const name = document.getElementById("name").value.trim();
    const vendorName = document.getElementById("vendorName").value.trim();
    const address = document.getElementById("address").value.trim();
    const price = document.getElementById("price").value.trim();
    const quantity = document.getElementById("quantity").value.trim();
    

    if (!name || !vendorName || !address || !price || !quantity) {
      alert("Please fill out all fields.");
      return;
    }

    const ul = document.getElementById("productList");
    const li = document.createElement("li");
    li.textContent = `${name} - ${vendorName} - ${address} - $${price} - ${quantity} units `;

    const deleteBtn = document.createElement("button");
    deleteBtn.textContent = "Delete";
    deleteBtn.style.marginLeft = "10px";
    deleteBtn.onclick = () => {
      ul.removeChild(li);
    };

    li.appendChild(deleteBtn);
    ul.appendChild(li);

    // Clear inputs
    document.getElementById("name").value.trim();
    document.getElementById("vendorName").value.trim();
    document.getElementById("address").value.trim();
    document.getElementById("price").value.trim();
    document.getElementById("quantity").value.trim();
  }