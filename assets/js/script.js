// responsive navbar
function myFunction() {
	var x = document.getElementById("myTopnav");
	if (x.className === "topnav") {
		x.className += " responsive";
	} else {
		x.className = "topnav";
	}
}

// highlight js
hljs.highlightAll();

// simple jekyll search library
var sjs = SimpleJekyllSearch({
	searchInput: document.getElementById('search-input'),
	resultsContainer: document.getElementById('results-container'),
	noResultsText: '<span id="notFound" style="color: #f44336;">No results found!</span>',
	json: '/search.json'
})

// customize modal dialog box
var openModalButton = document.getElementById('open-modal');
var modal = document.getElementById('myModal');

var closeButton = document.querySelector('.modal-content .close');
openModalButton.addEventListener('click', function () {
	modal.style.display = 'block';
});

closeButton.addEventListener('click', function () {
	modal.style.display = 'none';
});

// move to top button
var btn = $('#scroll-to-top');

$(window).scroll(function () {
	if ($(window).scrollTop() > 300) {
		btn.addClass('show');
	} else {
		btn.removeClass('show');
	}
});

btn.on('click', function (e) {
	e.preventDefault();
	$('html, body').animate({ scrollTop: 0 }, '300');
});

// share buttons
const shareButtons = document.querySelectorAll('.share-button');

shareButtons.forEach(button => {
	button.addEventListener('click', () => {
		var url = encodeURIComponent(window.location.href);
		var platform = button.classList[1];
		var title = document.title.replace(/\+/g, ' ');
		var shareUrl;

		switch (platform) {
			case 'facebook':
				shareUrl = 'http://www.facebook.com/sharer.php?u=' + url + '&p[title]=' + title;
				break;
			case 'twitter':
				shareUrl = 'https://twitter.com/share?text=' + title + '&url' + url;
				break;
			case 'linkedin':
				shareUrl = 'https://www.linkedin.com/shareArticle?mini=true&url=' + url + '&title=' + title;
				break;
			case 'reddit':
				shareUrl = 'https://reddit.com/submit?url=' + url;
				break;
			case 'telegram':
				shareUrl = 'https://telegram.me/share/url?url=' + url;
				break;
		}

		window.open(shareUrl, '_blank');
	});
});

