import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: [
      "Football game",
      "Underground rave",
      "Dog breeding ^70 party ;)",
      "Surf competition",
      "Ninja Warriors brawl",
    ],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
