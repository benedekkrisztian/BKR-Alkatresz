document.addEventListener('DOMContentLoaded', function () {
    const cards = document.querySelectorAll('.anim .card');
    let delay = 0;
  
    cards.forEach(function(card, index) {
      card.style.animationDelay = `${delay}s`;
      delay += 0.2;
    });
  });
  