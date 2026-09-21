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
