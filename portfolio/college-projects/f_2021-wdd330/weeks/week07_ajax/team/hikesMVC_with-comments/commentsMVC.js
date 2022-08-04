// I've left the model view and controller code together in the one file for simplicity

// MVC

// Comments Model ----------------------------------------------------------
// Used in: hikesController
class CommentModel {
	
	// type = 'hikes'
	constructor(type) {
		this.type = type;
		// get the initial list of comments out of local storage if it exists
		this.comments = readFromLS(this.type) || [];
	}
	
	// I decided I could combine my getAllComments, and filterCommentsByName methods into one by passing in an optional query argument
	getComments(q = null) {
		console.log('getComments, q: ' + q);
		if (q === null) {
			// no query, get all comments of the type
			console.log('getComments, this.comments: ' + this.comments);
			return this.comments;
		} else {
			// comments for a specific post...filter by name
			return this.comments.filter(el => el.name === q);
		}
	}

	addComment(postName, comment) {
		let postDate = new Date();
		
		console.log('addComment, postName: ' + postName);
		console.log('addComment, comment: ' + comment);
		console.log('addComment, postDate: ' + postDate);
		
		const newComment = {
			name: postName,
			comment: comment,
			date: postDate
		};
		
		
		this.comments.push(newComment); // this is an array
		console.log('addComment, this.type: ' + this.type);
		console.log('addComment, typeof(this.comments): ' + typeof(this.comments));
		console.log('addComment, Array.isArray(this.comments): ' + Array.isArray(this.comments));
		console.log('addComment, this.comments: ' + this.comments);
		writeToLS(this.type, this.comments);
	}
}

// To local storage
function writeToLS(key, data) {
	// we can use JSON.stringify to convert our object to a string that can be stored in localStorage.
	console.log('writeToLS, key: ' + key);
	console.log('writeToLS, data: ' + data);
	window.localStorage.setItem(key, JSON.stringify(data));
}

// From local storage
function readFromLS(key) {
	// the string we retrieve from localStorage needs to be converted back to an object with JSON.parse
	console.log('readFromLS, key: ' + key);
	
	let storedItem = JSON.parse(window.localStorage.getItem(key));
	console.log('readFromLS, storedItem: ' + storedItem);
	return storedItem;
}

// Comments View ----------------------------------------------------------
const commentUI =
`<div class="addComment">
	<h2>Add a comment</h2>
	<input type="text" id="commentEntry" />
	<button id="commentSubmit">Comment</button>
</div>
<h2>Comments</h2>
<ul class="comments"></ul>`;

// I only had one function for the view...so I chose not to use an object or class.
function renderCommentList(element, comments) {
	console.log('renderCommentList, element: ' + element);
	console.log('renderCommentList, comments: ' + comments);	

	// clear out any comments that might be listed
	element.innerHTML = '';
	// add the new list of comments
	comments.forEach(el => {
		let item = document.createElement('li');
		item.innerHTML = `
            ${el.name}: ${el.comment}
      `;

		element.appendChild(item);
	});
}

// Comments Controller ---------------------------------------------------
class CommentsController {

	// type = 'hikes', commentElementId = 'comments'
	constructor(type, commentElementId) {
		this.type = type;
		this.commentElementId = commentElementId;
		this.model = new CommentModel(this.type);
	}

	addSubmitListener(postName) {
		// use element.ontouchend to avoid more than one listener getting attached at a time to the button.
		console.log(postName);
		document.getElementById('commentSubmit').onclick = () => {
			// debugger;
			this.model.addComment(
				postName,
				document.getElementById('commentEntry').value
			);
			document.getElementById('commentEntry').value = '';
			this.showCommentList(postName);
		};
	}

	showCommentList(q = null) {
		console.log('showCommentList(), q: ' + q);
		
		try {
			// commentElementId = 'comments'
			const parent = document.getElementById(this.commentElementId);
			console.log('showCommentList(), parent: ' + parent);			

			if (!parent) throw new Error('comment parent not found');

			// check to see if the commentUI code has been added yet
			if (parent.innerHTML === '') {
				parent.innerHTML = commentUI;
			}

			// NOT NULL
			if (q !== null) {
				// looking at one post, show comments and new comment button
				document.querySelector('.addComment').style.display = 'block';
				this.addSubmitListener(q);
			} else {
				// no post name provided, hide comment entry
				document.querySelector('.addComment').style.display = 'none';
			}

			// NULL
			// get the comments from the model
			let comments = this.model.getComments(q);
			if (comments === null) {
				// avoid an error if there are no comments yet.
				comments = [];
			}

			renderCommentList(parent.lastChild, comments);
		} catch (error) {
			console.log(error);
		}
		
	}
}

export default CommentsController;