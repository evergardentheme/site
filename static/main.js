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
const calloutelem = document.querySelector("#ports-callout");

function toggle(enable) {
  toggleelem.checked = enable;
  toggleelem.dispatchEvent(new Event("change"));
}

toggleelem.addEventListener("change", (event) => {
  if (!event.currentTarget.checked) return;
  sessionStorage.setItem("ports-opened", 1);
  calloutelem.style.opacity = 0;
})

if (sessionStorage.getItem("ports-opened")) calloutelem.style.opacity = 0;

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
  if (!ticking) {
    setTimeout(() => {
      updateToggle(event.deltaY);
      ticking = false;
    }, 20);

    ticking = true;
  }
})
