// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function isAuthenticated() 
{
  const path = window.location.pathname;
  return path !== "/usuarios/sign_in" && path !== "/usuarios/sign_up"
}

function isInHome() 
{
  return window.location.pathname === "/"
}

function isInCreationCommunityPostPage()
{
  return window.location.pathname === "/social_community_post/new"
} 

function toggleComment()
{
  if(!isInHome()) return;

  document.querySelectorAll(".comment-button").forEach(function(button) {
      button.addEventListener("click", function() {
        const postId = this.getAttribute("data-post-id");
        const form = document.querySelector(`.comment-form[data-post-id="${postId}"]`);
        if (form) {
          if (form.style.display === "none" || form.style.display === "") form.style.display = "block";
          else form.style.display = "none";
        }
      });
  });
}

function toggleDropdown() 
{
  if(!isAuthenticated()) return;

  const avatarButton = document.getElementById("avatar-button");
  const dropdownMenu = document.getElementById("dropdown-menu");
  avatarButton.addEventListener("click", function(event) {
    event.preventDefault(); // Evita qualquer ação padrão
    dropdownMenu.classList.toggle("hidden"); // Alterna a visibilidade do menu
  });
  window.addEventListener("click", function(event) {
    if (!avatarButton.contains(event.target) && !dropdownMenu.contains(event.target)) {
      dropdownMenu.classList.add("hidden");
    }
  });
}

function searchCommunityRequestWDebounce()
{
  if(!isInHome) return;
  const searchField = document.getElementById("search-query");
  const form = document.getElementById("community-search-form");

  let debounceTimeout;

  searchField.addEventListener("input", () => {
    clearTimeout(debounceTimeout);

    debounceTimeout = setTimeout(() => {
      form.requestSubmit();
    }, 500);
  });
}

function handleCreationMethodSelection()
{
  if(!isInCreationCommunityPostPage()) return

  const communityButton = document.getElementById("show-community-form");
  const postButton = document.getElementById("show-post-form");
  const communityForm = document.getElementById("community-form");
  const postForm = document.getElementById("post-form");

  communityButton.addEventListener("click", () => {
    communityForm.style.display = "block";
    postForm.style.display = "none";
    communityButton.classList.add("selected");
    postButton.classList.remove("selected");
  });

  postButton.addEventListener("click", () => {
    postForm.style.display = "block";
    communityForm.style.display = "none";
    communityButton.classList.remove("selected");
    postButton.classList.add("selected");
  });
}

document.addEventListener('turbo:load', toggleDropdown);
document.addEventListener('turbo:load', toggleComment);
document.addEventListener('turbo:load', handleCreationMethodSelection);