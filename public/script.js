function toggleEditForm(editFormId) {
  const editForm = document.getElementById(`edit-bookmark-${editFormId}`);
  if (editForm.style.display === "none") {
    editForm.style.display = "block";
  } else {
    editForm.style.display = "none";
  }
}

document.getElementById('add-url').onclick = function clearFlashDiv() {
  document.getElementById('add-invalid-url').style.display = "none";
}

document.getElementById('add-title').onclick = function clearFlashDiv() {
  document.getElementById('add-invalid-url').style.display = "none";
}




