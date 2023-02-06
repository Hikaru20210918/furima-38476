window.addEventListener('load', () => {
  priceInputID = document.getElementById("item-price");
  priceInputID.addEventListener("input", () => {
  inputValue = priceInputID.value;
  const addTaxDomID = document.getElementById("add-tax-price");
 inputTax = inputValue * 0.1
 addTaxDomID.innerHTML = Math.floor(inputTax)
  const profitID = document.getElementById("profit");
  inputProfit= inputValue - inputValue * 0.1
  profitID.innerHTML = Math.floor(inputProfit)
})
})