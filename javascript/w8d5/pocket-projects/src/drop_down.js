const dogs = {
  Corgi: "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  Affenpinscher: "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier":
    "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  Tosa: "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/"
};

function dogLinkCreator() {
  const dogLinks = [];

  Object.keys(dogs).forEach((dog, ind) => {
    const atag = document.createElement("a");
    atag.innerHTML = dog;
    atag.href = Object.values(dogs)[ind];
    let li = document.createElement("li");
    li.classList = "dog-link";
    li.appendChild(atag);
    dogLinks.push(li);
  });
  return dogLinks;
}
// Now write a second function called attachDogLinks.In this function invoke the dogLinkCreator and assign the result to a variable named dogLinks.Now that you have your dogLinks array iterate through it and attach each li to the ul element with the class of .drop - down - dog - list.Then call your function at the bottom of your file and you will see your dogs appear!

// Nice

function attachDogLinks() {
  const dogLinks = dogLinkCreator();
  let ul = document.querySelector(".drop-down-dog-list");
  console.log(ul);
  dogLinks.forEach(link => {
    ul.append(link);
  });
  // handleLeave();
  handleEnter();
}

attachDogLinks();

// Here is where the dog - link class you added to all your li links will come in handy.By default use css to hide all of your lis when the page is loaded.Then write two functions handleEnter and handleLeave to make your dogs links appear and disappear.Remember you can add and remove css classes using javascript!

// Next you'll add your two new eventHandlers to an element on the page so that on mouseenter the dog's links will appear and on mouseleave the links will disappear.Think carefully on where you want to attach your two event listeners.Keep in mind event delegation - you want to be able to hover on and click the dogs links without the dropdown disappearing.

function handleEnter() {
  let ul = document.querySelector(".drop-down-dog-list");
  const mouseTarget = document.querySelector(".drop-down-dog-nav");
  mouseTarget.addEventListener("mouseenter", e => {
    ul.classList.remove("mouse-leave");
    ul.classList.add("mouse-enter");
  });
}

function handleLeave() {
  let ul = document.querySelector(".drop-down-dog-list");
  const mouseTarget = document.querySelector(".drop-down-dog-nav");
  mouseTarget.addEventListener("mouseleave", e => {
    ul.classList.remove("mouse-enter");
    ul.classList.add("mouse-leave");
  });
}

handleEnter();
handleLeave();
// const navBar = document.querySelector(".drop-down-dog-nav");
// navBar.addEventListener("mouseenter", handleEnter);
// navBar.addEventListener("mouseleave", handleLeave());
