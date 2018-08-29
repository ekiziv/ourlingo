const search = () => {
  const form = document.getElementById('search_place');
  const input = document.getElementById('input_address');

  const form_navbar = document.getElementById('search_navbar');
  const input_navbar = document.getElementById('input_addr');


  if (input != null) {
    input.addEventListener('keydown', event => {
      if (event.keyCode == 13) {
        form.submit();
      }
    });
  }

  input_navbar.addEventListener('keydown', event => {
    if (event.keyCode == 13) {
      form_navbar.submit();
    }
  });
}

export default search
