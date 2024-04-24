window.addEventListener('turbo:load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const fee = Math.floor(inputValue * 0.1);
    const profit = Math.floor(inputValue - fee); // ここを修正しました

    console.log(`手数料: ${fee}, 利益: ${profit}`);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = fee;

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = profit;

  });
});