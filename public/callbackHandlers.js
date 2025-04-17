function addProduct() {
    const id = document.getElementById("id").value.trim();
    const name = document.getElementById("name").value.trim();
    const vendorId = document.getElementById("vendorId").value.trim();
    const price = document.getElementById("price").value.trim();
    const quantity = document.getElementById("quantity").value.trim();
    const category = document.getElementById("category").value.trim();
    

    if (!id || !name || !vendorId || !price || !quantity || !category) {
      alert("Please fill out all fields.");
      return;
    }

    const ul = document.getElementById("productList");
    const li = document.createElement("li");
    li.textContent = `${name} - ${vendorId} - $${price} - ${quantity} units `;

    const deleteBtn = document.createElement("button");
    deleteBtn.textContent = "Delete";
    deleteBtn.style.marginLeft = "10px";
    deleteBtn.onclick = () => {
      ul.removeChild(li);
    };

    li.appendChild(deleteBtn);
    ul.appendChild(li);

    //Send new item to db
    sendNewItem({
        id: id,
        name: name,
        vendor: vendorId,
        price: price,
        quantity: quantity,
        category: category
    });

    // Clear inputs
    document.getElementById("name").value.trim();
    document.getElementById("vendorId").value.trim();
    document.getElementById("price").value.trim();
    document.getElementById("quantity").value.trim();
  }

  function addVendor() {
    const vendorId = document.getElementById("vendor-id").value.trim();
    const vendorName = document.getElementById("vendor-name").value.trim();
    const vendorStreet = document.getElementById("vendor-street").value.trim();
    const vendorCity = document.getElementById("vendor-city").value.trim();
    const vendorState = document.getElementById("vendor-state").value.trim();
    const vendorZip = document.getElementById("vendor-zip").value.trim();

    if (!vendorId || !vendorName || !vendorStreet || !vendorCity || !vendorState || !vendorZip) {
        alert("Please fill out all vendor fields.");
        return;
    }

    sendNewVendor({
        vendorId: vendorId,
        vendorName: vendorName,
        vendorStreet: vendorStreet,
        vendorCity: vendorCity,
        vendorState: vendorState,
        vendorZip: vendorZip
    });
}