const options = {
  weekday: 'long',
  day: 'numeric',
  month: 'long',
  year: 'numeric'
};

let last = document.lastModified;
let date = new Date(last);
let hours = date.getHours();
let minutes = date.getMinutes();
let seconds = date.getSeconds();
let local = date.toLocaleDateString('en-US'. options);
let fullDate = `${local} ${hours}:${minutes}:${seconds}`;

document.getElementById('currentDate').textContent = fullDate;
