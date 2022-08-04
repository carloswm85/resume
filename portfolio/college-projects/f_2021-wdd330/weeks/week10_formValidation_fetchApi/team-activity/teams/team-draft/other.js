
/**
 * LAST EDIT
 */
const lastEdit = document.querySelector(".last-edit");
const theDate = new Date(document.lastModified).toLocaleDateString();
lastEdit.innerText = theDate;

