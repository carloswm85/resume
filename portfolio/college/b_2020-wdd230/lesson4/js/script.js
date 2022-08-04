// LAST UPDATE

const options = {
  weekday: 'long',
  day: 'numeric',
  month: 'long',
  year: 'numeric'
};

let date = new Date();
let local = date.toLocaleDateString('en-US', options);
/* EXAMPLE: Wednesday, 24 July 2020 */
document.getElementById('currentDate').textContent = local;


// HAMBURGER MENU

const hambutton = document.querySelector('.ham');
const mainnav = document.querySelector('.navigation');

hambutton.addEventListener('click', () => {mainnav.classList.toggle('responsive')}, false);