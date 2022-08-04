// Getting all images
const imagesToLoad = document.querySelectorAll('img[data-src]');

const loadImages = (image) => {
	image.setAttribute('src', image.getAttribute('data-src'));
	image.onload = () => {
		image.removeAttribute('data-src');
	};
};
 
// Optional parameters being set for the IntersectionalObserver
const imgOptions = {
	root: document.querySelector('#scrollArea'),
	rootMargin: '0px',
	threshold: 0.5
};

// First check to see if Intersection Observer is supported
if ('IntersectionObserver' in window) {

	const imgObserver = new IntersectionObserver((items, observer) => {
		items.forEach((item) => {
			if (item.isIntersecting) {
				loadImages(item.target);
				imgObserver.unobserve(item.target);
			}
		});
	}, imgOptions);

	// Loop through each img on check status and load if necessary
	imagesToLoad.forEach((img) => {
		imgObserver.observe(img);
	});
}
else { // Just load ALL images if not supported
	imagesToLoad.forEach((img) => {
		loadImages(img);
	});
}