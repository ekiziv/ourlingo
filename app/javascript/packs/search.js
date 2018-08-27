const search = () => {
  const form = document.getElementById('search_place')
  const input = document.getElementById('input_address')

  input.addEventListener('keydown', event => {
    if (event.keyCode == 13) {
      form.submit();
    }
  });
}

export default search
