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

function isInSearchPage() 
{
  return window.location.pathname === "/search"
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
    event.preventDefault();
    dropdownMenu.classList.toggle("hidden");
  });
  window.addEventListener("click", function(event) {
    if (!avatarButton.contains(event.target) && !dropdownMenu.contains(event.target)) {
      dropdownMenu.classList.add("hidden");
    }
  });
}

function searchCommunityRequestWDebounce()
{
  if(!isInSearchPage()) return
  
  const searchField = document.getElementById("search-query");
  const form = document.getElementById("search-form");

  let debounceTimeout;

  searchField.addEventListener("input", () => {
    clearTimeout(debounceTimeout);

    debounceTimeout = setTimeout(() => {
      form.requestSubmit();
    }, 200);
  });
}

function handleSearchMethodSelection() {
  if (!isInSearchPage()) return;

  const communityButton = document.getElementById("show-communities-results");
  const userButton = document.getElementById("show-users-results");

  const communitiesResult = document.getElementById("communities-result");
  const usersResult = document.getElementById("users-result");

  function updateLayout() {
    const isMobile = window.matchMedia("(max-width: 768px)").matches;

    if (isMobile) {
      communitiesResult.classList.add("visible");
      usersResult.classList.remove("visible");
      communityButton.classList.add("selected");
      userButton.classList.remove("selected");

      communityButton.style.display = "inline-block";
      userButton.style.display = "inline-block";

      communityButton.addEventListener("click", () => {
        communitiesResult.classList.add("visible");
        usersResult.classList.remove("visible");
        communityButton.classList.add("selected");
        userButton.classList.remove("selected");
      });

      userButton.addEventListener("click", () => {
        usersResult.classList.add("visible");
        communitiesResult.classList.remove("visible");
        communityButton.classList.remove("selected");
        userButton.classList.add("selected");
      });
    } else {
      communitiesResult.classList.add("visible");
      usersResult.classList.add("visible");

      communityButton.style.display = "none";
      userButton.style.display = "none";

      communityButton.classList.remove("selected");
      userButton.classList.remove("selected");
    }
  }

  window.addEventListener("resize", updateLayout);
  updateLayout();
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
document.addEventListener('turbo:load', searchCommunityRequestWDebounce);
document.addEventListener('turbo:load', handleSearchMethodSelection);