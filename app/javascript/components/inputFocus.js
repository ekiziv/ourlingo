const start_btn = document.getElementById('bottom');
const search_box = document.getElementById('input_address');
if (start_btn != null && search_box != null) {
  start_btn.addEventListener('click', (event)=> {
    search_box.focus();
  });
}
