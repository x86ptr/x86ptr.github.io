// activate navbar's links
addEventListener("load", (event) => {
    document.querySelectorAll('nav a').forEach(function(link) {
        if (link.href === window.location.href) {
            link.classList.add('active');
        }
    });
});

// scroll to the top of the screen
if (window.location.href.match(/\/blog\/(.+)/)) {
    var scrollToTopBtn = document.getElementById("scroll-to-top");
    
    if (window.pageYOffset > 100) {
        scrollToTopBtn.style.display = "block";
    } else {
        scrollToTopBtn.style.display = "none";
    }

    window.addEventListener("scroll", function () {
        if (window.pageYOffset > 100) {
            scrollToTopBtn.style.display = "block";
        } else {
            scrollToTopBtn.style.display = "none";
        }
    });
    
    scrollToTopBtn.addEventListener('click', function () {
        $('html, body').animate({ scrollTop: 0 }, '300');
    });
}

// highlight js
hljs.highlightAll();