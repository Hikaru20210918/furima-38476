window.addEventListener('load', () => {
  priceInputID = document.getElementById("item-price");
  priceInputID.addEventListener("input", () => {
  inputValue = priceInputID.value;
  const addTaxDomID = document.getElementById("add-tax-price");
  addTaxDomID.innerHTML = inputValue * 0.1
  const profitID = document.getElementById("profit");
  profitID.innerHTML = inputValue - inputValue * 0.1
})
})