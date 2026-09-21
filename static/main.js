console.log('[main] init');

// clipboard =============================================================================

async function writeClipboardText(text) {
  try {
    await navigator.clipboard.writeText(text);
  } catch (error) {
    console.error(error.message);
  }
}

function copyhex(event) {
  event.preventDefault();

  const label = event.currentTarget.querySelector('label');
  const hex = label.innerText;
  writeClipboardText(hex);
  label.innerText = "copied!";
  setTimeout(() => {
    label.innerText = hex;
  }, 1000);
}

document.querySelectorAll(".copy").forEach(elem => {
  elem.addEventListener('click', copyhex)
})

// scroll ================================================================================

const toggleelem = document.querySelector("#ports-toggle");
const toggle = (enable) => toggleelem.checked = enable != null ? enable : !toggleelem.checked;

const drawer = document.querySelector("#ports-drawer");

const updateToggle = (delta) => {
  if (toggleelem.checked) {
    if (delta < 0 && drawer.scrollTop == 0) toggle(false);
  } else {
    if (delta > 0 && document.body.scrollTop == document.body.scrollTopMax) toggle(true);
  }
};

let ticking = false;

document.addEventListener("wheel", (event) => {
  console.log('meow');

  if (!ticking) {
    setTimeout(() => {
      updateToggle(event.deltaY);
      ticking = false;
    }, 20);

    ticking = true;
  }
})
