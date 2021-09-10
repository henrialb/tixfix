import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#range_start", {
    // options here
    altInput: true,
    enableTime: true,
    plugins: [new rangePlugin({ input: "#range_end" })]
  });

  // flatpickr(".datepicker", {
  //   // options here
  //   altInput: true,
  //   enableTime: true
  // });
}

export { initFlatpickr };
