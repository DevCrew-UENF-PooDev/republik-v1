// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function isAuthenticated() 
{
    const path = window.location.pathname;
    return path !== "/usuarios/sign_in" && path !== "/usuarios/sign_up"
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

document.addEventListener('turbo:load', toggleDropdown);