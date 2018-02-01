const forms = document.querySelectorAll('.edit_order_product')

forms.forEach((form) => {
  const submitButton = form.querySelector('input[type="submit"]')

  form.addEventListener('change', () => submitButton.click())
})
