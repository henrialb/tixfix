import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: [
      "Football game",
      "Underground rave",
      "Surf competition",
      "Dog breeding ^70 party ",
    ],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
