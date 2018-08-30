function showMore(event) {
    let x = document.getElementById("myDIV");
    if (x.classList.contains("shown")) {
      x.classList.remove("shown");
      event.currentTarget.innerText = 'Show More';
    } else {
        x.classList.add("shown");
        event.currentTarget.innerText = "Show Less";
    }
}

const buttons = document.querySelectorAll("#show-more");
buttons.forEach(button => {
  button.addEventListener('click', (event) => {
    showMore(event);
  });
})

