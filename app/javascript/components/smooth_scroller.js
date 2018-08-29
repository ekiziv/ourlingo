import SmoothScroll from 'smooth-scroll';

function smoothScrollInit() {
  window.smoothScrollTo = new SmoothScroll().animateScroll;
}

export default smoothScrollInit;

