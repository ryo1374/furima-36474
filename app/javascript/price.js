window.addEventListener('load', function(){
// 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
  

  const profitAmount = document.getElementById("profit");
  const tax = inputValue * 0.1
  profitAmount.innerHTML = (Math.floor(inputValue - tax));
 
  });
});