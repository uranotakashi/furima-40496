const cal = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const fee = Math.floor(inputValue * 0.1);
    const profit = Math.floor(inputValue - fee); 

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = fee;

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = profit;
});
}

window.addEventListener("turbo:load", cal);
window.addEventListener("turbo:render", cal);