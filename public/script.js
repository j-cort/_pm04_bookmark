function toggleEditForm(editFormId, deactivate = null) {
  const editForm = document.getElementById(`edit-bookmark-${editFormId}`);
  const editButton = document.getElementById(`edit-button-${editFormId}`);
  
  if (deactivate) {
    editForm.style.display = "none";
    editButton.style.color = "inherit";
    return 
  }

  if (editForm.style.display === "none") {
    editForm.style.display = "flex";
    editButton.style.color = "#c72727";
  } else {
    editForm.style.display = "none";
    editButton.style.color = "inherit";
  }
  // close other forms
  toggleComments(editFormId, true)
  toggleTags(editFormId, true)
}

function toggleComments(commentsId, deactivate = null) {
  const comments = document.getElementById(`view-comments-${commentsId}`);
  const commentForm = document.getElementById(`add-comment-${commentsId}`); 
  const commentsButton = document.getElementById(`comments-button-${commentsId}`);

  if (deactivate) {
    comments.style.display = "none";
    commentForm.style.display = "none";
    commentsButton.style.color = "inherit";
    return 
  }

  if (comments.style.display === "none") {
    comments.style.display = "block";
    commentsButton.style.color = "#c72727";
  } else {
    comments.style.display = "none";
    commentsButton.style.color = "inherit";
  }

  if (commentForm.style.display === "none") {
    commentForm.style.display = "flex";
  } else {
    commentForm.style.display = "none";
  }

    // close other forms
    toggleEditForm(commentsId, true)
    toggleTags(commentsId, true)

}

function toggleTags(tagsId, deactivate = null) {
  const tags = document.getElementById(`view-tags-${tagsId}`);
  const tagForm = document.getElementById(`add-tag-${tagsId}`); 
  const tagsButton = document.getElementById(`comments-button-${tagsId}`);

  if (deactivate) {
    tags.style.display = "none";
    tagForm.style.display = "none";
    tagsButton.style.color = "inherit";
    return 
  }

  if (tags.style.display === "none") {
    tags.style.display = "block";
    tagsButton.style.color = "#c72727";
  } else {
    tags.style.display = "none";
    tagsButton.style.color = "inherit";
  }

  if (tagForm.style.display === "none") {
    tagForm.style.display = "flex";
  } else {
    tagForm.style.display = "none";
  }

  // close other forms
  toggleEditForm(tagsId, true)
  toggleComments(tagsId, true)
}

document.getElementById('add-url').onclick = function clearFlashDiv() {
  document.getElementById('add-invalid-url').style.display = "none";
}

document.getElementById('add-title').onclick = function clearFlashDiv() {
  document.getElementById('add-invalid-url').style.display = "none";
}




