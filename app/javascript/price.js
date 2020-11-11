function price () {
  const priceYen = document.getElementById("item-price")
  
  priceYen.addEventListener("keyup", () => {
    const priceVal = priceYen.value;
    const priceTax = Math.floor(priceVal / 10)
    const priceAddTax = document.getElementById("add-tax-price");
    const priceProfit = document.getElementById("profit");
    priceAddTax.innerHTML = `${priceTax}`;
    priceProfit.innerHTML = `${priceVal - priceTax}`
  });
}

window.addEventListener('load', price)