// The controller needs access to both the model and the view...so let's import them
import HikeModel from './hikeModel.js';
import HikesView from './hikesView.js';

//  we also need the new comments class to add that functionality
import CommentsController from './commentsMVC.js';

export default class HikesController {
	
	// a class needs a constructor
	// parentId is 'hikes', a <ul> element
	constructor(parentId) {
		this.parentElement = document.getElementById(parentId);
		
		this.hikeModel = new HikeModel();
		this.hikesView = new HikesView(parentId);
		
		//add an instance of our comments class to the controller
		this.commentsController = new CommentsController('hikes', 'comments');
	}
		
	// this method builds the entire main page content
	// hikeListElement === <ul>, hikeList === dictionary
	showHikeList() {
		const hikeListElement = this.parentElement;
		
		// the list of hikes will come from the hike model now...
		const hikeList = this.hikeModel.getAllHikes();
		
		// send the list of hikes and the element we would like those placed into to the view.
		// it receives: an <ul> and a dicitionary
		this.hikesView.renderHikeList(hikeListElement, hikeList);

		// after the hikes have been rendered...add our listener
		this.addHikeListener();
		
		// show comments, at the bottom of the page
		this.commentsController.showCommentList();
	}
	
	// This method is attached to the addHikeListener()
	// it uses the custom data-name attribute from the <li>
	showOneHike(hikeName) {
		const hike = this.hikeModel.getHikeByName(hikeName);
		
		console.log('showOneHike(), this.parentElement: ' + this.parentElement);
		console.log('showOneHike(), hike: ' + hike);
		
		// hike is 
		this.hikesView.renderOneHikeFull(
			this.parentElement,
			hike
		).onclick = () => {
			// addEventListener() to the button is done here.
			this.showHikeList();
			};
		
		// show the comments for just this hike
		this.commentsController.showCommentList(hikeName);
	}
	
	// in order to show the details of a hike ontouchend we will need to attach a listener AFTER the list of hikes has been built. The function below does that.
	addHikeListener() {
		// We need to loop through the children of our list and attach a listener to each, remember though that children is a nodeList...not an array. So in order to use something like a forEach we need to convert it to an array.
		const childrenArray = Array.from(this.parentElement.children);
		console.log('addHikeListener(), childrenArray: ' + childrenArray);		

		childrenArray.forEach(child => {
			child.addEventListener('click', e => {

				// MEANING: call current class method, passes string dataset name variable.
				let evento = e.currentTarget.dataset.name;
				this.showOneHike(evento);

				console.log('addHikeListener(), evento: ' + evento);
				console.log('addHikeListener(), typeof(evento): ' + typeof(evento));
			});
		});
	}
}

