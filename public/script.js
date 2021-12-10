function toggleEditForm(editFormId) {
  const editForm = document.getElementById(`edit-bookmark-${editFormId}`);
  if (editForm.style.display === "none") {
    editForm.style.display = "block";
  } else {
    editForm.style.display = "none";
  }
}